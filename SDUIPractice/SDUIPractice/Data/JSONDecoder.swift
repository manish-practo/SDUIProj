//
//  JSONDecoder.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 31/07/21.
//

import Foundation

struct CustomJSONDecoder {
    
    func loadJSONData() -> Data {
        guard let jsonFilePath = Bundle.main.path(forResource: "Data", ofType: "json") else {
            fatalError("Unable to load JSON for Data")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            fatalError("Unable to load data from \(jsonFilePath)")
        }
        
        return data
    }
    
}
