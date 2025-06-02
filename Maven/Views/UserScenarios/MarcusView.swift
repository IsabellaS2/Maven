//
//  MarcusView.swift
//  Maven
//
//  Created by Isabella Sulisufi on 28/05/2025.
//

import SwiftUI

struct MarcusView: View {
    let marcus: Scenario

    var body: some View {
        VStack {
            UserScenarioView(
                title: marcus.title,
                subtitle: marcus.subtitle,
                image: "",
                description_1: marcus.description_1,
                description_2: marcus.description_2,
                description_3: marcus.description_3,
                description_4: marcus.description_4,
                www_title: marcus.what_went_wrong.title,
                www_point1: marcus.what_went_wrong.text_1,
                www_point2: marcus.what_went_wrong.text_2,
                www_point3: marcus.what_went_wrong.text_3,

                sort_title: marcus.how_to_sort.title,
                sort_point1: marcus.how_to_sort.text_1,
                sort_point2: marcus.how_to_sort.text_2,
                sort_point3: marcus.how_to_sort.text_3,

                diff_title: marcus.have_done_differently.title,
                diff_point1: marcus.have_done_differently.text_1,
                diff_point2: marcus.have_done_differently.text_2,
                diff_point3: marcus.have_done_differently.text_3,

                solutions_title: marcus.solutions_and_resources.title,
                solutions_point1: marcus.solutions_and_resources.text_1,
                solutions_point2: marcus.solutions_and_resources.text_2,
                solutions_point3: marcus.solutions_and_resources.text_3
            )
        }
    }
}
