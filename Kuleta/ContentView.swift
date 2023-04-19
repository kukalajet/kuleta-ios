//
//  ContentView.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import AVFoundation
import SwiftUI

extension AVCaptureDevice.FlashMode {
    func toString() -> String {
        switch self {
        case .auto:
            return "Auto"
        case .on:
            return "On"
        case .off:
            return "Off"
        default:
            return "Auto"
        }
    }
}

struct ContentView: View {
    @StateObject private var model = ContentViewModel()

    @State private var showPicture = false

    @State private var flashMode: AVCaptureDevice.FlashMode = .auto

    var body: some View {
        VStack {
            ZStack {
                FrameView(image: model.frame)
                    .edgesIgnoringSafeArea(.all)
                Text("QRCode ? \(model.urlDetectedInImage?.absoluteString ?? "Nope")")
                ErrorView(error: model.error)
            }
            HStack {
                // Flash
                Button("Flash Mode \(flashMode.toString())") {
                    switch flashMode {
                    case .auto:
                        flashMode = .on
                    case .on:
                        flashMode = .off
                    case .off:
                        flashMode = .auto
                    @unknown default:
                        flashMode = .auto
                    }
                }
                Button("Switch Camera") {
                    // model.switchCamera
                }
                // Change Camera
                Button("Take picture") {
                    model.takePicture(flashMode: flashMode)
                }
            }
        }
        .sheet(isPresented: $showPicture, content: {
            if let cgImage = model.capturedPhoto {
                Image(cgImage, scale: 1.0, orientation: .right, label: Text("Hello world"))
                    .resizable()
            }
        })
        .onReceive(model.$capturedPhoto) { image in
            if image != nil {
                showPicture.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
