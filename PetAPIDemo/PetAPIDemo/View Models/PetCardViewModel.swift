//
//  PetCardViewModel.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/12/24.
//

import Foundation
import UIKit

class PetCardViewModel: ObservableObject {
    @Published var pet: Animal
    @Published var included: Included
    
    init(pet: Animal, included: Included) {
        self.pet = pet
        self.included = included
    }
    
    func getName() -> String {
        return pet.attributes.name ?? "N/A"
    }
    
    func getSex() -> String {
        return pet.attributes.sex ?? "N/A"
    }
    
    func getAge() -> String {
        return pet.attributes.ageString ?? "N/A"
    }
    
    func getAgeGroup() -> String {
        return pet.attributes.ageGroup ?? "N/A"
    }
    
    func getColorDetails() -> String {
        return pet.attributes.colorDetails ?? "N/A"
    }
    
    func getDescription() -> String {
        return pet.attributes.descriptionText ?? "N/A"
    }
    
    func getPrimaryBreed() -> String {
        return pet.attributes.breedPrimary ?? "N/A"
    }
    
    func getSecondaryBreed() -> String {
        return pet.attributes.breedSecondary ?? ""
    }
    
    func getAnimal() -> Animal {
        return pet
    }
        
    func getCity() -> String {
        return included.attributes.city ?? "N/A"
    }
        
    func getState() -> String {
        return included.attributes.state ?? "N/A"
    }
        
    func getPhone() -> String {
        return included.attributes.phone ?? "N/A"
    }
        
    func getEmail() -> String {
        return included.attributes.email ?? "N/A"
    }
}
