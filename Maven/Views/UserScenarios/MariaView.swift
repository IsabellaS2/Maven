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
                        description_1: maria.description_1,
                        description_2: maria.description_2,
                        description_3: maria.description_3,
                        description_4: maria.description_4,
                        www_title: maria.what_went_wrong.title,
                        www_point1: maria.what_went_wrong.text_1,
                        www_point2: maria.what_went_wrong.text_2,
                        www_point3: maria.what_went_wrong.text_3,
                        
                        sort_title: maria.how_to_sort.title,
                        sort_point1: maria.how_to_sort.text_1,
                        sort_point2: maria.how_to_sort.text_2,
                        sort_point3: maria.how_to_sort.text_3,
                        
                        diff_title: maria.have_done_differently.title,
                        diff_point1: maria.have_done_differently.text_1,
                        diff_point2: maria.have_done_differently.text_2,
                        diff_point3: maria.have_done_differently.text_3,
                        
                        solutions_title: maria.solutions_and_resources.title,
                        solutions_point1: maria.solutions_and_resources.text_1,
                        solutions_point2: maria.solutions_and_resources.text_2,
                        solutions_point3: maria.solutions_and_resources.text_3
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

