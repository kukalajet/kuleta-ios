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
    private let cameraManager = ScanManager.shared
    private let invoiceCheckRepository = InvoiceCheckRepository.shared

    @Published var frame: CGImage?
    @Published var urlDetectedInImage: URL?
    @Published var error: Error?

    init() {
        setupSubscriptions()
    }

    func toggleTorch(on: Bool) {
        frameManager.toggleTorch(on: on)
    }

    func startAgain() {
        Task(priority: .background) {
            let result = await invoiceCheckRepository.verifyInvoice(
                iic: "BF69F1000A416D4FC4668367DA997DAD",
                dateTimeCreated: "2023-04-19T18:38:41 02:00",
                tin: "K21605003M"
            )

            switch result {
            case let .success(response):
                print(response)
            case let .failure(error):
                print(error)
            }
        }
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

        // wip
        startAgain()
    }
}
