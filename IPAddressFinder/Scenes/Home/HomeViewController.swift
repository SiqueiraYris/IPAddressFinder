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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction private func didTapOnCheckButton(_ sender: UIButton) {
    }
}
