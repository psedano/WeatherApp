//
//  SearchResultModel.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 20/10/23.
//

import Foundation

struct SearchResultModel: Codable {
    let name: String
    let local_names: [String: String]?
    let lat: Double
    let lon: Double
    let country: String
    let state: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        local_names = try container.decodeIfPresent([String: String].self, forKey: .local_names)
        name = try container.decode(String.self, forKey: .name)
        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        country = try container.decode(String.self, forKey: .country)
        state = try container.decodeIfPresent(String.self, forKey: .state)
    }
}

extension Double {
    func toFarenheit() -> String {
        return String(format: "%.0f", (self - 273) * 1.8 + 32)
    }
}
