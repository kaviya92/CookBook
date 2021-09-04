//
//  HomeViewController.swift
//  FCBook
//
//  Created by Saadhurya on 01/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var model: HomeModelInput!
    lazy var contentView: HomeViewInput = { return view as! HomeViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Foody Cook​Book"
        contentView.dataSource = HomeTableViewDataSource(tableCellViewOutput: self)
        contentView.searchAction = { [unowned self] searchText in
            self.model.searchMealByName(mealName : searchText)
        }
        
        ForeGroundNotifier.shared.addForegroundObserver(observer: self)
        loadRandomMeal()
    }
    
    func loadRandomMeal() {
        model.loadRandomMeal()
    }
    
    deinit {
        ForeGroundNotifier.shared.removeForegroundObserver(observer: self)
    }
}


extension HomeViewController: HomeModelOutput {
    
    func modelDidFail(_ error: Error?) {
        //UIAlertController.show(self, error: error)
    }
    
    func modelDidLoad(_ items: MenuItems) {
        contentView.display(items)
    }
    
}

extension HomeViewController: ForeGroundNotificationObserver {
   
    func appEnteredForeground() {
        loadRandomMeal()
    }
}

extension HomeViewController : HomeTableCellViewOutput {
   
    func updateFavourite(item: MenuItem) {
        FavouritesManager.shared.updateFavourite(item: item)
    }
    
}
