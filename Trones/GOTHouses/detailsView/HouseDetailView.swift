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
                        
                        if let seats = house.seats  {
                            Text("Seats: \(seats.count)")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                
                Divider()

                VStack(alignment: .leading) {
                    if let coatOfArms = house.coatOfArms, !coatOfArms.isEmpty {
                        Text("Coat Of Arms")
                            .font(.title2)
                        Text(house.coatOfArms ?? "")
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    if let words = house.words, !words.isEmpty {
                        Text("Sworn Words")
                            .font(.title2)
                        Text(words)
                            .foregroundColor(.red)
                    }
                }
                        
                Divider()
                
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
                
                Divider()
                
                if let swornMembers = house.swornMembers {
                    if swornMembers.count != 0 {
                        HStack {
                            Image(systemName: "flag.2.crossed")
                            Text("\(swornMembers.count) Sworn Members")
                        }
                        ForEach(swornMembers, id: \.self) { member in
                            if let sworn = member   {
                                Link(destination: URL(string: sworn)!) {
                                    HStack {
                                        Image(systemName: "link")
                                            .imageScale(.small)
                                        Text(member)
                                            .font(.callout)
                                    }
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                                }
                            }
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
