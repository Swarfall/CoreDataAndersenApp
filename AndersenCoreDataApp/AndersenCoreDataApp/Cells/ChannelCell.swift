//
//  ChannelCell.swift
//  AndersenCoreDataApp
//
//  Created by admin on 15.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameChannelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(channel: ChannalModel) {
        logoImageView.image = channel.logoImage
        nameChannelLabel.text = channel.nameChannel
    }
}
