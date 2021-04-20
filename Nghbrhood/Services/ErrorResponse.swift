//
//  ErrorResponse.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 17.04.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import Foundation
struct ErrorResponse: Decodable, LocalizedError {
    let reason: String
    
    var errorDescription: String? { return reason }
}
