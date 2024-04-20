//
//  CardView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftData
import SwiftUI

struct CardView: View {
    @ObservedObject var vm: PetCardViewModel
    @State private var offset = CGSize.zero
    @Environment(\.modelContext) var context
    
    // Updated background to reflect system settings
    @State private var color: Color = .init(UIColor.systemBackground)
    
    @State private var showingMoreInfo: Bool = false
    
    var body: some View {
        ZStack {
            /*Rectangle()
                .frame(width: 375, height: 635)
                .cornerRadius(15)
                .foregroundColor(.primary)*/
            
            Rectangle()
                .frame(width: 370, height: 630)
                .cornerRadius(15)
                .foregroundColor(color) // .opacity(0.9))
            // .shadow(color: Color.secondary, radius: 4)
            
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
                                .foregroundColor(.primary)
                                .bold()
                                .lineLimit(1)
                                // Fixed long name bug
                                .truncationMode(.tail)
                                .frame(width: 325, height: 40)
                                //.frame(height: 40)
                    }
                    HStack {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(.secondary)
                        Text("\(vm.getPrimaryBreed()) in \(vm.getCity()), \(vm.getState())")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        .italic()
                    }
                    .frame(width: 350)
                }
                // .frame(maxWidth: .infinity, alignment: .leading)
                // .padding(.horizontal, 50)
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
//
//            if showingMoreInfo {
//                DetailsView(vm: vm, showingMoreInfo: $showingMoreInfo)
//                    .zIndex(1)
//                    .transition(.move(edge: .bottom))
//            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }.onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }

    @ViewBuilder
    func missingImageCard() -> some View {
        Image(systemName:"photo.artframe")
    }
  
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            // Add what needs to be done when they swip LEFT
            offset = CGSize(width: -500, height: 0)
            
        case 150...500:
            // Add what needs to be done when they swip RIGHT
            offset = CGSize(width: 500, height: 0)
            addItem(pet: vm.getAnimal(), vm: vm)
            
        default:
            offset = .zero
        }
    }
    
    func addItem(pet: Animal, vm: PetCardViewModel) {
        let item = AnimalDataItem(pet: pet, vm: vm)
        print(item)
        context.insert(item)
        print("item added")
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
            // Updated to system color
        default: color = Color(UIColor.systemBackground)
        }
    }
}

#Preview {
    CardView(vm: PetCardViewModel(pet: Animal.example, included: Included.example))
}
