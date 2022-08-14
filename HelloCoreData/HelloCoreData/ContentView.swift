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
    
    var body: some View {
        VStack {
            TextField("Enter a movie name", text: $movieTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                do {
                    try coreDM.saveMovie(title: movieTitle)
                } catch {
                    print("Error")
                }
                
            } label: {
                Text("Save")
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
