//
//  HomeTableViewCell.swift
//  FCBook
//
//  Created by Saadhurya on 03/09/21.
//

import UIKit
import SDWebImage

protocol MenuItemViewType {
    func display(_ item: MenuItem)
    func favouriteBtn(visiblity : Bool)
}

protocol HomeTableCellViewOutput: class {
    func updateFavourite(item : MenuItem)
}


class HomeTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String = "\(String(describing: self))"
    @IBOutlet var imgmeal : UIImageView!
    @IBOutlet var lblmeaName : UILabel!
    @IBOutlet var btnFavourite : UIButton!
    private weak var output : HomeTableCellViewOutput?
    private var menuItem : MenuItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTableViewCellOutput(output : HomeTableCellViewOutput?) {
        self.output = output
    }
    
    func updateFavouriteBtn(item: MenuItem) {
        if FavouritesManager.shared.isFavouriteMenu(item: item) {
            btnFavourite.setImage(UIImage(named: "Heart") , for: .normal)
        } else {
            btnFavourite.setImage(UIImage(named: "favourite") , for: .normal)
        }
    }
    
    @IBAction func btnFavouriteClick(sender : UIButton) {
        
        if let cellOutput = self.output {
            if let item = menuItem {
                cellOutput.updateFavourite(item: item)
                updateFavouriteBtn(item: item)
            }
        }
    }
 
}

// MARK: - FeedItemViewType
extension HomeTableViewCell: MenuItemViewType {
    
    func display(_ item: MenuItem) {
      
        self.menuItem = item
        lblmeaName.text = ""
        
        if let imgUrl = item.strMealThumb {
            imgmeal.layer.cornerRadius = 10
            imgmeal.sd_setImage(with: URL(string: imgUrl),
                                placeholderImage: nil,
                                options: SDWebImageOptions.fromLoaderOnly ,
                                progress: nil,
                                completed: nil)
            
        }
        
        if let mealName = item.strMeal {
            lblmeaName.text = mealName
        }
        updateFavouriteBtn(item: item)
    }
    
    func favouriteBtn(visiblity : Bool) {
        btnFavourite.isHidden = !visiblity
    }
    
}
