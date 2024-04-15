//
//  CardView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var vm: PetCardViewModel
    @State private var offset = CGSize.zero
    
    // Updated background to reflect system settings
    @State private var color: Color = Color(UIColor.systemBackground) 
    
    @State private var showingMoreInfo: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 700)
                .cornerRadius(15)
                .foregroundColor(color) //.opacity(0.9))
                //.shadow(color: Color.secondary, radius: 4)
            
            VStack {
                if let image = try? vm.getImage() {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .frame(width: 250, height: 500)
                        
                } else {
                    Text("No image available")
                }
                
                VStack(alignment: .leading) {
                    // For when the name is long
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(vm.getName())
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .bold()
                            .lineLimit(1)
                    }
                    .frame(height: 40)
                    Text(vm.getPrimaryBreed())
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 80)
                .padding(.bottom, 10)
                        
                Button {
                    withAnimation {
                        showingMoreInfo = true
                    }
                } label: {
                    HStack{
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
            
            if showingMoreInfo {
                DetailsView(vm: vm, showingMoreInfo: $showingMoreInfo)
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
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

    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            // Add what needs to be done when they swip LEFT
            offset = CGSize(width: -500, height: 0)
            
        case 150...500:
            // Add what needs to be done when they swip RIGHT
            offset = CGSize(width: 500, height: 0)
            
        default:
            offset = .zero
        }
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
    CardView(vm: PetCardViewModel(pet: Animal.example))
}
