//
//  MariaView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct MariaView: View {
    let maria: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: maria.title,
                        subtitle: maria.subtitle,
                        image: "mariaImage",
                        description1: maria.description1,
                        description2: maria.description2,
                        description3: maria.description3,
                        description4: maria.description4,
                        wwwTitle: maria.whatWentWrong.title,
                        wwwPoint1: maria.whatWentWrong.text1,
                        wwwPoint2: maria.whatWentWrong.text2,
                        wwwPoint3: maria.whatWentWrong.text3,

                        sortTitle: maria.howToSort.title,
                        sortPoint1: maria.howToSort.text1,
                        sortPoint2: maria.howToSort.text2,
                        sortPoint3: maria.howToSort.text3,

                        diffTitle: maria.haveDoneDifferently.title,
                        diffPoint1: maria.haveDoneDifferently.text1,
                        diffPoint2: maria.haveDoneDifferently.text2,
                        diffPoint3: maria.haveDoneDifferently.text3,

                        solutionsTitle: maria.solutionsAndResources.title,
                        solutionsPoint1: maria.solutionsAndResources.text1,
                        solutionsPoint2: maria.solutionsAndResources.text2,
                        solutionsPoint3: maria.solutionsAndResources.text3
                    )

                    HStack {
                        CardComponent(
                            title: "BNPL",
                            description: "Buy Now, Pay Later",
                            icon: "cart.badge.plus"
                        )

                        LongCardComponent(
                            title: "CREDIT CARDS",
                            description: "Understanding APR, Interest & Charges",
                            icon: "dollarsign.circle"
                        )
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
