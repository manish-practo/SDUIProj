//
//  Filter1ViewFactory.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

struct Filter1ViewFactory: ComponentFactoryProvider {
    
    var hostViewModel: ComponentHostViewModelProvider
    
    func create(from sectionInfo: SectionInfo) -> SectionView? {
        
        if let filterJsonData = sectionInfo.views.first?.content as? [String : Any] {
            var vms = [Filter1ViewModel]()
            
            if let availabilityFilter = filterJsonData["first_cta_text"] as? String {
                vms.append(Filter1ViewModel(host: self.hostViewModel, title: availabilityFilter))
            }
            
            if let languageFilter = filterJsonData["second_cta_text"] as? String {
                vms.append(Filter1ViewModel(host: self.hostViewModel, title: languageFilter))
            }
            
            return SectionView(axis: .horizontal ,idViews: vms.map { Filter1View(data: $0).asIdentifiableView })
        } else {
            assertionFailure()
            return nil
        }
    }
    
}
