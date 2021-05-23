//
//  NetworkManager.swift
//  Weather
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 23.05.2021.
//

import Foundation

final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkErrors>) ->  Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponce))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }
        .resume()
    }
}
 
enum NetworkErrors: Error {
    
    case invalidResponce
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}
