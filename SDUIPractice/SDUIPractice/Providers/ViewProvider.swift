//
//  ViewProvider.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

protocol ComponentViewProvider {
    
    var data: ViewModelProvider { get set }
    var host: ViewHostController { get set }
    
}
