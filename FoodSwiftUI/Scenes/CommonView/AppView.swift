//
//  AppView.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 8/2/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            FoodMenuView()
                .tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            
            FoodOrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
