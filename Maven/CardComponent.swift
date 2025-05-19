//
//  CardComponents.swift
//  Maven
//
//  Created by Isabella Sulisufi on 13/05/2025.
//

import SwiftUI

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
//        .frame(height: 160)

    }
}

struct LongCardComponent: View {
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
        HStack {
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

                    Spacer() // pushes header to the left
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
            .frame(maxWidth: .infinity, minHeight: 160)
            .padding(.bottom, 0)
        }
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

    LongCardComponent(
        title: "REPORT AND SCORE",
        description: "ACLONG CARD Transfer Misstep",
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
