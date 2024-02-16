//
//  ImageCache.swift
//  AppolyTechnicalChallenge
//
//  Created by Sandhya on 24/12/2023.
//

import Foundation
import SwiftUI

class ImageCache{
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image?{
        get{
            ImageCache.cache[url]
        }
        set{
            ImageCache.cache[url] = newValue
        }
    }
}
