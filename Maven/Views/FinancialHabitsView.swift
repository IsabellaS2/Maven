//
//  FinancialHabitsView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 02/06/2025.
//

import SwiftUI

struct FinancialHabitsView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                
                VStack(spacing: 24) {
                    
                    Text("📊 Your Financial Habits & Score Impact")
                        .font(.midTitle)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("""
                        🔍 A personalised look at your financial habits - see what you're doing well and where you can improve! 💰✨
                        """)
                        .font(.font16)
                        .padding(.bottom, 6.0)
                        
                        Text("✅ What’s Going Well")
                            .font(.font24Subtitle)
                        
                        LongCardComponent(
                            title: "💸 On-time Loan Payments",
                            description: "You always pay on time! This builds trust with lenders and strengthens your score.",
                            icon: "",
                            tag: "Keep up the good work!"
                        )
                        
                        Text("⚠️ What Needs Improvement ")
                            .font(.font24Subtitle)
                    }
                }
                .padding(.horizontal, 15.0)
            }
        }
    }
}
