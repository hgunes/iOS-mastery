//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Harun Gunes on 14/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    // MARK: - CRUD Operations
    
    /// Create
    func saveMovie(title: String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
        
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the movie. \(error)")
        }
    }
    
    /// Retrieve
    func fetchMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    /// Update
 
    
    ///Delete
    func deleteMovie(movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save the context \(error.localizedDescription)")
        }
    }

}
