//
//  HomeModelOutput.swift
//  FCBook
//
//  Created by Saadhurya on 02/09/21.
//

import Foundation

protocol HomeModelOutput: class {
    func modelDidLoad(_ items: MenuItems)
    func modelDidFail(_ error: Error?)
}
