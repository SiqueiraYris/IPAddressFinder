//
//  HomeViewModel.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol {
    func didTapCheckIpAddress(ip: String?)
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Attributes

    // MARK: - Initializer
    init() {
    }

    // MARK: - Functions
    func didTapCheckIpAddress(ip: String?) {
        if let ip = ip, !ip.isEmpty {
            //continue
        } else {
            //show error
        }
    }
}
