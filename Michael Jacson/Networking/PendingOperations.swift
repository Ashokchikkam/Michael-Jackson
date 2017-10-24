//
//  PendingOperations.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import Foundation


class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}

