//
//  HomeViewController.swift
//  IPAddressFinder
//
//  Created by Siqueira on 28/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Components
    private lazy var homeView: HomeView = {
        let view = HomeView(with: self)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    // MARK: - Attributes
    private var viewModel: HomeViewModelProtocol

    // MARK: - Initializer
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

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

        setupViewConfiguration()
        hideKeyboard()
    }
}

// MARK: - ViewConfiguration
extension HomeViewController: ViewConfiguration {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func buildViewHierarchy() {
        view.addSubview(homeView)
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func onTapCheckButton(ipAddress: String?) {
        viewModel.didTapCheckIpAddress(ip: ipAddress)
    }
}
