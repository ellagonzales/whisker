//
//  DetailsView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/12/24.
//

import SwiftUI

struct DetailsView: View {
    var pet: Pet
    @Binding var showingMoreInfo: Bool
    @State var isDescriptionExpanded: Bool = false

    var body: some View {
        List {
            Section(header: Text("Pet Information")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(pet.name)
                }
                HStack {
                    Text("Species")
                    Spacer()
                    Text(pet.breedPrimary)
                }
                HStack {
                    Text("Breed")
                    Spacer()
                    Text(pet.breedSecondary)
                }
                DisclosureGroup("Description", isExpanded: $isDescriptionExpanded) {
                    Text(pet.descriptionText)
                        .font(.body)
                }
            }
            
            Section(header: Text("Details")) {
                HStack {
                    Text("Age")
                    Spacer()
                    Text("\(pet.ageString) (\(pet.ageGroup))")
                }
                HStack {
                    Text("Color")
                    Spacer()
                    Text(pet.colorDetails)
                }
                HStack {
                    Text("Sex")
                    Spacer()
                    Text(pet.sex)
                }
            }
            
            Section(header: Text("Contact")) {
                Text("Location")
                Text("Contact Information")
            }
            
            Button {
                withAnimation {
                    showingMoreInfo = false
                }
            } label: {
                Text("Dismiss")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("More Information")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(pet: Pet.example, showingMoreInfo: .constant(true))
        }
    }
}

