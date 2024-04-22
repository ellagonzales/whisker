//
//  FilterView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/16/24.
//

import SwiftUI

struct FilterView: View {
    @Binding var showingMoreInfo: Bool
    @ObservedObject var vm: PetViewModel
    @State var postal: String = ""
    @State var miles: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("**Enter a Postal Code**")
                        .foregroundColor(.primary)
                    TextField("\(vm.postal.description)", text: $postal)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
                HStack {
                    Text("**Enter Radius in Miles**")
                        .foregroundColor(.primary)
                    TextField("\(vm.miles.description)", text: $miles)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
            Button {
                vm.miles = Int(miles) ?? vm.miles
                vm.postal = Int(postal) ?? vm.postal
                showingMoreInfo.toggle()
                Task {
                    try await vm.fetchPets()
                }
            } label: {
                HStack {
                    Text("Submit")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .bold()
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
            }
        }
    }
}

