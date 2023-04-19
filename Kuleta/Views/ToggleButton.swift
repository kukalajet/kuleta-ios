//
//  ToggleButton.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import SwiftUI

struct ToggleButton: View {
    var label: String
    @Binding var selected: Bool

    var body: some View {
        Button(
            action: {
                selected.toggle()
            },
            label: {
                Text(label)
            }
        )
        .padding(.vertical, 10)
        .padding(.horizontal)
        .foregroundColor(selected ? .white : .black)
        .background(selected ? Color.blue : .white)
        .animation(.easeInOut, value: 0.25)
        .cornerRadius(10)
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ToggleButton(label: "Toggle", selected: .constant(false))
        }
    }
}
