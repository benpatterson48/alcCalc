//
//  LinksCell.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/26/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class LinksCell: UITableViewCell {
    
    var links: Links? {
        didSet {
            guard let image = links?.icon else { return }
            icon.image = UIImage(named: image)
            title.text = links?.title
            subTitle.text = links?.subTitle
        }
    }
    
    let icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "info-icon")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.font = UIFont.mainSemiBoldFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitle: UILabel = {
        let sub = UILabel()
        sub.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        sub.textAlignment = .left
        sub.numberOfLines = 0 
        sub.font = UIFont.mainItalicFont(ofSize: 14)
        sub.translatesAutoresizingMaskIntoConstraints = false
        return sub
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        setupCellConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellConstraints() {
        addSubview(icon)
        addSubview(title)
        addSubview(subTitle)
        
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        
        title.topAnchor.constraint(equalTo: icon.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16).isActive = true
        title.bottomAnchor.constraint(lessThanOrEqualTo: subTitle.topAnchor, constant: -4)
        
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true 
        subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
    }    
}
