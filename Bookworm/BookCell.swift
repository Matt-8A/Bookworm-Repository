//
//  BookCell.swift
//  Bookworm
//
//  Created by Matthew Ochoa on 4/21/22.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookDescription: UILabel!
    
    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var bookPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
