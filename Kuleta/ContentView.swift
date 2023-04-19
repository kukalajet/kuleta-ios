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

    var body: some View {
        VStack {
            ZStack {
                FrameView(image: model.frame)
                    .edgesIgnoringSafeArea(.all)
                Text(model.urlDetectedInImage?.absoluteString ?? "Nope")
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
