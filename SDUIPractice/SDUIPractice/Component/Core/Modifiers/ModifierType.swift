//
//  ModifierType.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 03/08/21.
//

import Foundation

enum ModifierType: String, Decodable {
    case bold
    
    var modelType: ModifierModelType {
        switch self {
        case .bold:
            return .text
        }
    }
}

enum ModifierModelType {
    case text
}
