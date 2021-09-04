//
//  FavouriteModel.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import Foundation
final class FavouriteModel: FavouriteModelInput {
    weak var output: FavouriteModelOutput!

    func loadFavourites() {
         let menuItems = FavouritesManager.shared.getFavourites()
         output.modelDidLoad(menuItems)
    }
}
