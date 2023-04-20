//
//  ContentView.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    @State private var isTorchActive: Bool = false

    var body: some View {
        VStack {
            ZStack {
                FrameView(image: model.frame)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text(model.urlDetectedInImage?.absoluteString ?? "Nope")

                    Button(
                        action: {
                            isTorchActive.toggle()
                            model.toggleTorch(on: isTorchActive)
                        },
                        label: { Text("toggle torch, status: \(isTorchActive ? "active" : "not active")") }
                    )
                }

                ErrorView(error: model.error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
