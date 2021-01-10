//
//  ArticleDetailsViewController.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//  Copyright (c) 2021 com.kelany. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleDetailsViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ArticleCellViewModel!
    private var disposeBag = DisposeBag()

    // MARK: - UIControls
    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var baseInfoView: UIView = {
           let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    lazy var placeHolder: EmptyPlaceHolderView = {
        let view = EmptyPlaceHolderView(frame: .zero)
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    // MARK: - Intializers
    

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

// MARK: Setup
private extension ArticleDetailsViewController {

    func setupUI() {
        view.backgroundColor = UIColor(red: 60/255, green: 110/255, blue: 113/255, alpha: 1.0)
        guard let comingViewModel = viewModel else {
            setupPlaceHolder()
            return
        }
        setupViews()
        setupLayout()
        setupRx(comingViewModel: comingViewModel)
    }
    func setupViews() {
        showDefaultNavigationBar()
        [coverImageView, baseInfoView].forEach {
            view.addSubview($0)
        }
        [titleLabel, publishedDateLabel].forEach {
            baseInfoView.addSubview($0)
        }
    }

    // MARK: - AutoLayout
    func setupLayout() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            //imageView
            coverImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            coverImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),

            coverImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: baseInfoView.topAnchor, constant: -10),
            //title
            baseInfoView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            baseInfoView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            baseInfoView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: baseInfoView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: publishedDateLabel.topAnchor, constant: -4),

            publishedDateLabel.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            publishedDateLabel.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -8),
            coverImageView.heightAnchor.constraint(equalToConstant: view.bounds.height*0.4)

        ])
    }

    func setupRx(comingViewModel: ArticleCellViewModel) {

        comingViewModel.articleCover.drive(onNext: { [weak self] url in
            guard let `self` = self, let url = url else { return }
            self.coverImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
            self.coverImageView.layer.cornerRadius = 10
        }).disposed(by: disposeBag)
        comingViewModel.articleTitle.drive(titleLabel.rx.text).disposed(by: disposeBag)
        comingViewModel.articlePublishDate.drive(publishedDateLabel.rx.text).disposed(by: disposeBag)
    }

    func setupPlaceHolder() {
        view.addSubview(placeHolder)
        NSLayoutConstraint.activate([
            placeHolder.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            placeHolder.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        placeHolder.emptyPlaceHolderType = .alert(AlertMessage(title: "Welcome To Our App", message: "Select your Item"))
    }
}
