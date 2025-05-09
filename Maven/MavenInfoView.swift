//
//  MavenInfoView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 08/05/2025.
//

import SwiftUI

struct MavenInfoView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .center, spacing: 24) {

                    // Title Section
                    VStack(spacing: 8) {
                        Text("MAVEN")
                            .font(.system(size: 64, weight: .bold))
                            .multilineTextAlignment(.center)

                        Text("(Maturity, Awareness, Value,\nEducation, Navigation)")
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                    }

                    // What is a MAVEN Score?
                    VStack(alignment: .center, spacing: 8) {
                        Text("What is a MAVEN score?")
                            .font(.headline)

                        Text("""
A MAVEN score is a unique financial literacy and behaviour score that measures how well you understand and manage credit. Unlike a traditional credit score (which only looks at past borrowing history), this score reflects your financial knowledge and behaviour.
""")
                    }
                    .padding(.horizontal, 15.0)
                    

                    // Icons
                    HStack(spacing: 40) {
                        Image(systemName: "books.vertical")
                            .font(.largeTitle)
                        Image(systemName: "creditcard")
                            .font(.largeTitle)
                    }
                    
                    Text("How is your MAVEN Score calculated?")
                        .font(.headline)
                        .padding(.bottom, 8)

                    // Score Calculation Section
                    VStack(alignment: .center, spacing: 12) {


                        VStack(alignment: .leading, spacing: 4) {
                            Text("**Financial Knowledge**")
                            Text("""
This calculates your financial knowledge based on your interactions and results with products on ClearScore. This can include:

1. Completing quizzes  
2. Watching Improve Videos  
3. Completing User Scenarios
""")
                        }
                        .padding(.bottom, 12.0)
                        

                        VStack(alignment: .leading, spacing: 4) {
                            Text("**Behaviour**")
                            Text("""
This looks at your banking transactions and accounts and analyses a score based on many factors including:

1. Types of payments  
2. Credit utilisation  
3. Savings accounts
""")
                        }
                    }
                    .padding(.horizontal, 30.0)

                    
                    
                    // Level Meaning Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("What does the level mean?")
                            .font(.headline)

                        Text("""
There are 4 types of levels you can have with a maturity level. They are all based on the score you have.

1. Explorer (0–399)  
2. Builder – (400–649)  
3. Strategist – (650–849)  
4. Champion – (850–1000)

As your score increases, you can bump up to the next level!
""")
                    }
                    .padding(.horizontal, 30.0)

                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}


#Preview {
    MavenInfoView()
}
