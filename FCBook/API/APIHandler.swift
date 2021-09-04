//
//  APIHandler.swift
//  FCBook
//
//  Created by Saadhurya on 01/09/21.
//

import UIKit
import Alamofire

let API_URL : String = "https://www.themealdb.com/api/json/v1/1/"

enum API_METHOD : String {
    case random = "random.php",
         search = "search.php?s="
}

typealias APISuccessCallback = (Data) -> ()
typealias APIErrorCallback = () -> ()

class APIHandler : NSObject {

    static func get(method : API_METHOD,
                    params : String?,
                    successCallback : @escaping APISuccessCallback,
                    errorCallback : @escaping APIErrorCallback ) {

        var apiEndpoint: String = API_URL + method.rawValue
        
        if let param = params {
            apiEndpoint = apiEndpoint + param
        }
        LoadingIndicator.shared.showLoading()
        Alamofire.request(apiEndpoint, method: .get).responseData(completionHandler: { (responseData) in
            
            if let data = responseData.data {
                successCallback(data)
            } else {
                errorCallback()
            }
            //LoadingIndicator.shared.hideLoading()
        })
           
    }

}
