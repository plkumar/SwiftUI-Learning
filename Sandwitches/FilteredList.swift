//
//  FilteredList.swift
//  Sandwitches
//
//  Created by Lakshman Peethani on 07/07/20.
//  Copyright © 2020 Lakshman Peethani. All rights reserved.
//

import SwiftUI

public struct FilteredList<Element, FilterKey, RowContent>: View
        where Element: Identifiable, RowContent: View {

    private let data: [Element]
    private let filterKey: KeyPath<Element, FilterKey>
    private let isIncluded: (FilterKey) -> Bool
    private let rowContent: (Element) -> RowContent

    public init(
        _ data: [Element],
        filterBy key: KeyPath<Element, FilterKey>,
        isIncluded: @escaping (FilterKey) -> Bool,
        @ViewBuilder rowContent: @escaping (Element) -> RowContent
    ) {
        self.data = data
        self.filterKey = key
        self.isIncluded = isIncluded
        self.rowContent = rowContent
    }

    public var body: some View {
        let filteredData = data.filter {
            isIncluded($0[keyPath: filterKey])
        }

        return List(filteredData, rowContent: rowContent).animation(.default)
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}

