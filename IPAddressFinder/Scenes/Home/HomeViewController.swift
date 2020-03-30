//
//  HomeViewController.swift
//  IPAddressFinder
//
//  Created by Siqueira on 28/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = String.localized(by: "InsertIPAddress")
        }
    }
    @IBOutlet private weak var ipAddress: UITextField!
    @IBOutlet private weak var checkButton: UIButton! {
        didSet {
            checkButton.setTitle(String.localized(by: "CheckIPAddress"), for: .normal)
            checkButton.layer.cornerRadius = 10.0
        }
    }
    
    // MARK: - Attributes
    private var viewModel: HomeViewModelProtocol

    // MARK: - Initializer
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "HomeViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinds()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeBackButtonText()
    }

    // MARK: - Functions
    private func setupBinds() {
        viewModel.showAlert.bind { [weak self] showAlert in
            if showAlert {
                self?.showAlert(message: String.localized(by: "EmptyIPAddress"))
            }
        }

        viewModel.ipAddress.bind { [weak self] ipAddress in
            guard let self = self, let ipAddress = ipAddress else { return }

            let viewModel = MapViewModel(ipAddress: ipAddress)
            let viewController = MapViewController(viewModel: viewModel)

            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    private func setupUI() {
        title = String.localized(by: "IPAddressFinder")
    }

    // MARK: - Actions
    @IBAction private func didTapOnCheckButton(_ sender: UIButton) {
        viewModel.didTapCheckIpAddress(ip: ipAddress.text)
    }
}
