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
            Section(header: HStack {
                Text("Pet Information")
                Spacer()
//                Button(action: {
//                    withAnimation {
//                        showingMoreInfo = false
//                    }
//                }) {
//                    Image(systemName: "xmark")
//                        .foregroundColor(.red)
//                        .bold()
//                        .imageScale(.large)
//                }
            }) {
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
        }
    }
}
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(vm: PetCardViewModel(pet: Animal.example),showingMoreInfo: .constant(true))
        }
    }
}

