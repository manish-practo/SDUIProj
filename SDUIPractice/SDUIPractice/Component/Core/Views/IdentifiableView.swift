//
//  IdentifiableView.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import SwiftUI
import Foundation

struct IdentifiableView: View, Identifiable {
    let id = UUID()
    
    let content: AnyView
    
    var body: some View {
        content
    }
    
}

extension ComponentViewProvider {
    
    var asIdentifiableView: IdentifiableView {
        return IdentifiableView(content: AnyView(self))
    }
    
}
