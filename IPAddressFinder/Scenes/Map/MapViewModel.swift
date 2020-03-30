//
//  MapViewModel.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - MapViewModelProtocol
protocol MapViewModelProtocol {
    var ipAddress: IPAddress { get }

    func getTitle() -> String
}

final class MapViewModel: MapViewModelProtocol {
    // MARK: - Attributes
    var ipAddress: IPAddress

    // MARK: - Initializer
    init(ipAddress: IPAddress) {
        self.ipAddress = ipAddress
    }

    // MARK: - Functions
    func getTitle() -> String {
        "\(ipAddress.query) \n\(ipAddress.city) - \(ipAddress.country)"
    }
}
