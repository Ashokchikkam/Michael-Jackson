//
//  Song.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import Foundation
import UIKit

class Song{
    var trackId: String
    var image: UIImage?
    var songTitle: String
    var albumTitle: String
    var imageLoaded: Bool
    
    init(trackId: String, songTitle: String, albumTitle: String, imageLoaded: Bool) {
        self.trackId = trackId
        self.songTitle = songTitle
        self.albumTitle = albumTitle
        self.imageLoaded = imageLoaded
    }
    
}


