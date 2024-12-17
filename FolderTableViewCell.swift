//
//  FolderTableViewCell.swift
//  Ela's App
//
//  Created by Kaushal Janga on 6/29/24.
//

import UIKit

class FolderTableViewCell: UITableViewCell {
    
    static let identifier = "FolderTableViewCell"
    
    private let folderPoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "folder.fill")
        return imageView
    }()
    
    private let folderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName,size:30)
        label.text = "Hello World"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        contentView.addSubview(folderPoster)
        contentView.addSubview(folderLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let folderPosterViewConstraints = [
            folderPoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            folderPoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            folderPoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            folderPoster.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        
        let folderLabelConstraints = [
            folderLabel.leadingAnchor.constraint(equalTo: folderPoster.trailingAnchor, constant: 35),
            folderLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
    
        
        NSLayoutConstraint.activate(folderPosterViewConstraints)
        NSLayoutConstraint.activate(folderLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
