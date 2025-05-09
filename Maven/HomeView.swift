//
//  ContentView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            VStack {
                Text("MAVEN Score")
                    .font(.system(size: 45, weight: .bold))
                    .padding(.bottom, 6.0)

                Text("What is a MAVEN Score?")
                    .font(.inter14)
                    .underline(true, pattern: .solid)

                Text("450")
                    .font(.system(size: 64, weight: .heavy))
                Text("Level: Builder")
                
                
                Text("Latest Updates")
                Spacer()

                HStack {
                    VStack(alignment: .leading) {
                        Text("Credit card utilisation has improved this month")
                            .font(.headline)
                            .padding(.bottom, 5)
                        Text("Your score might go up soon! ")
                    }
                }
                .padding(15.0)
                .background(Color.white)
                .cornerRadius(10)
                
                
                

                // Cards - Financial Knowledge Centre and Financial Habits
                HStack(spacing: 4) {
                    VStack(alignment: .leading) {
                        Text("📚 Financial Knowledge Center")
                            .font(.inter14)
                            .padding(.bottom, 2.0)


                        Text("Learn, grow, and master your money")
                            .font(.interLight14)

                        Spacer()
                        Text("🎥 Videos\n🧩 Quizzes\n👥 User Scenarios")
                            .font(.interLight14)

                    }
                    .padding(10.0)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity) // Makes both VStacks take equal space

                    VStack(alignment: .leading) {
                        Text("📊 Your Financial Habits ")
                            .font(.inter14)
                            .padding(.bottom, 2.0)

                        Text("See how your behaviour shapes your score!")
                            .font(.interLight14)

                        Spacer()
                        Text("📊 Credit Card Usage\n💳 Loans & Payments\n🛒 Buy Now, Pay Later (BNPL) Usage")
                            .font(.interLight14)

                    }
                    .padding(10.0)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 180.0)


                

                
            }
            .padding()
        }
    }
}

extension Font {
    static var inter14: Font {
        Font.custom("Inter", size: 16).weight(.medium)
    }
    
    static var interLight14: Font {
        Font.custom("Inter", size: 14).weight(.light)
    }
}


#Preview {
    HomeView()
}
