//
//  Filter1ViewModel.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

struct Filter1ViewModel: ComponentViewModelProvider {
    let id = UUID()
    let host: ComponentHostViewModelProvider
    
    let title: String
    var isExpanded = false
    
}
