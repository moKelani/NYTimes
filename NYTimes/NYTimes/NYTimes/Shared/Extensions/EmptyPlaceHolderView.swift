//
//  EmptyPlaceHolderView.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import UIKit

enum EmptyPlaceHolderType {
    case error
    case alert(_ alert: AlertMessage)
}

class EmptyPlaceHolderView: UIView {

    var emptyPlaceHolderType: EmptyPlaceHolderType = .error {
        didSet {
            switch emptyPlaceHolderType {
            case .alert(let alert):
                titleLabel.text = alert.title
                detailsLabel.text = alert.message
            case .error:
                titleLabel.text = ""
                detailsLabel.text = "Something Went Wrong"
            }

        }
    }
    static func handleErrorPlaceHolderType(alertMessage: AlertMessage) {

    }

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing =  0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailsLabel)
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .clear
        addSubview(contentStackView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
