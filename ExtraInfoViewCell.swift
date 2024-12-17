//
//  ExtraInfoViewCell.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/14/24.
//

import UIKit
import SDWebImage

class ExtraInfoViewCell: UICollectionViewCell {
    static let identifier = "ExtraInfoViewCell"
    
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text =  "char"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let charInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text =  "info"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(poster)
        contentView.addSubview(labelInfo)
        contentView.addSubview(charInfo)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let posterConstraints = [
            poster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            poster.topAnchor.constraint(equalTo: contentView.topAnchor),
            poster.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let labelInfoConstraints = [
            labelInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelInfo.topAnchor.constraint(equalTo: poster.bottomAnchor)
        ]
        
        let charInfoConstraints = [
            charInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            charInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            charInfo.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: -1)
        ]
        
        NSLayoutConstraint.activate(posterConstraints)
        NSLayoutConstraint.activate(labelInfoConstraints)
        NSLayoutConstraint.activate(charInfoConstraints)
    }
    
    public func configure(with model: CastViewModel) {
        guard var url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.profile_path)") else {
            return
        }
        if model.profile_path == "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg" {
            url = URL(string: "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg")!
        }
        
        poster.sd_setImage(with: url, completed: nil)
        labelInfo.text = model.name
        charInfo.text = model.character
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
