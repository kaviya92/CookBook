//
//  HomeModel.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import Foundation

final class HomeModel: HomeModelInput {
    
    weak var output: HomeModelOutput!
    
    func loadRandomMeal() {

        APIHandler.get(method: .random,
                       params: nil,
                       successCallback: { [weak self] (data) in
            
                        do {
                            let items = try JSONDecoder().decode(MenuItems.self, from: data)
                            self?.output.modelDidLoad(items)
                        } catch {
                            self?.output.modelDidFail(error)
                        }
            
        }, errorCallback: {
            
        })

    }
    func searchMealByName(mealName : String) {
        
        APIHandler.get(method: .search, params: mealName , successCallback: { [weak self] (data) in
            
            do {
                let items = try JSONDecoder().decode(MenuItems.self, from: data)
                self?.output.modelDidLoad(items)
            } catch {
                self?.output.modelDidFail(error)
            }
            
        }, errorCallback: {
            
        })
    }
    
}
