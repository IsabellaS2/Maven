//
//  UserScenarioTextComponent.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

struct UserScenarioTextComponent: View {
    var title: String
    var point1: String
    var point2: String
    var point3: String

    var body: some View {
        VStack {
            Text(title)
                .font(.font24Subtitle)
                .padding(.vertical, 10.0)
                .multilineTextAlignment(.center)

            HStack {
                Text(point1)
                    .font(.font16)
                    .padding(.bottom, 10.0)
                Spacer()
            }

            HStack {
                Text(point2)
                    .font(.font16)
                    .padding(.bottom, 10.0)

                Spacer()
            }

            HStack {
                Text(point3)
                    .font(.font16)
                Spacer()
            }
            Rectangle()
                .fill(Color.black)
                .frame(height: 2)
                .padding(.vertical, 16)

        }
        .padding(.horizontal, 10.0)
    }

}

#Preview {
    UserScenarioTextComponent(
        title: "What could Ellie have done differently?",
        point1: "1. 💰 Ellie didn’t budget her spending - she spent more than she had and didn’t pay it off in time",
        point2: "2. ⏲️ Ellie didn’t set up reminders for her credit card payments.",
        point3: "3. 📚 Ellie didn’t read about credit card interest rates."
    )
}
