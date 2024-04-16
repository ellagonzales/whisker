//
//  AnimalDataItem.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/15/24.
//

import Foundation
import SwiftData

@Model
class AnimalDataItem: Identifiable {
    
    var id: String
    var pet: Animal
    
    init(pet: Animal) {
        
        self.id = UUID().uuidString
        self.pet = pet
    }
    
}
