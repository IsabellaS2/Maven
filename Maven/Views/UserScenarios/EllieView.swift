//
//  EllieView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 27/05/2025.
//

import SwiftUI

struct EllieView: View {
    let ellie: Scenario

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 8) {
                    UserScenarioView(
                        title: ellie.title,
                        subtitle: ellie.subtitle,
                        image: "ellieImage",
                        description1: ellie.description1,
                        description2: ellie.description2,
                        description3: ellie.description3,
                        description4: ellie.description4,
                        wwwTitle: ellie.whatWentWrong.title,
                        wwwPoint1: ellie.whatWentWrong.text1,
                        wwwPoint2: ellie.whatWentWrong.text2,
                        wwwPoint3: ellie.whatWentWrong.text3,

                        sortTitle: ellie.howToSort.title,
                        sortPoint1: ellie.howToSort.text1,
                        sortPoint2: ellie.howToSort.text2,
                        sortPoint3: ellie.howToSort.text3,

                        diffTitle: ellie.haveDoneDifferently.title,
                        diffPoint1: ellie.haveDoneDifferently.text1,
                        diffPoint2: ellie.haveDoneDifferently.text2,
                        diffPoint3: ellie.haveDoneDifferently.text3,

                        solutionsTitle: ellie.solutionsAndResources.title,
                        solutionsPoint1: ellie.solutionsAndResources.text1,
                        solutionsPoint2: ellie.solutionsAndResources.text2,
                        solutionsPoint3: ellie.solutionsAndResources.text3
                    )

                    HStack {
                        CardComponent(
                            title: "CREDIT CARDS",
                            description: "Credit Cards - Basics",
                            icon: "creditcard"
                        )
                        CardComponent(
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
