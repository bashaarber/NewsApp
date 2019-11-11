//
//  Data.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let data:[Data]
}

struct Data: Decodable {
    let clouds: Int
    let wind_spd: Decimal
    let wind_cdir_full: String
    let sunrise: String
    let sunset: String
    let temp: Float
    let app_temp: Decimal
    let weather: weather
}

struct weather: Decodable {
    let icon: String
    let code: String
    let description: String
}
