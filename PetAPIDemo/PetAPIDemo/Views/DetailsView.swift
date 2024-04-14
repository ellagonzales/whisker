//
//  DetailsView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/12/24.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var vm: PetCardViewModel
    @Binding var showingMoreInfo: Bool
    @State var isDescriptionExpanded: Bool = false

    var body: some View {
        List {
            Section(header: Text("Pet Information")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(vm.getName())
                }
                HStack {
                    Text("Breed")
                    Spacer()
                    Text(vm.getPrimaryBreed())
                }
                DisclosureGroup("Description", isExpanded: $isDescriptionExpanded) {
                    Text(vm.getDescription())
                        .font(.body)
                }
            }
            
            Section(header: Text("Details")) {
                HStack {
                    Text("Age")
                    Spacer()
                    Text("\(vm.getAge()) (\(vm.getAgeGroup()))")
                }
//                HStack {
//                    Text("Color")
//                    Spacer()
//                    Text(vm.getColorDetails())
//                }
                HStack {
                    Text("Sex")
                    Spacer()
                    Text(vm.getSex())
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
            DetailsView(vm: PetCardViewModel(pet: Animal.example),showingMoreInfo: .constant(true))
        }
    }
}

