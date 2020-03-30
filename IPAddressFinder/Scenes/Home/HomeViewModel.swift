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
    var error: Dynamic<Error?> { get }
    var ipAddress: Dynamic<IPAddress?> { get }
    var showAlert: Dynamic<Bool> { get }
    var loading: Dynamic<Bool> { get }

    func didTapCheckIpAddress(ip: String?)
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Attributes
    private var service: HomeServiceProtocol
    var error: Dynamic<Error?> = Dynamic(nil)
    var ipAddress: Dynamic<IPAddress?> = Dynamic(nil)
    var showAlert: Dynamic<Bool> = Dynamic(false)
    var loading: Dynamic<Bool> = Dynamic(false)

    // MARK: - Initializer
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }

    // MARK: - Functions
    func didTapCheckIpAddress(ip: String?) {
        if let ip = ip, !ip.isEmpty {
            fetchIpAddressDetail(ip: ip)
        } else {
            showAlert.value = true
        }
    }

    private func fetchIpAddressDetail(ip: String) {
        let route = IPAddressRoute.fetchIpAddress(ip)
        loading.value = true

        service.fetchIPAddress(route) { [weak self] (result: Result<IPAddress, ErrorHandler>) in
            guard let self = self else { return }

            self.loading.value = false

            switch result {
            case .success(let dataSource):
                self.ipAddress.value = dataSource

            case .failure(let error):
                self.error.value = error
            }
        }
    }
}
