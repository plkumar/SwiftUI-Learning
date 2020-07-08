//
//  SandwichDetailView.swift
//  Sandwitches
//
//  Created by Lakshman Peethani on 07/07/20.
//  Copyright © 2020 Lakshman Peethani. All rights reserved.
//

import SwiftUI

struct SandwichDetailView: View {
    let sandwich:Sandwich
    @State private var zoomed = false
    var body: some View {
        VStack {
            Image(sandwich.image)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    self.zoomed.toggle()
            }
            .animation(.easeInOut)
            if !zoomed {
                VStack (alignment: .leading) {
                    HStack {
                        Text(sandwich.name)
                            .font(.headline)
                        (sandwich.spicy ? Image(systemName: "flame.fill").foregroundColor(.red) : Image(systemName: "flame").foregroundColor(.orange))
                        .font(.footnote)
                    }
                    Text(sandwich.description)
                        .lineLimit(nil)
                    Spacer()
                }
                .animation(.easeInOut)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationBarTitle(sandwich.name)
    }
}

struct SandwichDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetailView(sandwich: sandwitches[2])
        }
        .environment(\.colorScheme, .dark)
    }
}
