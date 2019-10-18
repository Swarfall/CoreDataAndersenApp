//
//  ChannelCell.swift
//  AndersenCoreDataApp
//
//  Created by admin on 15.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

protocol ChannelCellDelegate {
    func deleteChannel(index: Int)
}

class ChannelCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameChannelLabel: UILabel!
    
    var delegate: ChannelCellDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(channel: Channel) {
        logoImageView.image = UIImage(data: channel.logoChannel ?? Data())
        nameChannelLabel.text = channel.nameChannel
    }
    
    @IBAction func didTapDeleteChannelButton(_ sender: Any) {
        delegate?.deleteChannel(index: index!)
    }
    
    
}
