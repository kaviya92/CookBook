//
//  ForeGroundNotifier.swift
//  FCBook
//
//  Created by Saadhurya on 03/09/21.
//

import UIKit


protocol ForeGroundNotificationObserver {
    func appEnteredForeground()
}


class ForeGroundNotifier  {
    
    static let shared = ForeGroundNotifier()
    
    private init() {
        
    }
    
    func addForegroundObserver(observer : ForeGroundNotificationObserver) {
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) {  notification in
            observer.appEnteredForeground()
        }
    }
    
    func removeForegroundObserver(observer : ForeGroundNotificationObserver) {
        NotificationCenter.default.removeObserver(observer)
    }
    
}
