//
//  Card1ViewFactory.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 03/08/21.
//

import Foundation

struct Card1ViewFactory: ComponentFactoryProvider {
    
    var hostViewModel: ComponentHostViewModelProvider
    
    func create(from sectionInfo: SectionInfo) -> SectionView? {
        var vms = [Card1ViewModel]()
        
        sectionInfo.views.forEach { view in
            if let safeContent = view.content,
               let safeData = try? JSONSerialization.data(withJSONObject: safeContent, options: []),
               let safeVMResponse = try? JSONDecoder().decode(Card1Response.self, from: safeData) {
                
                vms.append(Card1ViewModel(host: hostViewModel,
                                          cardResponse: safeVMResponse,
                                          modifiers: self.generateModifiers(from: view.modifiers),
                                          actions: self.generateActions(from: view.interactions),
                                          events: self.generateEvents(from: view.interactions)))
            }
        }
        
        return SectionView(idViews: vms.map { Card1View(data: $0).asIdentifiableView })
    }
    
    func generateModifiers(from data: Any?) -> Card1Modifiers? {
        var textModifiers = Card1Modifiers()
        if let boldModifierData = (data as? [String : Any])?[ModifierType.bold.rawValue] as? [[String : String]] {
            
            if let headerLine1Index = boldModifierData.firstIndex(where: { $0[Constants.element] == Constants.headerLine1 }),
               let headerLine1Element = boldModifierData[headerLine1Index][Constants.element],
               let headerLine1Identifier = boldModifierData[headerLine1Index][Constants.identifier],
               let headerLine1DisplayText = boldModifierData[headerLine1Index][Constants.displayText] {
                textModifiers.header_line_1 = TextModifier(type: .bold,
                                                           element: headerLine1Element,
                                                           identifier: headerLine1Identifier,
                                                           display_text: headerLine1DisplayText)
            }
            
            if let headerLine2Index = boldModifierData.firstIndex(where: { $0[Constants.element] == Constants.headerLine2 }),
               let headerLine2Element = boldModifierData[headerLine2Index][Constants.element],
               let headerLine2Identifier = boldModifierData[headerLine2Index][Constants.identifier],
               let headerLine2DisplayText = boldModifierData[headerLine2Index][Constants.displayText] {
                textModifiers.header_line_2 = TextModifier(type: .bold,
                                                           element: headerLine2Element,
                                                           identifier: headerLine2Identifier,
                                                           display_text: headerLine2DisplayText)
            }
            
        }
        
        return textModifiers
    }
    
    func generateActions(from data: Any?) -> [InteractionInfo] {
        
        if let onPressData = ((data as? [String : Any])?[Constants.onPress] as? [String : Any]) {
            if let actionData = onPressData[Constants.actions] as? [[String : Any]] {
                return actionData.map { InteractionInfo(type: .press,
                                                        element: $0[Constants.element] as? String ?? "",
                                                        actionType: ActionExpectation(rawValue: $0[Constants.type] as? String ?? "") ?? .none,
                                                        data: $0[Constants.data]) }
            }
        }
        
        return []
    }
    
    func generateEvents(from data: Any?) -> [InteractionInfo] {
        
        if let onPressData = ((data as? [String : Any])?[Constants.onPress] as? [String : Any]) {
            if let eventData = onPressData[Constants.events] as? [[String : Any]] {
                return eventData.map { InteractionInfo(type: .press,
                                                       element: $0[Constants.element] as? String ?? "",
                                                       actionType: ActionExpectation(rawValue: $0[Constants.type] as? String ?? "") ?? .none,
                                                       data: $0[Constants.data]) }
            }
        }
        
        return []
        
    }
}
