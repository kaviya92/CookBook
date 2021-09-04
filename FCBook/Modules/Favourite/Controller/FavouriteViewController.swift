//
//  FavouriteViewController.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    var model: FavouriteModelInput!
    lazy var contentView: FavouriteViewInput = { return view as! FavouriteViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Favourites"
        contentView.dataSource = FavouriteTableViewDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.loadFavourites()
    }
}
extension FavouriteViewController: FavouriteModelOutput {
    
    func modelDidFail(_ error: Error?) {
        //UIAlertController.show(self, error: error)
    }
    
    func modelDidLoad(_ items: MenuItems) {
        contentView.display(items)
    }
    
}
