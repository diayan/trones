//
//  ContentView.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import SwiftUI

struct ContentView: View {
    private let requestManager = RequestManager()
    @State var houses: [House] = []
    @State var isLoading = true
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(houses, id: \.name) { house in
                        NavigationLink(destination: HouseDetailView(house: house)) {
                            GOTHouseRow(house: house)
                        }
                    }
                }
                .task {
                    await fetchGOTHouses()
                }
                .listStyle(.plain)
                .navigationTitle("GOT Houses")
                .overlay {
                    if isLoading {
                        ProgressView("Fetching GOT houses")
                    }
                }
            } else {
                overlay(ProgressView("Fetching GOT houses"), alignment: .center)
                    .onAppear {
                        Task {
                            await fetchGOTHouses()
                        }
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func fetchGOTHouses() async{
        do {
            let houses: [House] = try await requestManager.perform(HousesRequest.getHousesWith(page: 1, pageSize: 50))
            self.houses = houses
            await stopLoading()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor ///mainactor tells swift to run on the main thread
    func stopLoading() async {
        isLoading = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
