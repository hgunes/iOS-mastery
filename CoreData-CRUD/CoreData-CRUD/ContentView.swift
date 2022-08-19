//
//  ContentView.swift
//  CoreData-CRUD
//
//  Created by Harun Gunes on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    let coreDataM = PersistentManager.shared
    @State private var item = ""
    @State private var toDos = [Todo]()
    @State private var needsRefresh = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter an item", text: $item)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    coreDataM.save(item: item)
                    populateItems()
                }
                
                List {
                    ForEach(toDos, id: \.self) { oneItem in
                        NavigationLink(destination: ItemDetailView(todo: oneItem, coreDM: coreDataM, needsRefresh: $needsRefresh), label: {
                            Text(oneItem.item ?? "")
                        })
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let todo = toDos[index]
                            coreDataM.deleteItem(todo: todo)
                            populateItems()
                        }
                       
                    }
                }
                .listStyle(PlainListStyle())
                .accentColor(needsRefresh ? .white : .black)
        }
            
        } //: VSTACK
        .onAppear() {
            populateItems()
        }
        .padding()
    }
    
    func populateItems() {
        toDos = coreDataM.fetchItems()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
