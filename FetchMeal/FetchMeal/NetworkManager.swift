//
//  Untitled.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/19/24.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    public func fetch<T: Decodable>(type: T.Type, from url: URL) async -> T? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            print("Unable to fetch and decode from \(url.absoluteString): \(error.localizedDescription)")
        }
        return nil
    }
}

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(type: T.Type, from url: URL) async -> T?
}
