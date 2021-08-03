//
//  ContentView.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 31/07/21.
//

import SwiftUI

struct ContentViewModel: ComponentHostViewModelProvider {
    
    private(set) var data: PageInfo?
    
    mutating func loadData() {
        self.data = ComponentFactory(host: self).create(from: CustomJSONDecoder().loadJSONData())!
    }
    
    func triggerEvent(with eventInfo: [String : Any]) {
        print("PEL Event: \(eventInfo)")
    }
    
    func pushDeeplink(with link: String) {
        print("Deeplink: \(link)")
    }
}

struct ContentView: View {
    
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        
        if let safeContent = self.viewModel.data?.content {
            ScrollView {
                ForEach(safeContent, id: \.id) { content in
                    content
                }
            }
        } else {
            Text("Loading...")
                .onAppear(perform: {
                    self.viewModel.loadData()
                })
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
