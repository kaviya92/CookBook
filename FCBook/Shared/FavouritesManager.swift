//
//  FavouritesManager.swift
//  FCBook
//
//  Created by Saadhurya on 03/09/21.
//

import UIKit

class FavouritesManager  {
    
    static let shared = FavouritesManager()
    private var favourites : MenuItems
    
    private init() {
        favourites = MenuItems()
        favourites.meals = [MenuItem]()
    }
    
    func getFavourites() -> MenuItems {
        return favourites
    }
    
    func updateFavourite(item : MenuItem) {
        if let eItem = checkMenuItemAlreadyExists(item: item){
            remove(item: eItem)
        } else {
            favourites.meals?.append(item)
        }
    }
    
    func isFavouriteMenu(item : MenuItem) -> Bool {
        if checkMenuItemAlreadyExists(item: item) == nil {
            return false
        }
        return true
    }
    
    private func remove(item : MenuItem) {
        if let eItem = checkMenuItemAlreadyExists(item: item) {
            if let removeindex = favourites.meals?.firstIndex(of: eItem),
               (removeindex >= 0 && removeindex < favourites.meals!.count) {
                favourites.meals?.remove(at: removeindex)
            }
        }
    }
    
    private func checkMenuItemAlreadyExists(item : MenuItem) -> MenuItem? {
        return favourites.meals!.filter{ $0.idMeal == item.idMeal }.first
    }
}

