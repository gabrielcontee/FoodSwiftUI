//
//  FoodOrderView.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 8/2/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct FoodOrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place order")
                    }
                }.disabled(order.items.isEmpty)
                
            }.navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct FoodOrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        FoodOrderView().environmentObject(order)
    }
}
