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
                        description_1: sarah.description_1,
                        description_2: sarah.description_2,
                        description_3: sarah.description_3,
                        description_4: sarah.description_4,
                        www_title: sarah.what_went_wrong.title,
                        www_point1: sarah.what_went_wrong.text_1,
                        www_point2: sarah.what_went_wrong.text_2,
                        www_point3: sarah.what_went_wrong.text_3,
                        
                        sort_title: sarah.how_to_sort.title,
                        sort_point1: sarah.how_to_sort.text_1,
                        sort_point2: sarah.how_to_sort.text_2,
                        sort_point3: sarah.how_to_sort.text_3,
                        
                        diff_title: sarah.have_done_differently.title,
                        diff_point1: sarah.have_done_differently.text_1,
                        diff_point2: sarah.have_done_differently.text_2,
                        diff_point3: sarah.have_done_differently.text_3,
                        
                        solutions_title: sarah.solutions_and_resources.title,
                        solutions_point1: sarah.solutions_and_resources.text_1,
                        solutions_point2: sarah.solutions_and_resources.text_2,
                        solutions_point3: sarah.solutions_and_resources.text_3
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
