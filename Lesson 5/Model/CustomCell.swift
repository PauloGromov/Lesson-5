//  CustomCell.swift
//  Lesson 5
//
//  Created by Павел Громов on 15.08.2023.
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    static var idCustomCell = "idCustomCell"
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.backgroundColor = .red
        nameLabel.text = ""
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(-40)
            make.left.equalTo(90)
            make.right.equalTo(-100)
        }
        dateLabel.backgroundColor = .green
        dateLabel.text = ""
        dateLabel.numberOfLines = 0
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.bottom.equalTo(0)
            make.left.equalTo(90)
            make.right.equalTo(0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
