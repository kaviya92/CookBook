//
//  HomeModuleConfigurator.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import Foundation

final class HomeModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: HomeViewController) {
        let model = HomeModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
