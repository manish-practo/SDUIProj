//
//  ComponentFactory.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import SwiftUI
import Foundation

struct ComponentFactory {
    
    let host: ComponentHostViewModelProvider
    
    func create(from data: Data) -> PageInfo? {
        
        if let decodedData = self.getDict(from: data),
           let layoutData = self.getDict(from: decodedData[Constants.layout]),
           let sections = decodedData[Constants.sections] as? [[String : Any]] {
            
            // Body
            if let bodyLayout = self.getDict(from: layoutData, with: ViewLayout.body.rawValue),
               let bodySectionIds = (bodyLayout[Constants.sectionDetails] as? [[String : String]] )?.compactMap({ $0[Constants.sectionId] }) {
                let viewInfos = self.getViewInfo(from: sections, sectionKeys: bodySectionIds)
                
                return PageInfo(navigationBar: nil,
                                content: viewInfos.compactMap { self.generateView(from: $0) },
                                footer: nil)
            }
        }
        
        return nil
        
    }
    
    func getViewInfo(from sectionDetails: [[String : Any]], sectionKeys: [String]) -> [SectionInfo] {
        let viewInfoDict = sectionDetails.filter { sectionKeys.contains(self.getSafeString(from: $0[Constants.id])) }
        
        var viewInfo = [ViewInfo]()
        viewInfoDict.forEach {
            let section = self.getDict(from: $0[Constants.section])
            
            viewInfo.append(ViewInfo(type: ViewType(rawValue: self.getSafeString(from: section?[Constants.id]))!,
                                     content: self.getDict(from: section, with: Constants.content),
                                     modifiers: self.getDict(from: section, with: Constants.modifiers),
                                     interactions: self.getDict(from: section, with: Constants.interactions)))
        }
        
        // Note:
        // This will limit the mixing of view types in one section
        // Each section can have only one view type
        var sectionInfo = [SectionInfo]()
        while viewInfo.first != nil {
            let firstViewType = viewInfo.first?.type
            let groupViews = viewInfo.filter { $0.type == firstViewType }
            sectionInfo.append(SectionInfo(viewType: groupViews.first!.type,
                                           views: groupViews))
            
            viewInfo.removeAll { $0.type == firstViewType }
        }
        
        return sectionInfo
    }
    
    func generateView(from sectionInfo: SectionInfo) -> SectionView? {
        
        switch sectionInfo.viewType {
        case .filter_1:
            return Filter1ViewFactory(hostViewModel: self.host).create(from: sectionInfo)
        case .card_1:
            return Card1ViewFactory(hostViewModel: self.host).create(from: sectionInfo)
        case .navigation:
            break
        case .info:
            break
        }
        
        return nil
    }
    
}

// MARK: - Helpers
extension ComponentFactory {
    
    func isMultiSection(sectionInfo: [String : Any]) -> Bool {
        return (sectionInfo[Constants.type] as? String) == Constants.multiSection
    }
    
    func getSafeString(from anyType: Any?) -> String {
        return anyType as? String ?? ""
    }
    
    func getDict(from jsonData: Data?) -> [String : Any]? {
        guard let safeJSONData = jsonData else { return nil }
        
        return try? JSONSerialization.jsonObject(with: safeJSONData, options: []) as? [String : Any]
    }
    
    func getDict(from anyType: Any?, with key: String? = nil) -> [String : Any]? {
        if let safeType = anyType as? [String : Any] {
            if let safeKey = key {
                return self.getDict(from: safeType[safeKey], with: nil)
            }
            
            return safeType
        }
        
        return nil
    }
    
    func getArrDict(from anyType: Any?, with key: String? = nil) -> [[String : Any]]? {
        if let safeType = anyType as? [String : Any] {
            if let safeKey = key {
                return safeType[safeKey] as? [[String : Any]]
            }
            
            return [safeType]
        }
        
        return nil
    }
    
}
