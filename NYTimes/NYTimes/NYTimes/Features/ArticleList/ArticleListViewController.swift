//
//  ArticleListViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleListViewController: UIViewController {
    fileprivate var viewModel: ArticleListViewModel
    fileprivate let router: ArticleListRouter
    fileprivate let disposeBag = DisposeBag()

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(withViewModel viewModel: ArticleListViewModel, router: ArticleListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        setupRx()
    }
}

// MARK: Setup
private extension ArticleListViewController {

    func setupViews() {
        title = "NY Times"
        showDefaultNavigationBar()
        view.backgroundColor = .white
        view.addSubview(tableView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupRx() {
        viewModel.fetchArticles()
        viewModel.dataSourceDriver.drive(onNext: { [weak self] _ in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.onLoading
            .map { [weak self] isLoading in

                guard let self = self else {
                    return
                }

                if isLoading {
                    self.view.startActivityIndicator()
                } else {
                    self.view.stopActivityIndicator(tag: 55)
                }
            }
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel.onAlertMessage.map {  [weak self] alert in
            
            guard let self = self else {
                return
            }
            self.tableView.setEmptyView(emptyPlaceHolderType: .alert(alert))
        }.subscribe()
        .disposed(by: disposeBag)
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier) as! ArticleTableViewCell
        let cellViewModel = viewModel.dataSource[indexPath.row]
        cell.bind(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.gotoArticleDetails(viewModel: viewModel.dataSource[indexPath.row])
    }
}
