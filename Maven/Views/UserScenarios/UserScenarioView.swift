//
//  UserScenarioView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

struct UserScenarioView: View {
    var title: String
    var subtitle: String
    var image: String
    var description_1: String
    var description_2: String
    var description_3: String
    var description_4: String

    var www_title: String
    var www_point1: String
    var www_point2: String
    var www_point3: String

    var sort_title: String
    var sort_point1: String
    var sort_point2: String
    var sort_point3: String

    var diff_title: String
    var diff_point1: String
    var diff_point2: String
    var diff_point3: String

    var solutions_title: String
    var solutions_point1: String
    var solutions_point2: String
    var solutions_point3: String

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                Text(title)
                    .font(.midTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20.0)
                    .padding(.bottom, 10.0)

                Text(subtitle)
                    .font(.font18Subtitle)
                    .padding(.bottom, 6.0)

                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 160)
                        .padding(.trailing, 10.0)

                    VStack(alignment: .leading) {
                        Text(description_1)
                            .font(.font16)
                            .padding(.bottom, 2.0)
                        Text(description_2)
                            .font(.font16Light)
                            .padding(.bottom, 2.0)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(description_3)
                            .font(.font16Light)
                    }
                    .padding(10.0)
                }
                Text(description_4)
                    .font(.font16Light)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 10.0)

                // What did Person do wrong?
                UserScenarioTextComponent(
                    title: www_title,
                    point1: www_point1,
                    point2: www_point2,
                    point3: www_point3
                )

                // What can Person do now to sort this out
                UserScenarioTextComponent(
                    title: sort_title,
                    point1: sort_point1,
                    point2: sort_point2,
                    point3: sort_point3
                )

                // What could Person have done differently?
                UserScenarioTextComponent(
                    title: diff_title,
                    point1: diff_point1,
                    point2: diff_point2,
                    point3: diff_point3
                )

                // Solutions & Learning Resources
                UserScenarioTextComponent(
                    title: solutions_title,
                    point1: solutions_point1,
                    point2: solutions_point2,
                    point3: solutions_point3
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
