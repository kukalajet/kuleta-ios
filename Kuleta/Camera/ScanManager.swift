//
//  ScanManager.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import AVFoundation
import Foundation

private enum ScanManagerStatus {
    case unconfigured, configured, unauthorized, failed
}

class ScanManager: ObservableObject {
    static let shared = ScanManager()

    @Published var error: CameraError?

    let session = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "com.pickle.SessionQ")

    private let videoOutput = AVCaptureVideoDataOutput()
    private var metaDataOutput = AVCaptureMetadataOutput()

    private var status = ScanManagerStatus.unconfigured

    private init() {
        configure()
    }

    private func set(error: CameraError?) {
        DispatchQueue.main.async {
            self.error = error
        }
    }

    private func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video) { authorized in
                if !authorized {
                    self.status = .unauthorized
                    self.set(error: .deniedAuthorization)
                }
                self.sessionQueue.resume()
            }
        case .restricted:
            status = .unauthorized
            set(error: .restrictedAuthorization)
        case .denied:
            status = .unauthorized
            set(error: .deniedAuthorization)
        case .authorized:
            break
        @unknown default:
            status = .unauthorized
            set(error: .unknownAuthorization)
        }
    }

    // https://developer.apple.com/documentation/avfoundation/capture_setup
    private func configureCaptureSession() {
        defer {
            session.commitConfiguration()
        }

        guard status == .unconfigured else { return }

        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo

        // Getting the raw - Low level camera input
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        guard let camera = device else {
            set(error: .cameraUnavailable)
            status = .failed
            return
        }

        do {
            // Creating the CaptureDeviceInput to connect to CaptureSession
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            } else {
                set(error: .cannotAddInput)
                status = .failed
                return
            }
        } catch {
            set(error: .createCaptureInput(error))
            status = .failed
            return
        }

        // Output for Meta Data like QRCode
        if session.canAddOutput(metaDataOutput) {
            session.addOutput(metaDataOutput)
            metaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        } else {
            set(error: .cannotAddOutput)
            status = .failed
        }

        // Output for video preview
        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
            videoOutput.videoSettings =
                [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
            let videoConnection = videoOutput.connection(with: .video)
            videoConnection?.videoOrientation = .portrait
        } else {
            set(error: .cannotAddOutput)
            status = .failed
            return
        }

        status = .configured
    }

    func setMetaDataOutputDelegate(_ delegate: AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue) {
        sessionQueue.async {
            self.metaDataOutput.setMetadataObjectsDelegate(delegate, queue: queue)
        }
    }

    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
        } catch {
            return
        }
    }

    // Passing video data to an Output set by a delegate
    func set(
        _ delegate: AVCaptureVideoDataOutputSampleBufferDelegate,
        queue: DispatchQueue
    ) {
        sessionQueue.async {
            self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
        }
    }

    public func configure() {
        checkPermissions()
        sessionQueue.async {
            self.configureCaptureSession()
            self.session.startRunning()
        }
    }
}
