//
//  ContentView.swift
//  TabViewSheet
//
//  Created by John Siracusa on 10/3/26.
//

import SwiftUI

/// Reproduces overlapping tab labels in a macOS sheet without StoreKit.
struct ContentView : View {
    /// Presents the reproduction immediately and allows it to be reopened.
    @State private var showingSheet = true

    /// Hosts a sheet containing only a two-page tab view and a close button.
    var body : some View {
        Button("Show Sheet") {
            showingSheet = true
        }
        .frame(width: 650, height: 400)
        .sheet(isPresented: $showingSheet) {
            VStack(spacing: 0) {
                TabView {
                    Text("Tab A")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem { Text("Tab A content") }
                        .tag(1)

                    Text("Tab B")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tabItem { Text("Tab B content") }
                        .tag(0)
                }
                .frame(height: 370)

                Button("Close Sheet") {
                    showingSheet = false
                }
                .keyboardShortcut(.cancelAction)
                .padding(.vertical, 15)
            }
            .padding(.horizontal, 34)
            .padding(.top, 30)
            .frame(width: 450)
        }
    }
}

// MARK: Previews

#Preview {
    ContentView()
}
