//
//  Font.swift
//  Maven
//
//  Created by Isabella Sulisufi on 09/05/2025.
//

import SwiftUI

extension Font {
    static var inter16: Font {
        Font.custom("Inter", size: 16).weight(.medium)
    }

    static var interLight16: Font {
        Font.custom("Inter", size: 16).weight(.light)
    }

    static var interTitle: Font {
        Font.custom("Inter", size: 45).weight(.heavy)
    }

    static var interSubtitle: Font {
        Font.custom("Inter", size: 18).weight(.bold)
    }

}
