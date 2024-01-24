//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Micko, Sebastian (AMM) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nitroPackage = false
    @State private var luggage = false
    @State private var remainingFunds: Int = 1000
    
    var exhaustPackageCheck: Bool {
        if exhaustPackage == true {
            return true
        }
        else if remainingFunds >= 500 {
            return true
        }
        else {
            return false
        }
        
    }
    
    var tiresPackageCheck: Bool {
        if tiresPackage == true {
            return true
        }
        else if remainingFunds >= 500 {
            return true
        }
        else {
            return false
        }
        
    }
    
    var nitroPackageCheck: Bool {
        if nitroPackage == true {
            return true
        }
        else if remainingFunds >= 500 {
            return true
        }
        else {
            return false
        }
        
    }
    
    var luggageCheck: Bool {
        if luggage == true {
            return true
        }
        else if remainingFunds >= 1000 {
            return true
        }
        else {
            return false
        }
        
    }
    
    func displayReset() {
        exhaustPackage = false
        tiresPackage = false
        nitroPackage = false
        luggage = false
        remainingFunds = 1000
    }
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
        }
        )
        
        let TiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
        }
        )
        
        let LuggageBinding = Binding<Bool> (
            get: { self.luggage },
            set: { newValue in
                self.luggage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration += 1
                    remainingFunds += 1000
                }
        }
        )
        
        let NitroPackageBinding = Binding<Bool> (
            get: { self.nitroPackage },
            set: { newValue in
                self.nitroPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 0.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                    remainingFunds += 500
                }
        }
        )
        
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayAttributes())
                    Button("Next car", action: {
                        if selectedCar < self.starterCars.cars.count - 1 {
                            selectedCar += 1
                            displayReset()
                        }
                        else {
                            selectedCar = 0
                            displayReset()
                        }
                    })
                }
                Section {
                    Toggle("Exhaust Package (500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageCheck)
                    Toggle("Tires Package (500)", isOn: TiresPackageBinding)
                        .disabled(!tiresPackageCheck)
                    Toggle("Nitro Package (500)", isOn: NitroPackageBinding)
                        .disabled(!nitroPackageCheck)
                    Toggle("Luggage (1000)", isOn: LuggageBinding)
                        .disabled(!luggageCheck)
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
}



#Preview {
    ContentView()
}
    


