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
    
    static func fetchPets() async throws -> [Animal] {
        guard let url = URL(string: "https://api.rescuegroups.org/v5/public/animals/search/available/?sort=random&limit=50") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("hRnmbItJ", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let result = try decoder.decode(AnimalData.self, from: data)
        print(result)
        
        // for animal in result, if url is nil, remove it
        var cleanedResult: [Animal] = []
        for animal in result.data {
            if animal.attributes.pictureThumbnailUrl != nil {
                cleanedResult.append(animal)
            }
        }

        return cleanedResult
    }
}
