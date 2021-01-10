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
    internal var viewModel: ArticleCellViewModel!
    

    fileprivate let disposeBag = DisposeBag()

    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image_placeholder_icon"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "YoyoGrayColor")
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let publishedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "YoyoGrayColor")
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var baseInfoView: UIView = {
           let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    private var placeHolder: EmptyPlaceHolderView = {
        let view = EmptyPlaceHolderView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    private var bag: DisposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
        setupLayout()
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupRx()
    }
}

// MARK: Setup
private extension ArticleDetailsViewController {

    func setupViews() {
        showDefaultNavigationBar()
        [coverImageView, baseInfoView].forEach {
            view.addSubview($0)
        }
        [titleLabel, publishedDateLabel].forEach {
            baseInfoView.addSubview($0)
        }
    }

    func setupLayout() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            //imageView
            coverImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            coverImageView.topAnchor.constraint(equalTo: margins.topAnchor),
            
            coverImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: baseInfoView.topAnchor, constant: -10),
            //title
            //baseInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
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
    
    func setupRx() {
        guard let comingViewModel = viewModel else {
            setupPlaceHolder()
            return
        }
        comingViewModel.articleCover.drive(onNext: { [weak self] url in
            guard let `self` = self, let url = url else { return }
            self.coverImageView.kf.setImage(with: url)
            self.coverImageView.layer.cornerRadius = 5
        }).disposed(by: bag)
        comingViewModel.articleTitle.drive(titleLabel.rx.text).disposed(by: bag)
        comingViewModel.articlePublishDate.drive(publishedDateLabel.rx.text).disposed(by: bag)
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

