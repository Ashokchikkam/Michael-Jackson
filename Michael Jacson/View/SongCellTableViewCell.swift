//
//  SongCellTableViewCell.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class SongCellTableViewCell: UITableViewCell {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    
    func configureCell(song: Song) {
        songImage.image = song.imageLoaded ? song.image! : #imageLiteral(resourceName: "PlaceHolderImage")
        songTitle.text = song.songTitle
        albumTitle.text = song.albumTitle
    }

}
