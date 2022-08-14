//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Harun Gunes on 14/08/2022.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
