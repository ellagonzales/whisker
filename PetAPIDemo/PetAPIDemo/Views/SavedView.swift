//
//  SavedView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/15/24.
//

import SwiftData
import SwiftUI

struct SavedView: View {
    @Environment(\.modelContext) var context
     @Query var items: [AnimalDataItem]
//     var items: [AnimalDataItem] = AnimalDataItem.exampleItems

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Image("whisker-bg2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items.reversed()) { animal in
                            NavigationLink(destination: SavedCardView(vm: PetCardViewModel(pet: animal))) {
                                ZStack {
                                    

                                    ZStack {
                                        if let imageUrl = animal.pictureThumbnailUrl {
                                            AsyncImage(url: URL(string: imageUrl)) { phase in
                                                if let image = phase.image {
                                                    image.resizable()
                                                        .scaledToFill()
                                                        .frame(width: 180, height: 250)
                                                        .clipShape(
                                                            .rect(
                                                                topLeadingRadius: 20,
                                                                bottomLeadingRadius: 50,
                                                                bottomTrailingRadius: 50,
                                                                topTrailingRadius: 20
                                                            )
                                                        )
                                                        .padding(.bottom, -8)
                                                } else if phase.error != nil {
                                                    missingImageCard()
                                                } else {
                                                    ProgressView()
                                                }
                                            }
                                        } else {
                                            missingImageCard()
                                        }

                                        VStack {
                                            Spacer()
                                            Text(animal.name ?? "Noah")
                                                .font(.title3)
                                                .padding()
                                                .frame(maxWidth: 180)
                                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                                                .cornerRadius(20)
                                            .foregroundColor(.white)
                                        }
                                    }
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }

    @ViewBuilder
    func missingImageCard() -> some View {
        Image(systemName: "photo.artframe")
    }
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: AnimalDataItem.self, configurations: config)
//
//    return SavedView(items: [.init(pet: .example, vm: .init(pet: .animalDataItem)), .init(pet: .example, vm: .init(pet: .animalDataItem)), .init(pet: .example, vm: .init(pet: .animalDataItem))])
//        .modelContainer(container)
//}

