//
//  TronesApp.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import SwiftUI

@main
struct TronesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: HousesViewModel(
                houseFetcher: FetchHousesService(requestManager: RequestManager())
            )
            )
        }
    }
}
