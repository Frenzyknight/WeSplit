//
//  ContentView.swift
//  WeSplit
//
//  Created by Gaurav Ganju on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
   // @FocusState private var amountIsFocused: Bool
   
    let tipPercentages = [0, 10, 15, 20, 25, 30, 35, 40, 45, 50]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalAmount: Double {
        (totalPerPerson) * Double(numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                        .currency(code: Locale.current.currencyCode ?? "INR"))
                        .keyboardType(.decimalPad)
                //        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("ENter Amount To Split")
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Tip Amount")
                }
                Section {
                    Text(totalPerPerson,format: .currency(code:
                        Locale.current.currencyCode ?? "INR"))
                } header: {
                    Text("Amount per person")
                }
                Section {
                    Text(totalAmount, format: .currency(code:
                        Locale.current.currencyCode ?? "INR") )
                } header: {
                    Text("Total Amount With Tip")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                  //     amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
