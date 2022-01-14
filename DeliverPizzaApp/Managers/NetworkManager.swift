//
//  NetworkManager.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let urlString: String = "https://mockend.com/Hank2354/DeliverPizzaApp/menu"
    
    func fetchMenuData(completion: @escaping (Result<MenuDataModel, NetworkError>) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.noInternetConnection))
                    return
                }
                
                switch httpResponse.statusCode {
                    
                case 500:  completion(.failure(.serverNotResponding))
                case 502:  completion(.failure(.serverNotResponding))
                case 504:  completion(.failure(.serverNotResponding))
                case 1009: completion(.failure(.noInternetConnection))
                default:   completion(.failure(.noInternetConnection))
                    
                }
                
                return
                
            }
            
            guard let menuDataModel = self.parseJSON(data: data) else { return }
            
            completion(.success(menuDataModel))
            
        }
        
        task.resume()
        
    }
    
    func fetchDiscountData(completion: @escaping(DiscountItemModels) -> ()) {
        
        // mock data
        let discounts = [
            
            DiscountItemModel(image: .discountSale30),
            DiscountItemModel(image: .discountBirthday),
            DiscountItemModel(image: .discountFreePizza)
            
            
        ]
        
        completion(discounts)
    }
    
    private func parseJSON(data: Data) -> MenuDataModel? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let menuData = try decoder.decode(MenuDataModel.self, from: data)
            return menuData
            
        } catch let error as NSError {
            
            print("\(error.localizedDescription)")
            return nil
            
        }
        
    }
    
}
