//
//  Card1View.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 31/07/21.
//

import Foundation
import SwiftUI

struct Card1View: ComponentViewProvider {
    
    var data: Card1ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top ,spacing: 15) {
                Image(systemName: self.data.cardResponse.image_url)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.data.cardResponse.title)
                        .font(.title)
                        .fontWeight(.medium)
                    Text(self.data.cardResponse.subtitle)
                    self.data.header1View
                    
                    HStack {
                        Image(systemName: self.data.cardResponse.header_line_2_icon)
                            .foregroundColor(Color.green)
                        self.data.header2View
                    }
                }
            }.onTapGesture {
                self.data.didTapOnHeader()
            }
            
            Divider()
            
            HStack {
                Image(systemName: self.data.cardResponse.body_line_1_icon)
                Text(self.data.cardResponse.body_line_1)
            }
            
            HStack {
                Image(systemName: self.data.cardResponse.body_line_2_icon)
                Text(self.data.cardResponse.body_line_2)
            }
            
            HStack {
                Image(systemName: self.data.cardResponse.body_line_3_icon)
                Text(self.data.cardResponse.body_line_3)
            }
            
            HStack {
                Spacer()
                
                Button(self.data.cardResponse.primary_cta_text) {
                    self.data.didTapOnPrimaryCTA()
                }
                .font(.system(size: 16, weight: .medium, design: .default))
                .frame(width: 150)
                .padding()
                .background(Color("Azure"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding(10)
    }
    
}

//struct Card1View_Preview: PreviewProvider {
//    
//    static var previews: some View {
//        Card1View(data: )
//    }
//    
//}
