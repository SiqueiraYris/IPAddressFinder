//
//  IPAddressRoute.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

enum IPAddressRoute: NetworkRoute {
    case fetchIpAddress

    var configuration: RequestConfiguration {
        switch self {
        case .fetchIpAddress:
            let config = RequestConfiguration(host: serverHost,
                                       path: ipPath,
                                       method: .get,
                                       encoding: .url)
            return config
        }
    }
}
