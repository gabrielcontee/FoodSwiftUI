//
//  MenuSection.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 7/26/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}
