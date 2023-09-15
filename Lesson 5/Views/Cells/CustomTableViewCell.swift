//  CustomCell.swift
//  Lesson 5
//
//  Created by Павел Громов on 15.08.2023.
import UIKit
import SnapKit

final class CustomTableViewCell: UITableViewCell {
    static let idCustomCell = "idCustomCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue", size: 19)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue", size: 19)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let avatarLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstrants()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarLabel.layer.cornerRadius = avatarLabel.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(avatarLabel)
    }
}

extension CustomTableViewCell {
    private func setupConstrants() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(-40)
            make.left.equalTo(80)
            make.right.equalTo(0)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.bottom.equalTo(0)
            make.left.equalTo(80)
            make.right.equalTo(0)
        }
        avatarLabel.snp.makeConstraints { make in
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.left.equalTo(4)
            make.right.equalTo(-314)
        }
    }
}
