//
//  HomeModuleInitializer.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import Foundation

final class HomeModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: HomeViewController!
    
    override func awakeFromNib() {
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
