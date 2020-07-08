//
//  ContentView.swift
//  Sandwitches
//
//  Created by Lakshman Peethani on 06/07/20.
//  Copyright © 2020 Lakshman Peethani. All rights reserved.
//

import SwiftUI

extension String {
    /// Returns `true` if this string contains the provided substring,
    /// or if the substring is empty. Otherwise, returns `false`.
    ///
    /// - Parameter substring: The substring to search for within
    ///   this string.
    func hasSubstring(_ substring: String) -> Bool {
        substring.isEmpty || contains(substring)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ContentView: View {
    let sandwitches : [Sandwich]
    @State var searchPhrase = ""
    @State private var showCancelButton: Bool = false
    var body: some View {

        NavigationView {
            VStack {
                SearchView(searchPhrase: $searchPhrase)
                
                FilteredList(
                    sandwitches,
                    filterBy: \.name,
                    isIncluded: { name in name.hasSubstring(self.searchPhrase) }
                ) { sandwhich in
                    SandwichRow(sandwhich: sandwhich)
                }
                .navigationBarTitle("Sandwiches")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(sandwitches: sandwitches)
        .environment(\.colorScheme, .dark)
    
//        ContentView(sandwitches: sandwitches)
//        .environment(\.colorScheme, .light)
        
    }
}

struct SearchView: View {
    @Binding var searchPhrase: String
    @State private var showCancelButton: Bool = false
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("search", text: $searchPhrase, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)

                Button(action: {
                    self.searchPhrase = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchPhrase == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if showCancelButton  {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                    self.searchPhrase = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton).animation(.default)
    }
}
