//
//  PersistentManager.swift
//  CoreData-CRUD
//
//  Created by Harun Gunes on 16/08/2022.
//

import CoreData

struct PersistentManager {
    
    static let shared = PersistentManager()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Stash")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error)")
            }
        }
    }
    
    //: MARK: - CRUD
    
    func save(item: String) {
        
        let toDo = Todo(context: container.viewContext)
        
        toDo.item = item
        
        do {
            try container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchItems() -> [Todo] {
        
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func updateItem() {
        
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(todo: Todo) {
        
        container.viewContext.delete(todo)
        
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
}
