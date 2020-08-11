//
//  FoodDetailsView.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 7/26/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct FoodDetailsView: View {
    
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .font(.caption)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }.navigationBarTitle(item.name)
    }
}

struct FoodDetailsView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            FoodDetailsView(item: MenuItem.example).environmentObject(order)
        }
    }
}
