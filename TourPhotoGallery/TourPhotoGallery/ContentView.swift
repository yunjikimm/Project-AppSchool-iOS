//
//  ContentView.swift
//  TourPhotoGallery
//
//  Created by yunjikim on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tourPhotoStore: TourPhotoStore = TourPhotoStore()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(tourPhotoStore.photos, id: \.galContentID) { photo in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: photo.galWebImageURL)) { image in
                            VStack(alignment: .leading) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                VStack(alignment: .leading) {
                                    Text("\(photo.galTitle)")
                                        .font(.title.bold())
                                    Text("\(photo.galPhotographyLocation)")
                                }
                            }
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
            
            .navigationTitle("관광사진")
        }
        .onAppear {
            Task {
                await tourPhotoStore.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
