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
                        description_1: jake.description_1,
                        description_2: jake.description_2,
                        description_3: jake.description_3,
                        description_4: jake.description_4,
                        www_title: jake.what_went_wrong.title,
                        www_point1: jake.what_went_wrong.text_1,
                        www_point2: jake.what_went_wrong.text_2,
                        www_point3: jake.what_went_wrong.text_3,
                        
                        sort_title: jake.how_to_sort.title,
                        sort_point1: jake.how_to_sort.text_1,
                        sort_point2: jake.how_to_sort.text_2,
                        sort_point3: jake.how_to_sort.text_3,
                        
                        diff_title: jake.have_done_differently.title,
                        diff_point1: jake.have_done_differently.text_1,
                        diff_point2: jake.have_done_differently.text_2,
                        diff_point3: jake.have_done_differently.text_3,
                        
                        solutions_title: jake.solutions_and_resources.title,
                        solutions_point1: jake.solutions_and_resources.text_1,
                        solutions_point2: jake.solutions_and_resources.text_2,
                        solutions_point3: jake.solutions_and_resources.text_3
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
