//
//  ItemDetailView.swift
//  CoreData-CRUD
//
//  Created by Harun Gunes on 16/08/2022.
//

import SwiftUI

struct ItemDetailView: View {
    
    let todo: Todo
    @State private var todoName = ""
    let coreDM: PersistentManager
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(todo.item ?? "", text: $todoName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                if !todoName.isEmpty {
                    todo.item = todoName
                    coreDM.updateItem()
                    needsRefresh.toggle()
                }
            } label: {
                Text("Update")
            }
        }
        .padding()
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = PersistentManager.shared
        let todo = Todo(context: coreDM.container.viewContext)
        
        ItemDetailView(todo: todo, coreDM: coreDM, needsRefresh: .constant(false))
    }
}
