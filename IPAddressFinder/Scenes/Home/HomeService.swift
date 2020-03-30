//
//  HomeService.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Typealias
typealias FetchIPAddressResult = (Result<IPAddress, ErrorHandler>) -> Void

// MARK: - HomeServiceProtocol
protocol HomeServiceProtocol: AnyObject {
    func fetchIPAddress(_ route: IPAddressRoute, completion: @escaping FetchIPAddressResult)
}

final class HomeService {
    // MARK: - Attributes
    let networkManager: NetworkManagerProtocol

    // MARK: - Initializer
    init(networking: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networking
    }
}

// MARK: - HomeServiceProtocol
extension HomeService: HomeServiceProtocol {
    func fetchIPAddress(_ route: IPAddressRoute, completion: @escaping FetchIPAddressResult) {
        networkManager.requestObject(with: route.configuration, completion: completion)
    }
}
