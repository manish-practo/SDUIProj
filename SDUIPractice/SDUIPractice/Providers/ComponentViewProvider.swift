//
//  ComponentViewProvider.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import SwiftUI
import Foundation

protocol ComponentViewProvider: View {
    
    associatedtype ViewModelType: ComponentViewModelProvider
    var data: ViewModelType { get set }
    
}
