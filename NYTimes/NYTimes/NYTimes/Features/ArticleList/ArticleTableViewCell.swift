//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 09/01/2021.
//

import UIKit
import RxSwift
import Kingfisher

class ArticleTableViewCell: UITableViewCell, CellReusable {

    // MARK: - Properties
    private var bag: DisposeBag = DisposeBag()

    // MARK: - UIControls
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var baseInfoView: UIView = {
           let view = UIView()
        view.backgroundColor = UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    private lazy var articleView: UIView = {
           let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    // MARK: - Intializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        setUpUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.kf.cancelDownloadTask()
        coverImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        bag = DisposeBag()
    }

    // MARK: bind
    func bind(viewModel: ArticleCellViewModel) {
        viewModel.articleCover.drive(onNext: { [weak self] url in
            guard let `self` = self, let url = url else { return }
            self.coverImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
            self.coverImageView.layer.cornerRadius = 5
        }).disposed(by: bag)
        viewModel.articleTitle.drive(titleLabel.rx.text).disposed(by: bag)
        viewModel.articlePublishDate.drive(publishedDateLabel.rx.text).disposed(by: bag)
    }

    private func setUpUI() {
        [coverImageView, baseInfoView].forEach {
            articleView.addSubview($0)
        }
        [titleLabel, publishedDateLabel].forEach {
            baseInfoView.addSubview($0)
        }
        contentView.addSubview(articleView)
        setConstraints()
    }

    // MARK: - AutoLayout
    private func setConstraints() {
        NSLayoutConstraint.activate([
            articleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            articleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            articleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            articleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            //imageView
            coverImageView.leadingAnchor.constraint(equalTo: articleView.leadingAnchor),
            coverImageView.topAnchor.constraint(equalTo: articleView.topAnchor),

            coverImageView.trailingAnchor.constraint(equalTo: articleView.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor),
            //title
            baseInfoView.leadingAnchor.constraint(equalTo: articleView.leadingAnchor),
            baseInfoView.trailingAnchor.constraint(equalTo: articleView.trailingAnchor),
            baseInfoView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: baseInfoView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: publishedDateLabel.topAnchor, constant: -4),

            publishedDateLabel.leadingAnchor.constraint(equalTo: baseInfoView.leadingAnchor, constant: 8),
            publishedDateLabel.bottomAnchor.constraint(equalTo: baseInfoView.bottomAnchor, constant: -8),
            publishedDateLabel.trailingAnchor.constraint(equalTo: baseInfoView.trailingAnchor, constant: -8),
            coverImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }

}
