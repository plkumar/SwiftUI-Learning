//
//  SandwichRow.swift
//  Sandwitches
//
//  Created by Lakshman Peethani on 07/07/20.
//  Copyright © 2020 Lakshman Peethani. All rights reserved.
//

import SwiftUI

struct SandwichRow : View {
    let sandwhich : Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetailView(sandwich:sandwhich)) {
            Image("club-sandwich-thumb")
                .frame(width: 50.0, height: 50.0)
                .cornerRadius(10)
                
            VStack (alignment: .leading) {
                HStack {
                    Text(sandwhich.name).font(.headline).foregroundColor(.primary)
                    (sandwhich.spicy ? Image(systemName: "flame.fill").foregroundColor(.red) : Image(systemName: "flame").foregroundColor(.orange)).font(.caption)
                }
                Text("\(sandwhich.ingredients) ingedients.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SandwichRow_Previews: PreviewProvider {
    static var previews: some View {
        SandwichRow(sandwhich: sandwitches[0])
    }
}
