//
//  Filter1View.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 31/07/21.
//

import Foundation
import SwiftUI

struct Filter1View: ComponentViewProvider {
    
    var data: Filter1ViewModel
    
    var body: some View {
        HStack {
            Text(data.title)
            Image(systemName: data.isExpanded ? "arrow.up" : "arrow.down")
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.purple, lineWidth: 2)
        )
    }
    
}

//struct Filter1View_Preview: PreviewProvider {
//
//    static var previews: some View {
//        Filter1View(data: Filter1ViewModel(title: "Language"))
//    }
//
//}
