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
                        description_1: ellie.description_1,
                        description_2: ellie.description_2,
                        description_3: ellie.description_3,
                        description_4: ellie.description_4,
                        www_title: ellie.what_went_wrong.title,
                        www_point1: ellie.what_went_wrong.text_1,
                        www_point2: ellie.what_went_wrong.text_2,
                        www_point3: ellie.what_went_wrong.text_3,
                        
                        sort_title: ellie.how_to_sort.title,
                        sort_point1: ellie.how_to_sort.text_1,
                        sort_point2: ellie.how_to_sort.text_2,
                        sort_point3: ellie.how_to_sort.text_3,
                        
                        diff_title: ellie.have_done_differently.title,
                        diff_point1: ellie.have_done_differently.text_1,
                        diff_point2: ellie.have_done_differently.text_2,
                        diff_point3: ellie.have_done_differently.text_3,
                        
                        solutions_title: ellie.solutions_and_resources.title,
                        solutions_point1: ellie.solutions_and_resources.text_1,
                        solutions_point2: ellie.solutions_and_resources.text_2,
                        solutions_point3: ellie.solutions_and_resources.text_3
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
