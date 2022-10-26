//
//  GOTHouseRow.swift
//  Trones
//
//  Created by diayan siat on 23/10/2022.
//

import SwiftUI

struct GOTHouseRow: View {
    let house: House

    var body: some View {
        HStack {
            Image(systemName: "house")
                .font(.system(size: 40.0))
               // .foregroundColor(.black)

          VStack(alignment: .leading) {
              Text(house.name ?? "")
              .multilineTextAlignment(.center)
              //.font(.title3)
          }
          .lineLimit(1)
        }
    }
}

struct GOTHouseRow_Previews: PreviewProvider {
    static var previews: some View {
        if let house = House.houses.first {
            GOTHouseRow(house: house)
        }
    }
}
