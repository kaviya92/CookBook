//
//  FavouriteModuleInitializer.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import Foundation
final class FavouriteModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: FavouriteViewController!
    override func awakeFromNib() {
        let configurator = FavouriteModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
}
