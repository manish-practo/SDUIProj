//
//  Card1Response.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 03/08/21.
//

import Foundation

struct Card1Response: Decodable {
    let image_url: String
    let title: String
    let subtitle: String
    let header_line_1: String
    let header_line_2: String
    let header_line_2_icon: String
    let body_line_1: String
    let body_line_1_icon: String
    let body_line_2: String
    let body_line_2_icon: String
    let body_line_3: String
    let body_line_3_icon: String
    let primary_cta_text: String
}
