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
        VStack {
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
                        Text("**Name**")
                        Spacer()
                        Text(vm.getName())
                    }
                    HStack {
                        Text("**Breed**")
                        Spacer()
                        Text(vm.getPrimaryBreed())
                    }
                    DisclosureGroup("**Description**", isExpanded: $isDescriptionExpanded) {
                        Text(vm.getDescription())
                            .font(.body)
                    }
                }
                
                Section(header: Text("Details")) {
                    HStack {
                        Text("**Age**")
                        Spacer()
                        Text("\(vm.getAge()) (\(vm.getAgeGroup()))")
                    }
                    HStack {
                        Text("**Sex**")
                        Spacer()
                        Text(vm.getSex())
                    }
                }
                
                Section(header: Text("Contact")) {
                    HStack{
                        Text("**Phone**")
                        Spacer()
                        Text(vm.getPhone())
                    }
                    HStack{
                        Text("**Email**")
                        Spacer()
                        Text(vm.getEmail())
                    }
                }
                Section(header: Text("Location")) {
                    HStack{
                        Text("**City**")
                        Spacer()
                        Text(vm.getCity())
                    }
                    HStack{
                        Text("**State**")
                        Spacer()
                        Text(vm.getState())
                    }
                }
            }
            .listSectionSpacing(.compact)
            .listStyle(.inset)
            
            Button {
                withAnimation {
                    showingMoreInfo = false
                }
            } label: {
                HStack {
                    Text("Dismiss")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .bold()
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
            }
            .frame(maxWidth: .infinity) // Center horizontally
            Spacer()
        }
    }
}
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailsView(vm: PetCardViewModel(pet: Animal.example, included: Included.example),showingMoreInfo: .constant(true))
        }
    }
}
