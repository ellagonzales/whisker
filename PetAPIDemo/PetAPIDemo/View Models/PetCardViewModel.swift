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
    
    init(pet: AnimalDataItem) {
        self.pet = Animal(attributes: AnimalAttributes(ageGroup: pet.ageGroup, ageString: pet.ageString, birthDate: pet.birthDate, breedPrimary: pet.breedPrimary, breedSecondary: pet.breedSecondary, colorDetails: pet.colorDetails, descriptionText: pet.descriptionText, name: pet.name, pictureThumbnailUrl: pet.pictureThumbnailUrl, sex: pet.sex, sizeUOM: pet.sizeUOM, createdDate: pet.createdDate, updatedDate: pet.updatedDate))
        self.included = Included(attributes: IncludedAttributes(phone: pet.phone, city: pet.city, state: pet.state, email: pet.email))
    }
    
    func getName() -> String {
        return pet.attributes.name ?? "N/A"
    }
    
    func getSex() -> String {
        return pet.attributes.sex ?? "N/A"
    }
    
    func getAge() -> String {
        return pet.attributes.ageString ?? "Unknown Age"
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
    
    func getIncluded() -> Included {
        return included
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
