//
//  FoodItemCell.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 7/26/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct FoodItemCell: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2.0))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }.layoutPriority(1)
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(self.colors[restriction])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct FoodItemCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemCell(item: MenuItem.example)
    }
}
