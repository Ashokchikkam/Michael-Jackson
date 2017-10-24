//
//  imageDownloader.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    let obj: SongsDB
    
    init(obj: SongsDB) {
        self.obj = obj
        super.init()
    }
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: obj.imageUrl!) else {
            return
        }
        
        let imageData = try! Data(contentsOf: url)
        
        if self.isCancelled {
            return
        }
        
        if imageData.count > 0 {
            obj.imageData = imageData
            obj.imageLoaded = true
            
        } else {
            obj.imageLoaded = false
            
        }
    }
}
