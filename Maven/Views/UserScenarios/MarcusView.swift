//
//  MarcusView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct MarcusView: View {
    let marcus: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: marcus.title,
                        subtitle: marcus.subtitle,
                        image: "marcusImage",
                        description1: marcus.description1,
                        description2: marcus.description2,
                        description3: marcus.description3,
                        description4: marcus.description4,
                        wwwTitle: marcus.whatWentWrong.title,
                        wwwPoint1: marcus.whatWentWrong.text1,
                        wwwPoint2: marcus.whatWentWrong.text2,
                        wwwPoint3: marcus.whatWentWrong.text3,

                        sortTitle: marcus.howToSort.title,
                        sortPoint1: marcus.howToSort.text1,
                        sortPoint2: marcus.howToSort.text2,
                        sortPoint3: marcus.howToSort.text3,

                        diffTitle: marcus.haveDoneDifferently.title,
                        diffPoint1: marcus.haveDoneDifferently.text1,
                        diffPoint2: marcus.haveDoneDifferently.text2,
                        diffPoint3: marcus.haveDoneDifferently.text3,

                        solutionsTitle: marcus.solutionsAndResources.title,
                        solutionsPoint1: marcus.solutionsAndResources.text1,
                        solutionsPoint2: marcus.solutionsAndResources.text2,
                        solutionsPoint3: marcus.solutionsAndResources.text3
                    )

                    HStack {
                        CardComponent(
                            title: "MORTGAGES",
                            description: "Mortgage Basics",
                            icon: "house.fill"
                        )

                        LongCardComponent(
                            title: "LOANS",
                            description: "Understanding Personal Loans",
                            icon: "banknote"
                        )
                    }
                    .padding(.horizontal)

                }
            }
        }
    }
}
