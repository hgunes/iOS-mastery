//
//  MovieDetailView.swift
//  HelloCoreData
//
//  Created by Harun Gunes on 14/08/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    @State private var movieTitle = ""
    @Binding var needsRefresh: Bool
    let movie: Movie
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update") {
                if !movieTitle.isEmpty {
                    movie.title = movieTitle
                    coreDM.updateMovies()
                    needsRefresh.toggle()
                }
            }
        }.padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        
        MovieDetailView(needsRefresh: .constant(false), movie: movie, coreDM: coreDM)
    }
}
