//
//  HomeView.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import UIKit

protocol HomeViewInput: class {
    var dataSource: HomeTableViewDataSource! { get set }
    func display(_ items: MenuItems)
    var searchAction: ((String) -> Void)? { get set }

}

final class HomeView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - FeedViewInput
    var searchAction: ((String) -> Void)?
    
    var dataSource: HomeTableViewDataSource! {
        didSet {
            tableView.dataSource = dataSource
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        
        searchBar.delegate = self
        searchBar.placeholder = "Search Food"
       
    }
    
}

// MARK: - FeedViewInput
extension HomeView: HomeViewInput {
    
    func display(_ items: MenuItems) {
        dataSource.items = items
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate
extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
// MARK: - UISearchBar
extension HomeView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         searchBar.showsCancelButton = false
         searchBar.text = ""
         dismissSearchKeybaord()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchAction?(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissSearchKeybaord()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        dismissSearchKeybaord()
    }
    
    func dismissSearchKeybaord() {
        searchBar.resignFirstResponder()
    }
}


