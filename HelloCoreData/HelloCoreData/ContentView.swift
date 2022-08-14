//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Harun Gunes on 14/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var movieTitle = ""
    
    @State private var movies: [Movie] = [Movie]()
    
    var body: some View {
        VStack {
            TextField("Enter a movie name", text: $movieTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                coreDM.saveMovie(title: movieTitle)
                populateMovies()
                
            } label: {
                Text("Save")
            }
            
            List {
                ForEach(movies, id: \.self) { movie in
                    Text(movie.title ?? "")
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDM.deleteMovie(movie: movie)
                        populateMovies()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear() {
            populateMovies()
        }
    }
    
    private func populateMovies() {
        movies = coreDM.fetchMovies()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
