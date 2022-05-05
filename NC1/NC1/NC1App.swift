//
//  NC1App.swift
//  NC1
//
//  Created by Hyorim Nam on 2022/05/03.
//

import SwiftUI

@main
struct NC1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
