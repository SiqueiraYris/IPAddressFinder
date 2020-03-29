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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ipAddress: UITextField!
    @IBOutlet private weak var checkButton: UIButton!
    
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

    // MARK: - Actions
    @IBAction private func didTapOnCheckButton(_ sender: UIButton) {
        viewModel.didTapCheckIpAddress(ip: ipAddress.text)
    }
}
