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
                        image: "",
                        description_1: mofiz.description_1,
                        description_2: mofiz.description_2,
                        description_3: mofiz.description_3,
                        description_4: mofiz.description_4,
                        www_title: mofiz.what_went_wrong.title,
                        www_point1: mofiz.what_went_wrong.text_1,
                        www_point2: mofiz.what_went_wrong.text_2,
                        www_point3: mofiz.what_went_wrong.text_3,
                        
                        sort_title: mofiz.how_to_sort.title,
                        sort_point1: mofiz.how_to_sort.text_1,
                        sort_point2: mofiz.how_to_sort.text_2,
                        sort_point3: mofiz.how_to_sort.text_3,
                        
                        diff_title: mofiz.have_done_differently.title,
                        diff_point1: mofiz.have_done_differently.text_1,
                        diff_point2: mofiz.have_done_differently.text_2,
                        diff_point3: mofiz.have_done_differently.text_3,
                        
                        solutions_title: mofiz.solutions_and_resources.title,
                        solutions_point1: mofiz.solutions_and_resources.text_1,
                        solutions_point2: mofiz.solutions_and_resources.text_2,
                        solutions_point3: mofiz.solutions_and_resources.text_3
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


