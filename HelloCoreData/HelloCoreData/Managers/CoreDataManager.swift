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
    func saveMovie(title: String) throws {
        
        let movie = Movie(context: persistentContainer.viewContext)
        
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the movie. \(error)")
        }
    }

}
