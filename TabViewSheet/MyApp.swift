//
//  MyApp.swift
//  TabViewSheet
//
//  Created by John Siracusa on 10/3/26.
//

import SwiftUI

/// Runs the minimal tab-in-sheet layout reproduction.
@main
struct MyApp : App {
    /// Creates a single window so the initial presentation is repeatable.
    var body : some Scene {
        Window("TabView Sheet", id: "main") {
            ContentView()
        }
    }
}
