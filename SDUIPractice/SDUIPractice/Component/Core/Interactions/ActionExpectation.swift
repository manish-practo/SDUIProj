//
//  ActionExpectation.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 03/08/21.
//

import Foundation

enum ActionExpectation: String {
    case popBack = "native_action"
    case deeplink = "redirect"
    case openBottomSheet = "open_bottom_sheet"
    case pel = "pel"
    case none = ""
}
