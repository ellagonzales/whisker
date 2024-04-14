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
    @State private var color: Color = .white
    
    @State private var showingMoreInfo: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 700)
                .border(.white, width: 6.0)
                .cornerRadius(4.0)
                .foregroundColor(color) //.opacity(0.9))
                .shadow(radius: 4)
                
            VStack {
                if let image = try? vm.getImage() {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 500)
                } else {
                    Text("No image available")
                }
                HStack {
                    Text(vm.getName())
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .bold()
                }
                HStack {
                    Text("\(vm.getPrimaryBreed())")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .italic()
                }
                        
                Button {
                    withAnimation {
                        showingMoreInfo = true
                    }
                } label: {
                    Text("More Info")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .bold()
                        .padding(.top)
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
        default: color = .white
        }
    }
}

#Preview {
    CardView(vm: PetCardViewModel(pet: Animal.example))
}
