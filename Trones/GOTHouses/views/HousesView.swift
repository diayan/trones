//
//  ContentView.swift
//  Trones
//
//  Created by diayan siat on 22/10/2022.
//

import SwiftUI

struct HousesView: View {
    @State var searchText = ""
    @ObservedObject var viewModel: HousesViewModel
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(viewModel.houses, id: \.name) { house in
                        NavigationLink(destination: HouseDetailView(house: house)) {
                            GOTHouseRow(house: house)
                        }
                    }
                    if !viewModel.houses.isEmpty && viewModel.hasMoreHouses {
                        ProgressView("Finding more houses...")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .task {
                                await viewModel.fetchMoreHouses()
                            }
                    }
                }
               // .searchable(text: $searchText)
                .task {
                    await viewModel.fetchGOTHouses()
                }
                .listStyle(.plain)
                .navigationTitle("GOT Houses")
                .overlay {
                    if viewModel.isLoading && viewModel.houses.isEmpty {
                        ProgressView("Fetching GOT houses")
                    }
                }
            } else {
                overlay(ProgressView("Fetching GOT houses"), alignment: .center)
                    .onAppear {
                        Task {
                            await viewModel.fetchGOTHouses()
                        }
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HousesView_Previews: PreviewProvider {
    static var previews: some View {
        HousesView(viewModel: HousesViewModel(houseFetcher: HouseFetcherMock()))
    }
}
