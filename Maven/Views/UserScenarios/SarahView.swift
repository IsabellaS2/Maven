//
//  SarahView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct SarahView: View {
    let sarah: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: sarah.title,
                        subtitle: sarah.subtitle,
                        image: "sarahImage",
                        description1: sarah.description1,
                        description2: sarah.description2,
                        description3: sarah.description3,
                        description4: sarah.description4,
                        wwwTitle: sarah.whatWentWrong.title,
                        wwwPoint1: sarah.whatWentWrong.text1,
                        wwwPoint2: sarah.whatWentWrong.text2,
                        wwwPoint3: sarah.whatWentWrong.text3,

                        sortTitle: sarah.howToSort.title,
                        sortPoint1: sarah.howToSort.text1,
                        sortPoint2: sarah.howToSort.text2,
                        sortPoint3: sarah.howToSort.text3,

                        diffTitle: sarah.haveDoneDifferently.title,
                        diffPoint1: sarah.haveDoneDifferently.text1,
                        diffPoint2: sarah.haveDoneDifferently.text2,
                        diffPoint3: sarah.haveDoneDifferently.text3,

                        solutionsTitle: sarah.solutionsAndResources.title,
                        solutionsPoint1: sarah.solutionsAndResources.text1,
                        solutionsPoint2: sarah.solutionsAndResources.text2,
                        solutionsPoint3: sarah.solutionsAndResources.text3
                    )

                    HStack(spacing: 16) {
                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Balance Transfers Explained",
                            icon: "dollarsign.arrow.circlepath"
                        )
                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Credit Cards - Basics & Best Practices",
                            icon: "creditcard"
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
    }
}
