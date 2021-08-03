//
//  ComponentHostViewController.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

protocol ComponentHostViewModelProvider {
    
    func triggerEvent(with eventInfo: [String : Any])
    
    func pushDeeplink(with link: String)
    
}
