//
//  FavouriteModelOutput.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import Foundation
protocol FavouriteModelOutput: class {
    func modelDidLoad(_ items: MenuItems)
    func modelDidFail(_ error: Error?)
}
