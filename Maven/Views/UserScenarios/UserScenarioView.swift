//
//  UserScenarioView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

struct UserScenarioView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                Text("Ellie’s Credit Card Struggles")
                    .font(.midTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20.0)
                    .padding(.bottom, 10.0)

                Text("User Scenario - Credit Cards")
                    .font(.font18Subtitle)
                    .padding(.bottom, 6.0)

                HStack {
                    Image("ellie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.trailing, 10.0)

                    VStack(alignment: .leading) {
                        Text("This is Ellie!")
                            .font(.font16)
                            .padding(.bottom, 2.0)
                        Text("She is 21 and loves to shop.\nShe just got her first credit card.")
                            .font(.font16Light)
                            .padding(.bottom, 2.0)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("However, she doesn’t really understand how they work.")
                            .font(.font16Light)
                    }
                    .padding(10.0)
                }
                Text("After only a few months, she missed 2 payments and her credit score dropped by 50 points. ")
                    .font(.font16Light)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 10.0)

                // What did Ellie do wrong?
                UserScenarioTextComponent(
                    title: "What did Ellie do wrong?",
                    point1: "1. 💰 Ellie didn’t budget her spending - she spent more than she had and didn’t pay it off in time",
                    point2: "2. ⏲️ Ellie didn’t set up reminders for her credit card payments.",
                    point3: "3. 📚 Ellie didn’t read about credit card interest rates. She didn’t learn what they are, and what impact they can have."
                )

                // What can Ellie do now to sort this out
                UserScenarioTextComponent(
                    title: "What can Ellie do now to sort this out?",
                    point1: "1. 🏦 Pay off her missing payments as soon as possible to prevent further interest from accumulating and to bring her account back to good standing.",
                    point2: "2. 📞 Contact her credit card provider to set up a repayment plan or request waiving late fees if possible.",
                    point3: "3. ✅ Check her credit report to ensure no errors are impacting her score."
                )

                // What could Ellie have done differently?
                UserScenarioTextComponent(
                    title: "What could Ellie have done differently?",
                    point1: "1. 🚧 Set a spending limit for herself to ensure she could afford her credit card bills.",
                    point2: "2. 🗓️ Enable automatic payments or set reminders to avoid missing due dates.",
                    point3: "3. 📽️ Watch videos or read resources about credit card basics to understand how interest and payments work.."
                )

                // Solutions & Learning Resources
                UserScenarioTextComponent(
                    title: "Solutions & Learning Resources",
                    point1: "Always pay at least the minimum balance on time.",
                    point2: "Understand the APR and interest rates before using a credit card..",
                    point3: "Track your spending to avoid overspending.."
                )

                HStack {
                    CardComponent(
                        title: "CREDIT CARDS",
                        description: "What is a purchase credit card?",
                        icon: "cart"
                    )
                    LongCardComponent(
                        title: "CREDIT CARDS",
                        description: "What is a credit balance?",
                        icon: "scalemass"
                    )
                }

            }
            .padding(10.0)
        }
    }

}

#Preview {
    UserScenarioView()
}
