//
//  CGImageExtension.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import CoreGraphics
import VideoToolbox

extension CGImage {
    static func create(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
        guard let pixelBuffer = cvPixelBuffer else { return nil }

        var image: CGImage?
        VTCreateCGImageFromCVPixelBuffer(
            pixelBuffer,
            options: nil,
            imageOut: &image
        )

        return image
    }
}
