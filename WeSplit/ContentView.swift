//
//  ContentView.swift
//  WeSplit
//
//  Created by Bouabida Rodrigo on 14/05/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmout = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage =  20
    @FocusState private var amountIsfocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double (numberOfPeople + 2)
        let tipSelection = Double (tipPercentage)
        
        let tipValue = checkAmout / 100 * tipSelection
        let grandTotal = checkAmout + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsfocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section("How much you want to tip ?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                    
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsfocused {
                    Button("Done") {
                        amountIsfocused = false
                    }
                }
            }
        }
        
    }
}
#Preview {
    ContentView()
}
