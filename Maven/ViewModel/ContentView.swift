//
//  ContentView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                if let scenarios = loadScenarios() {
                    NavigationLink(destination: EllieView(ellie: scenarios.elliesCreditCardStruggles)) {
                        Text("Go to Ellie’s Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: MariaView(maria: scenarios.mariasBnplTrouble)) {
                        Text("Go to Maria’s Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: MarcusView(marcus: scenarios.marcussMortgageMisunderstanding)) {
                        Text("Go to Marcus’s Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: SarahView(sarah: scenarios.sarahsCreditCardBalanceTransferMisstep)) {
                        Text("Go to Sarah's Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: JakeView(jake: scenarios.jakesDebtManagementStruggles)) {
                        Text("Go to Jake’s Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: MofizView(mofiz: scenarios.mofizsCarLoanOversight)) {
                        Text("Go to Mofiz's Scenario")
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    

                } else {
                    Text("Failed to load scenarios.")
                        .padding()
                }
            }
            .navigationBarTitle("Scenarios", displayMode: .inline)
        }
    }
}
