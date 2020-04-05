//
//  HomeView.swift
//  IPAddressFinder
//
//  Created by Siqueira on 04/04/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

// MARK: - HomeViewDelegate
protocol HomeViewDelegate: AnyObject {
    func onTapCheckButton(ipAddress: String?)
}

final class HomeView: UIView {
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = String.localized(by: "InsertIPAddress")
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var ipAddress: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.tintColor = .black
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(String.localized(by: "CheckIPAddress"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)

        return button
    }()

    // MARK: - Attributes
    private weak var delegate: HomeViewDelegate?

    // MARK: - Initializer
    init(with delegate: HomeViewDelegate?) {
        super.init(frame: .zero)

        self.delegate = delegate

        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions
    @objc private func didTapCheckButton() {
        delegate?.onTapCheckButton(ipAddress: ipAddress.text)
    }
}

// MARK: - ViewConfiguration
extension HomeView: ViewConfiguration {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            ipAddress.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            ipAddress.widthAnchor.constraint(equalToConstant: 250),
            ipAddress.centerXAnchor.constraint(equalTo: centerXAnchor),

            checkButton.topAnchor.constraint(equalTo: ipAddress.bottomAnchor, constant: 25),
            checkButton.widthAnchor.constraint(equalToConstant: 150),
            checkButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(ipAddress)
        addSubview(checkButton)
    }

    func configureViews() {
        backgroundColor = .white
    }
}
