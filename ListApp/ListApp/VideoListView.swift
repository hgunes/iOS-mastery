//
//  VideoListView.swift
//  ListApp
//
//  Created by Harun Gunes on 06/08/2022.
//

import SwiftUI

struct VideoListView: View {
    
    var videoList = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videoList, id: \.id) { video in
                HStack {
                    Image(video.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(video.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(video.uploadDate)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Sean's top 10")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
