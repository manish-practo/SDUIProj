//
//  ComponentFactoryProvider.swift
//  SDUIPractice
//
//  Created by Manish Pandey on 02/08/21.
//

import Foundation

protocol ComponentFactoryProvider {
    
    func create(from sectionInfo: SectionInfo) -> SectionView?
    
}
