//
//  API+Extensions.swift
//  Weather
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 23.05.2021.
//

import Foundation

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=metric"
    }
}
 
