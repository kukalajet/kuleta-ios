//
//  ControlView.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import SwiftUI

struct ControlView: View {
    @Binding var comicSelected: Bool
    @Binding var monoSelected: Bool
    @Binding var crystalSelected: Bool

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 12) {
                ToggleButton(label: "Comic", selected: $comicSelected)
                ToggleButton(label: "Mono", selected: $monoSelected)
                ToggleButton(label: "Crystal", selected: $crystalSelected)
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ControlView(
                comicSelected: .constant(false),
                monoSelected: .constant(true),
                crystalSelected: .constant(true)
            )
        }
    }
}
