//
//  ContentView.swift
//  WeSplit
//
//  Created by Isaac Karam on 2/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmountOfCheck: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = (orderAmount / 100) * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        if peopleCount > 0 {
            let amountPerPerson = totalAmountOfCheck / peopleCount
            return amountPerPerson
        }
        else
        {
            return 0
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    //                    Picker("Number of people", selection: $numberOfPeople) {
                    //                        ForEach(2 ..< 100){
                    //                            Text("\($0) people")
                    //                        }
                    //                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                Section (header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section (header: Text("Total amount of Check")){
                    Text("$\(totalAmountOfCheck, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
