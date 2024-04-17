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
        TextField("Postal Code", text: $postal)
        TextField("Radius in Miles", text: $miles)
    }
}

