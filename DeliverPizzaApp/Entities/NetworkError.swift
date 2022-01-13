//
//  NetworkError.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation

enum NetworkError: Error {
    case serverNotResponding
    case noInternetConnection
}
