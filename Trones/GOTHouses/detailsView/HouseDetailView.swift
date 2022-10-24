//
//  HouseDetailView.swift
//  Trones
//
//  Created by diayan siat on 24/10/2022.
//

import SwiftUI

struct HouseDetailView: View {
    var house: House

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(house.name ?? "" )
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Text(house.name ?? "")
                    Spacer()
                    Text(house.name ?? "")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(house.name ?? "")")
                    .font(.title2)
                Text(house.name ?? "")
            }
            .padding()
        }
        .navigationTitle(house.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HouseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let house = House.houses.first {
            HouseDetailView(house: house)
        }
    }
}
