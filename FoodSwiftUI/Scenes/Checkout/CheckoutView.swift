//
//  CheckoutView.swift
//  FoodSwiftUI
//
//  Created by Gabriel Figueiredo Conde on 8/2/20.
//  Copyright © 2020 Gabriel Figueiredo Conte. All rights reserved.
//

import SwiftUI

enum PaymentTypes: String, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case iDinePoint = "Fidelity Points"
}

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var paymentType: PaymentTypes?
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmountIndex = 0
    @State private var showingPaymentAlert = false
    
    private let defaultTips = [0, 1, 2, 3, 5]
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(defaultTips[tipAmountIndex])
        return total + tipValue
    }
    
    let allPaymentTypes = PaymentTypes.allCases.map {
        "\($0.rawValue)"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< allPaymentTypes.count) {
                        Text(self.allPaymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Use points")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your points ID", text: $loyaltyNumber)
                        .keyboardType(.numberPad)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Amount ", selection: $tipAmountIndex) {
                    ForEach(0 ..< defaultTips.count) {
                        Text("$\(self.defaultTips[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"),
                      message: Text("Your total was $\(totalPrice, specifier: "%.2f")"),
                      dismissButton: .default(Text("Ok"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                      }))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
