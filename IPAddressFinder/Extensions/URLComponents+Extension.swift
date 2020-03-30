//
//  URLComponents+Extension.swift
//  IPAddressFinder
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: Any]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
