//
//  SavedCardView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/17/24.
//


import SwiftData
import SwiftUI

struct SavedCardView: View {
    @ObservedObject var vm: PetCardViewModel
    @Environment(\.modelContext) var context
    
    // Updated background to reflect system settings
    @State private var color: Color = .init(UIColor.systemBackground)
    
    @State private var showingMoreInfo: Bool = false
    
    var body: some View {
        ZStack {
            Image("whisker-bg3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let imageUrl = vm.pet.attributes.pictureThumbnailUrl {
                    AsyncImage(url: URL(string: imageUrl)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .cornerRadius(15)
                                .frame(width: 325, height: 450)
                        } else if phase.error != nil {
                            missingImageCard()
                        } else {
                           ProgressView()
                        }
                    }
                } else {
                    missingImageCard()
                }
                
                VStack(alignment: .center) {
                    // For when the name is long
                    HStack(alignment: .lastTextBaseline) {
                        Text(vm.getName())
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                                .bold()
                                .lineLimit(1)
                            .frame(height: 40)
                    }
                    .frame(width: 350)
                    HStack {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(Color.black)
                        Text("\(vm.getPrimaryBreed()) in \(vm.getCity()), \(vm.getState())")
                            .font(.headline)
                            .foregroundColor(Color.black)
                        .italic()
                    }
                    .frame(width: 350)
                }
                .padding(.bottom, 10)
                
                Button {
                    withAnimation {
                        showingMoreInfo = true
                    }
                } label: {
                    HStack {
                        Text("Learn more about me!")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .bold()
                        
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                }
            }
            .sheet(isPresented: $showingMoreInfo) {
                DetailsView(vm: vm, showingMoreInfo: $showingMoreInfo)
            }
        }
    }

    @ViewBuilder
    func missingImageCard() -> some View {
        Image(systemName:"photo.artframe")
    }
  
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default: color = Color(UIColor.systemBackground)
        }
    }
}

#Preview {
    SavedCardView(vm: PetCardViewModel(pet: Animal.example, included: Included.example))
}

