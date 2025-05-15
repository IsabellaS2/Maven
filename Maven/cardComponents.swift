//
//  CardComponents.swift
//  Maven
//
//  Created by Isabella Sulisufi on 13/05/2025.
//

import SwiftUI

// struct SmallCard: View {
//    let icon: String
//    let header: String?
//    let title: String
//    let description: String
//    let tag: String?
//
//    init(title: String, description: String, icon: String, header: String? = nil, tag: String? = nil) {
//        self.title = title
//        self.description = description
//        self.icon = icon
//        self.header = header
//        self.tag = tag
//    }
//
//    var body: some View {
//
//        Button(action: {
//            // Action for the button
//        }) {
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Image(systemName: icon)
//                        .font(.title2)
//                        .foregroundColor(.black)
//
//                    if let header = header {
//                        Text(header)
//                            .font(Font.font16Light)
//                            .foregroundColor(Color.font)
//                    }
//                }
//
//                Spacer()
//                    .frame(height: 10)
//
//                Text(title)
//                    .font(Font.font16)
//                    .foregroundColor(.gray)
//
//                Text(description)
//                    .font(Font.font16)
//                    .lineLimit(3) // or 2
//                    .foregroundColor(Color.font)
//
//                if let tag = tag {
//                    Text(tag)
//                        .font(Font.font16Light)
//                        .foregroundColor(Color.font)
//                }
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(12)
//            .shadow(radius: 4)
//            .frame(height: 180)
//
//        }
//    }
// }

// COMPLETE
struct CardComponent: View {
    let icon: String
    let header: String?
    let title: String
    let description: String
    let tag: String?

    init(title: String, description: String, icon: String, header: String? = nil, tag: String? = nil) {
        self.title = title
        self.description = description
        self.icon = icon
        self.header = header
        self.tag = tag
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.black)

                if let header = header {
                    Text(header)
                        .font(Font.font16Light)
                        .foregroundColor(Color.font)
                }
            }
            .padding(.bottom, 8.0)

            Text(title)
                .font(Font.font16)
                .foregroundColor(.gray)

            Text(description)
                .font(Font.font16)
                .foregroundColor(Color.font)
                .padding(.bottom, 8.0)

            if let tag = tag {
                Text(tag)
                    .font(Font.font16Light)
                    .foregroundColor(Color.font)
            }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .frame(height: 175)

    }
}

#Preview {
    CardComponent(
        title: "REPORT AND SCORE",
        description: "Sarah’s Credit Card Balance Transfer Misstep",
        icon: "creditcard",
        header: "User Scenario",
        tag: "What went wrong?"
    )
    HStack {
        CardComponent(
            title: "CREDIT CARDS",
            description: "Test your knowledge",
            icon: "creditcard",
            header: "QUIZ"
        )
        CardComponent(
            title: "Credit Cards",
            description: "What is a Credit Card?",
            icon: "creditcard"
        )

    }
    CardComponent(
        title: "CREDIT CARDS",
        description: "Test your knowledge",
        icon: "creditcard",
        header: "QUIZ"
    )

    CardComponent(
        title: "Credit Cards",
        description: "What is a Credit Card?",
        icon: "creditcard"
    )
}
