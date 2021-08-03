//
//  SectionView.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import SwiftUI
import Foundation

struct SectionView: View, Identifiable {
    let id = UUID()
    
    var axis = Axis.Set.vertical
    let idViews: [IdentifiableView]
    
    var body: some View {
        if self.axis == Axis.Set.horizontal {
            ScrollView(axis) {
                HStack {
                    ForEach(idViews, id: \.id) { view in
                        view
                    }
                }
            }
        } else {
            ScrollView {
                ForEach(idViews, id: \.id) { view in
                    view
                }
            }
        }
    }
    
}
