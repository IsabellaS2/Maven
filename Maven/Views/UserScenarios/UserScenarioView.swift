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
    var description1: String
    var description2: String
    var description3: String
    var description4: String

    var wwwTitle: String
    var wwwPoint1: String
    var wwwPoint2: String
    var wwwPoint3: String

    var sortTitle: String
    var sortPoint1: String
    var sortPoint2: String
    var sortPoint3: String

    var diffTitle: String
    var diffPoint1: String
    var diffPoint2: String
    var diffPoint3: String

    var solutionsTitle: String
    var solutionsPoint1: String
    var solutionsPoint2: String
    var solutionsPoint3: String

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
                        .frame(width: 160, height: 180)
                        .padding(.trailing, 10.0)

                    VStack(alignment: .leading) {
                        Text(description1)
                            .font(.font16)
                            .padding(.bottom, 2.0)

                        Text(description2)
                            .font(.font16Light)
                            .padding(.bottom, 2.0)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(description3)
                            .font(.font16Light)
                    }
                    .padding(10.0)
                }

                Text(description4)
                    .font(.font16Light)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 10.0)

                // What did Person do wrong?
                UserScenarioTextComponent(
                    title: wwwTitle,
                    point1: wwwPoint1,
                    point2: wwwPoint2,
                    point3: wwwPoint3
                )

                // What can Person do now to sort this out
                UserScenarioTextComponent(
                    title: sortTitle,
                    point1: sortPoint1,
                    point2: sortPoint2,
                    point3: sortPoint3
                )

                // What could Person have done differently?
                UserScenarioTextComponent(
                    title: diffTitle,
                    point1: diffPoint1,
                    point2: diffPoint2,
                    point3: diffPoint3
                )

                // Solutions & Learning Resources
                UserScenarioTextComponent(
                    title: solutionsTitle,
                    point1: solutionsPoint1,
                    point2: solutionsPoint2,
                    point3: solutionsPoint3
                )
            }
            .padding(10.0)
        }
    }
}
