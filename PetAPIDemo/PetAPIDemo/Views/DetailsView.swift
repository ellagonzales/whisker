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
                VStack(spacing: 15){
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color.secondary)
                        Text("Pet Information")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                        Spacer()
                    }
                    HStack {
                        Text("**Name**")
                        Spacer()
                        Text("\(vm.getName())")
                    }
                    Divider()
                    HStack {
                        Text("**Breed**")
                        Spacer()
                        Text(vm.getPrimaryBreed())
                    }
                    Divider()
                    DisclosureGroup("**About Me**", isExpanded: $isDescriptionExpanded) {
                        Text(vm.getDescription())
                            .font(.body)
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .listRowSeparator(.hidden)
                
                VStack(spacing: 15){
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(Color.secondary)
                        Text("Details")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                        Spacer()
                    }
                    HStack {
                        Text("**Age**")
                        Spacer()
                        Text("\(vm.getAge()) (\(vm.getAgeGroup()))")
                    }
                    Divider()
                    HStack {
                        Text("**Sex**")
                        Spacer()
                        Text(vm.getSex())
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .listRowSeparator(.hidden)
                 
                VStack(spacing: 15){
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.secondary)
                        Text("Contact")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                        Spacer()
                    }
                    HStack {
                        Text("**Phone**")
                        Spacer()
                        Text("\(vm.getPhone())")
                    }
                    Divider()
                    HStack {
                        Text("**Email**")
                        Spacer()
                        Text(vm.getEmail())
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .listRowSeparator(.hidden)
            
                VStack(spacing: 15){
                    HStack {
                        Image(systemName: "pin.fill")
                            .foregroundColor(Color.secondary)
                        Text("Location")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                        Spacer()
                    }
                    HStack {
                        Text("**City**")
                        Spacer()
                        Text("\(vm.getCity())")
                    }
                    Divider()
                    HStack {
                        Text("**State**")
                        Spacer()
                        Text(vm.getState())
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .listRowSeparator(.hidden)
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
