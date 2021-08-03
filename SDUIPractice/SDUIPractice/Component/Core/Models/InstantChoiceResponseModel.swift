//
//  InstantChoiceResponseModel.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 31/07/21.
//

import Foundation

// MARK: - InstantChoiceResponseModel
struct InstantChoiceResponseModel: Codable {
    let id: String
    let version: Int
    let layout: Layout
    let sections: [SectionElement]
}

// MARK: - Layout
struct Layout: Codable {
    let nav, body: Body
    let footer: Footer
}

// MARK: - Body
struct Body: Codable {
    let type: String
    let sectionDetails: [SectionDetail]

    enum CodingKeys: String, CodingKey {
        case type
        case sectionDetails = "section_details"
    }
}

// MARK: - SectionDetail
struct SectionDetail: Codable {
    let sectionID: String

    enum CodingKeys: String, CodingKey {
        case sectionID = "section_id"
    }
}

// MARK: - Footer
struct Footer: Codable {
    let type: String
    let sectionDetails: SectionDetails

    enum CodingKeys: String, CodingKey {
        case type
        case sectionDetails = "section_details"
    }
}

// MARK: - SectionDetails
struct SectionDetails: Codable {
}

// MARK: - SectionElement
struct SectionElement: Codable {
    let id: String
    let section: SectionSection
}

// MARK: - SectionSection
struct SectionSection: Codable {
    let id: String?
    let version: Version?
    //let content: CustomContent?
    let interactions: Interactions?
    let modifiers: Modifiers?
}

//enum ComponentViewType: Codable {
//    case card_1
//}

protocol CustomContent: Codable {
    var type: String { get }
}

// MARK: - Content
struct Content: Codable {
    let title, firstCtaText, secondCtaText, imageURL: String?
    let subtitle, headerLine1, headerLine2: String?
    let headerLine2_Icon: String?
    let bodyLine1: String?
    let bodyLine1_Icon: String?
    let bodyLine2: String?
    let bodyLine2_Icon: String?
    let bodyLine3: String?
    let bodyLine3_Icon: String?
    let primaryCtaText: String?

    enum CodingKeys: String, CodingKey {
        case title
        case firstCtaText = "first_cta_text"
        case secondCtaText = "second_cta_text"
        case imageURL = "image_url"
        case subtitle
        case headerLine1 = "header_line_1"
        case headerLine2 = "header_line_2"
        case headerLine2_Icon = "header_line_2_icon"
        case bodyLine1 = "body_line_1"
        case bodyLine1_Icon = "body_line_1_icon"
        case bodyLine2 = "body_line_2"
        case bodyLine2_Icon = "body_line_2_icon"
        case bodyLine3 = "body_line_3"
        case bodyLine3_Icon = "body_line_3_icon"
        case primaryCtaText = "primary_cta_text"
    }
}

// MARK: - Interactions
struct Interactions: Codable {
    let onPress: OnPress
    let onView: OnView?

    enum CodingKeys: String, CodingKey {
        case onPress = "on_press"
        case onView = "on_view"
    }
}

// MARK: - OnPress
struct OnPress: Codable {
    let actions: [Action]
    let events: [Event]
}

// MARK: - Action
struct Action: Codable {
    let element, type: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let bottomSheetID, url: String?

    enum CodingKeys: String, CodingKey {
        case bottomSheetID = "bottom_sheet_id"
        case url
    }
}

// MARK: - Event
struct Event: Codable {
    let element: String
    let type: TypeEnum
    let data: SectionDetails
}

enum TypeEnum: String, Codable {
    case pel = "pel"
}

// MARK: - OnView
struct OnView: Codable {
    let events: [Event]
}

// MARK: - Modifiers
struct Modifiers: Codable {
    let bold: [Bold]
}

// MARK: - Bold
struct Bold: Codable {
    let element, identifier, displayText: String

    enum CodingKeys: String, CodingKey {
        case element, identifier
        case displayText = "display_text"
    }
}

enum Version: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Version.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Version"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
