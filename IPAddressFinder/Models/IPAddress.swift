//
//  IPAddress.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Random
struct IPAddress: Codable {
    let status, country, countryCode, region: String
    let regionName, city, zip: String
    let lat, lon: Double
    let timezone, isp, org, randomAs: String
    let query: String

    enum CodingKeys: String, CodingKey {
        case status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org
        case randomAs = "as"
        case query
    }
}
