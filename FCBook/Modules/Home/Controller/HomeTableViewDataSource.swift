//
//  HomeTableViewDataSource.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import UIKit

final class HomeTableViewDataSource: NSObject {
    
    weak var tableCellViewOutput : HomeTableCellViewOutput?
    var items: MenuItems = MenuItems()
    
    required init(tableCellViewOutput : HomeTableCellViewOutput) {
        self.tableCellViewOutput = tableCellViewOutput
    }
    
}

// MARK: - UITableViewDataSource
extension HomeTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let meals = items.meals {
            return meals.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.meals![indexPath.row]
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier) as! HomeTableViewCell
        cell.setTableViewCellOutput(output: tableCellViewOutput)
        cell.display(item)
        return cell
    }
    
}
