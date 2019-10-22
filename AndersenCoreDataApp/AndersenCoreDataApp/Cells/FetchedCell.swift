//
//  FetchedCell.swift
//  AndersenCoreDataApp
//
//  Created by admin on 21.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class FetchedCell: UITableViewCell {

    @IBOutlet weak var fetchImageView: UIImageView!
    @IBOutlet weak var fetchLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(channel: Channel) {
      //  fetchImageView.image = UIImage(data: channel.logoChannel ?? Data())
        fetchLabel.text = channel.nameChannel ?? ""
    }
}
