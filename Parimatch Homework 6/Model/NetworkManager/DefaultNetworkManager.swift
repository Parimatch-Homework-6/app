//
//  DefaultNetworkManager.swift
//  Parimatch Homework 6
//
//  Created by Ilya Senchukov on 17.02.2021.
//

import UIKit
import KeychainAccess

enum NetworkError: Error {
    case badImage
}

class DefaultNetworkManager: NetworkManager {
    func dataTask(
        urlRequest: URLRequest,
        completion: @escaping (DataTaskResult) -> Void) {

        let urlSession = getURLSession()

        let task = urlSession.dataTask(with: urlRequest) { (data, res, err) in
            completion((data, res as? HTTPURLResponse, err))
        }

        task.resume()
    }

    private func getURLSession() -> URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true

        let urlSession = URLSession(configuration: config)

        return urlSession
    }
}
