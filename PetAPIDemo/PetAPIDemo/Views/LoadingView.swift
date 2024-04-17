//
//  LoadingView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Welcome to Whisker!")
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .foregroundColor(Color.primary)
            Image("dogandcat")
                .resizable()
                .scaledToFit()
            Text("Hold on while we find your purrrfect pet match...")
                .font(.title3)
                .fontWeight(.semibold)
                .italic()
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    LoadingView()
}
