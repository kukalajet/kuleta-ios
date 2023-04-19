//
//  FrameView.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import SwiftUI

struct FrameView: View {
    var image: CGImage?

    var body: some View {
        if let image = image {
            GeometryReader { geometry in
                Image(
                    image,
                    scale: 1.0,
                    orientation: .up,
                    label: Text("Camera Feed")
                )
                .resizable()
                .scaledToFill()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height,
                    alignment: .center
                )
                .clipped()
            }
        } else {
            EmptyView()
        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
