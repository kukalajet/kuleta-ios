//
//  ContentViewModels.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import AVFoundation
import CoreImage

class ContentViewModel: ObservableObject {
    private let frameManager = FrameManager.shared
    private let cameraManager = CameraManager.shared

    @Published var frame: CGImage?
    @Published var urlDetectedInImage: URL?
    @Published var error: Error?

    init() {
        setupSubscriptions()
    }

    func setupSubscriptions() {
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { buffer in
                CGImage.create(from: buffer)
            }
            .assign(to: &$frame)

        frameManager.$qrCodeDetected
            .receive(on: RunLoop.main)
            .compactMap { string in
                guard let urlString = string else { return nil }
                return URL(string: urlString)
            }
            .assign(to: &$urlDetectedInImage)

        cameraManager.$error
            .receive(on: RunLoop.main)
            .map { $0 }
            .assign(to: &$error)
    }
}
