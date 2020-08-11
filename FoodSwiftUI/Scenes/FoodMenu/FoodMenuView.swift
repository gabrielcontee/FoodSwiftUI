//
//  FoodMenuView.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 7/25/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct FoodMenuView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { foodSection in
                    Section(header: Text(foodSection.name)) {            ForEach(foodSection.items) { item in
                        NavigationLink(destination: FoodDetailsView(item: item)) {
                                FoodItemCell(item: item)
                            }
                        }
                    }
                }
            }.navigationBarTitle("Menu")
                .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMenuView()
    }
}
