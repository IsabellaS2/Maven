//
//  MavenApp.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

@main
struct MavenApp: App {
    
    let viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(vm: viewModel)
        }
    }
}
