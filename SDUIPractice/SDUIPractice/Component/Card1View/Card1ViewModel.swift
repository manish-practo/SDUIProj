//
//  Card1ViewModel.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import SwiftUI
import Foundation

struct Card1Modifiers {
    var header_line_1: TextModifier?
    var header_line_2: TextModifier?
}

struct Card1ViewModel: ComponentViewModelProvider, ComponentInteractionsProvider {
    var host: ComponentHostViewModelProvider
    var cardResponse: Card1Response
    var modifiers: Card1Modifiers?
    
    var actions: [InteractionInfo]
    var events: [InteractionInfo]
}

// MARK: - Header Views
extension Card1ViewModel {
    
    var header1View: Text? {
        if let safeText = modifiers?.header_line_1?.display_text {
            return Text(safeText)
                        .fontWeight(.bold)
        }
        
        return nil
    }
    
    var header2View: Text? {
        if let safeText = modifiers?.header_line_2 {
            return Text(safeText.display_text)
                .fontWeight(.bold)
                +
                Text(cardResponse.header_line_2.replacingOccurrences(of: safeText.identifier, with: ""))
        }
        
        return nil
    }
    
}

extension Card1ViewModel {
    
    func didTapOnHeader() {
        
        if let headerTapActionIndex = self.actions.firstIndex(where: { $0.element == Constants.header }),
           let headerTapActionData = self.actions[headerTapActionIndex].data as? [String : String] {
            
            let headerTapActionExpectation = self.actions[headerTapActionIndex].actionType
            
            if headerTapActionExpectation == .deeplink {
                self.host.pushDeeplink(with: headerTapActionData[Constants.url] ?? "")
            }
        }
        
        if let headerTapEventIndex = self.events.firstIndex(where: { $0.element == Constants.header }),
           let headerTapEventData = self.events[headerTapEventIndex].data {
            
            let headerTapEventExpectation = self.events[headerTapEventIndex].actionType
            
            if headerTapEventExpectation == .pel {
                self.host.triggerEvent(with: headerTapEventData as? [String : Any] ?? [:])
            }
        }
        
    }
    
    func didTapOnPrimaryCTA() {
        // Action
        if let headerTapActionIndex = self.actions.firstIndex(where: { $0.element == Constants.primaryCta }),
           let headerTapActionData = self.actions[headerTapActionIndex].data as? [String : String] {
            
            let headerTapActionExpectation = self.actions[headerTapActionIndex].actionType
            
            if headerTapActionExpectation == .deeplink {
                self.host.pushDeeplink(with: headerTapActionData[Constants.url] ?? "")
            }
        }
        
        // Event
        if let headerTapEventIndex = self.events.firstIndex(where: { $0.element == Constants.primaryCta }),
           let headerTapEventData = self.events[headerTapEventIndex].data {
            
            let headerTapEventExpectation = self.events[headerTapEventIndex].actionType
            
            if headerTapEventExpectation == .pel {
                self.host.triggerEvent(with: headerTapEventData as? [String : Any] ?? [:])
            }
        }
    }
    
}
