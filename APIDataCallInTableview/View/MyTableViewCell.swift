//
//  MyTableViewCell.swift
//  APIDataCallInTableview
//
//  Created by mayank ranka on 29/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
