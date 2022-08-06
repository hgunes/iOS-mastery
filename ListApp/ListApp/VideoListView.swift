//
//  VideoListView.swift
//  ListApp
//
//  Created by Harun Gunes on 06/08/2022.
//

import SwiftUI

struct VideoListView: View {
    
    var body: some View {
        NavigationView {
            List(0..<20) { item in
                HStack {
                    Image("average-dev")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("I am an average developer")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text("Jan 1, 2022")
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
