//
//  TorchError.swift
//  Kuleta
//
//  Created by Jeton Kukalaj on 19.4.23.
//

import Foundation

enum TorchError: Error {
    case torchUnavailable
    case torchCannotBeUsed
}

extension TorchError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .torchUnavailable:
            return "Torch is not available"
        case .torchCannotBeUsed:
            return "Torch could not be used"
        }
    }
}
