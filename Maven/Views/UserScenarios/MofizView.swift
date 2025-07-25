//
//  MofizView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct MofizView: View {
    let mofiz: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: mofiz.title,
                        subtitle: mofiz.subtitle,
                        image: "mofizImage",
                        description1: mofiz.description1,
                        description2: mofiz.description2,
                        description3: mofiz.description3,
                        description4: mofiz.description4,
                        wwwTitle: mofiz.whatWentWrong.title,
                        wwwPoint1: mofiz.whatWentWrong.text1,
                        wwwPoint2: mofiz.whatWentWrong.text2,
                        wwwPoint3: mofiz.whatWentWrong.text3,

                        sortTitle: mofiz.howToSort.title,
                        sortPoint1: mofiz.howToSort.text1,
                        sortPoint2: mofiz.howToSort.text2,
                        sortPoint3: mofiz.howToSort.text3,

                        diffTitle: mofiz.haveDoneDifferently.title,
                        diffPoint1: mofiz.haveDoneDifferently.text1,
                        diffPoint2: mofiz.haveDoneDifferently.text2,
                        diffPoint3: mofiz.haveDoneDifferently.text3,

                        solutionsTitle: mofiz.solutionsAndResources.title,
                        solutionsPoint1: mofiz.solutionsAndResources.text1,
                        solutionsPoint2: mofiz.solutionsAndResources.text2,
                        solutionsPoint3: mofiz.solutionsAndResources.text3
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
