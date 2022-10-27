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
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "house")
                        
                        Text(house.name ?? "" )
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .padding(.leading, 2)
                        Text(house.region ?? "")
                        
                        Spacer()
                        
                        if let swornMembers = house.swornMembers  {
                            Text("Sworn Members: \(swornMembers.count)")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                Divider()
                Spacer(minLength: 24)

                VStack(alignment: .leading) {
                    if let coatOfArms = house.coatOfArms, !coatOfArms.isEmpty {
                        Text("Coat Of Arms")
                            .font(.title2)
                        Text(house.coatOfArms ?? "")
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer(minLength: 24)
                    
                    if let words = house.words, !words.isEmpty {
                        Text("Sworn Words")
                            .font(.title2)
                        Text(words)
                            .foregroundColor(.red)
                    }
                }
                        
                Spacer(minLength: 24)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                        HStack {
                            Text("Founded: ")
                                .foregroundColor(.primary)
                            Text(house.founded ?? "")
                                .foregroundColor(.secondary)
                        }
                     
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        HStack {
                            Text("Died OUt: ")
                                .foregroundColor(.primary)
                            Text(house.diedOut ?? "")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Spacer(minLength: 24)
                
                if let titles = house.titles {
                    if titles.count != 0 {
                        HStack {
                            Image(systemName: "flag.2.crossed")
                            Text("\(titles.count) Title")
                                .font(.title2)
                        }
                        Spacer(minLength: 8)
                        ForEach(titles, id: \.self) { title in
                            Text(title)
                                .font(.callout)
                        }
                    }
                }
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
