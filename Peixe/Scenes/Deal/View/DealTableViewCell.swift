//
//  DealTableViewCell.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit
import SDWebImage

class DealTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "DealTableViewCell"
    static let nibName: String = "DealTableViewCell"
    
    @IBOutlet weak var dealImageView: UIImageView!
    @IBOutlet weak var partnerlabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceDescLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func awakeFromNib() {
        self.configUI()
    }
    
    func configUI() {

        self.partnerlabel.textColor = ColorConstants.white
        self.partnerlabel.font = Font.defaultFont(size: 16)

        self.titleLabel.textColor = ColorConstants.black
        self.titleLabel.font = Font.defaultFont(size: 16)

        self.priceDescLabel.text = NSLocalizedString("price_from", tableName: nil, bundle: Bundle.main, value: "", comment: "")
        self.priceDescLabel.textColor = ColorConstants.gray
        self.priceDescLabel.font = Font.defaultFont(size: 13)

        self.priceLabel.textColor = ColorConstants.orange
        self.priceLabel.font = Font.defaultFont(size: 14)

        self.dealImageView.contentMode = .scaleAspectFill
        self.dealImageView.clipsToBounds = true
        
        self.divView.backgroundColor = ColorConstants.lightGray
        
        self.createGradientLayer()
    }
    
    func setup(_ viewModel: DealItemViewModel) {
        
        self.partnerlabel.text = viewModel.partnerName
        self.titleLabel.text = viewModel.dealName
        self.priceLabel.text = viewModel.fullPrice
        self.dealImageView.sd_setImage(with: viewModel.imageUrl, completed: nil)
    }

    private func createGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        self.gradientView.alpha = 0.3
        gradientLayer.frame.size =
            self.gradientView.frame.size
        gradientLayer.colors = [UIColor.clear.cgColor , ColorConstants.gray, UIColor.black.cgColor]
        self.gradientView.layer.addSublayer(gradientLayer)
    }
}
