//
//  ComponentInteractionsProvider.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

protocol ComponentInteractionsProvider {
    
    var actions: [InteractionInfo] { get set }
    var events: [InteractionInfo] { get set }
    
}

protocol ActionDataProvider {
    
}
