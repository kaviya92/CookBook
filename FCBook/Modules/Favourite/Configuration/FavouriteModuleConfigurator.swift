//
//  FavouriteModuleConfigurator.swift
//  FCBook
//
//  Created by Saadhurya on 04/09/21.
//

import Foundation
final class FavouriteModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? FavouriteViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: FavouriteViewController) {
        let model = FavouriteModel()
        model.output = viewController
        
        viewController.model = model
    }
}
