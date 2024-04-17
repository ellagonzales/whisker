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
    
    @Attribute(.unique) var id: String
    var ageGroup: String?
    var ageString: String?
    var birthDate: String?
    var breedPrimary: String?
    var breedSecondary: String?
    var colorDetails: String?
    var descriptionText: String?
    var name: String?
    var pictureThumbnailUrl: String?
    var sex: String?
    var sizeUOM: String?
    var createdDate: String?
    var updatedDate: String?
    var phone: String?
    var email: String?
    var city: String?
    var state: String?
    
    init(pet: Animal, vm: PetCardViewModel) {
        id = UUID().uuidString
        ageGroup = pet.attributes.ageGroup
        ageString = pet.attributes.ageString
        birthDate = pet.attributes.birthDate
        breedPrimary = pet.attributes.breedPrimary
        breedSecondary = pet.attributes.breedSecondary
        colorDetails = pet.attributes.colorDetails
        descriptionText = pet.attributes.descriptionText
        name = pet.attributes.name
        pictureThumbnailUrl = pet.attributes.pictureThumbnailUrl
        sex = pet.attributes.sex
        sizeUOM = pet.attributes.sizeUOM
        createdDate = pet.attributes.createdDate
        updatedDate = pet.attributes.updatedDate
        phone = vm.getPhone()
        email = vm.getEmail()
        city = vm.getCity()
        state = vm.getState()
    }
}
