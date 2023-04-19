//
//  KuletaApp.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import SwiftUI

@main
struct KuletaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
