//
//  CourseWorkUIApp.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI
import SwiftData

@main
struct CourseWorkUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NewProductViewThree()
        }
        .modelContainer(sharedModelContainer)
    }
}
