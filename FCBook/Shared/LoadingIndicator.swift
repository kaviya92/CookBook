//
//  LoadingIndicator.swift
//  FCBook
//
//  Created by Saadhurya on 03/09/21.
//

import Foundation
import NVActivityIndicatorView

class LoadingIndicator {
    
    static let shared = LoadingIndicator()
    let sizeRect = UIScreen.main.bounds
    static var indicatorView : NVActivityIndicatorView?
    
    private init() {
        
    }
    
    func showLoading() {        
        DispatchQueue.main.async { [unowned self] in
            hideLoading()
            if let topVC = UIApplication.shared.topMostViewController() {
                LoadingIndicator.indicatorView = NVActivityIndicatorView(frame: sizeRect,
                                                        type: .circleStrokeSpin,
                                                        color: .black,
                                                        padding: 0)
                topVC.view.addSubview(LoadingIndicator.indicatorView!)
                LoadingIndicator.indicatorView?.startAnimating()
            }
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            LoadingIndicator.indicatorView?.removeFromSuperview()
            LoadingIndicator.indicatorView?.stopAnimating()
            LoadingIndicator.indicatorView = nil
        }
    }
    
}
