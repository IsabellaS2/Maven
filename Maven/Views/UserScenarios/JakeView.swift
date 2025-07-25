//
//  JakeView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct JakeView: View {
    let jake: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: jake.title,
                        subtitle: jake.subtitle,
                        image: "jakeImage",
                        description1: jake.description1,
                        description2: jake.description2,
                        description3: jake.description3,
                        description4: jake.description4,
                        wwwTitle: jake.whatWentWrong.title,
                        wwwPoint1: jake.whatWentWrong.text1,
                        wwwPoint2: jake.whatWentWrong.text2,
                        wwwPoint3: jake.whatWentWrong.text3,

                        sortTitle: jake.howToSort.title,
                        sortPoint1: jake.howToSort.text1,
                        sortPoint2: jake.howToSort.text2,
                        sortPoint3: jake.howToSort.text3,

                        diffTitle: jake.haveDoneDifferently.title,
                        diffPoint1: jake.haveDoneDifferently.text1,
                        diffPoint2: jake.haveDoneDifferently.text2,
                        diffPoint3: jake.haveDoneDifferently.text3,

                        solutionsTitle: jake.solutionsAndResources.title,
                        solutionsPoint1: jake.solutionsAndResources.text1,
                        solutionsPoint2: jake.solutionsAndResources.text2,
                        solutionsPoint3: jake.solutionsAndResources.text3
                    )

                    HStack {
                        CardComponent(
                            title: "LOANS",
                            description: "Understanding Personal Loans",
                            icon: "banknote"
                        )

                        LongCardComponent(
                            title: "MORTGAGES",
                            description: "Bank Accounts & Savings (UK)",
                            icon: "building.columns"
                        )
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
