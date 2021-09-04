//
//  FavouriteTableViewDataSource.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import UIKit
final class FavouriteTableViewDataSource: NSObject {

    var items: MenuItems = MenuItems()
    
}
// MARK: - UITableViewDataSource
extension FavouriteTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let favourites = items.meals {
            return favourites.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.meals![indexPath.row]
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier) as! HomeTableViewCell
        cell.display(item)
        cell.favouriteBtn(visiblity: false)
        return cell
    }
    
}
