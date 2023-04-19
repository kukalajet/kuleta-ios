//
//  FrameManager.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import AVFoundation
import Foundation
import UIKit

class FrameManager: NSObject, ObservableObject {
    static let shared = FrameManager()

    @Published var current: CVPixelBuffer?
    @Published var qrCodeDetected: String?

    let videoOutputQueue = DispatchQueue(
        label: "com.pickle.VideoOutputQ",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem
    )

    let qrCodeOutputQueue = DispatchQueue(
        label: "com.pickle.QrOutputQ",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem
    )

    override private init() {
        super.init()
        ScanManager.shared.set(self, queue: videoOutputQueue)
        ScanManager.shared.setMetaDataOutputDelegate(self, queue: qrCodeOutputQueue)
    }
}

extension FrameManager: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from _: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }

            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            qrCodeDetected = stringValue
        }
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from _: AVCaptureConnection) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.current = buffer
            }
        }
    }
}
