//
//  DetailVC.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var detailItem: SongsDB?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(data: (detailItem?.imageData!)!)
        songTitle.text = detailItem?.songTitle
        albumTitle.text = detailItem?.albumTitle
        genre.text = detailItem?.genre
        
    }
}
