//
//  PetService.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import Foundation

class PetService: ObservableObject {
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    static func fetchPets() async {
        guard let url = URL(string: "https://api.rescuegroups.org/v5/public/animals/search") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
      
        let requestBody = AnimalSearchRequest(
            apikey: "hRnmbItJ",
            objectType: "animals",
            objectAction: "publicSearch",
            search: Search(
                resultStart: 0,
                resultLimit: 1,
                resultSort: "animalID",
                resultOrder: "asc",
                calcFoundRows: "Yes",
                filters: [
                    Filter(fieldName: "animalStatus", operation: "contains", criteria: "Available"),
                    Filter(fieldName: "animalSpecies", operation: "contains", criteria: "Dog")
                ],
                fields: ["animalName"]
            )
        )
        request.httpMethod = "POST"
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("hRnmbItJ", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(requestBody)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(AnimalData.self, from: data)
            print(result)
        } catch {
            print("Error fetching pets: \(error)")
        }
    }
}
