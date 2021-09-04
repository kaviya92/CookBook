//
//  FavouriteView.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import UIKit
protocol FavouriteViewInput: class {
    var dataSource: FavouriteTableViewDataSource! { get set }
    func display(_ items: MenuItems)
    

}
final class FavouriteView: UIView, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    var dataSource: FavouriteTableViewDataSource! {
        didSet {
            tableView.dataSource = dataSource
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}
// MARK: - FeedViewInput
extension FavouriteView: FavouriteViewInput {
   
    
    
    func display(_ items: MenuItems) {
        dataSource.items = items
        tableView.reloadData()
    }
    
}
