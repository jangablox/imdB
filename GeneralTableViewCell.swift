//
//  GeneralTableViewCell.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/4/24.
//

import UIKit
import SDWebImage


class GeneralTableViewCell: UITableViewCell {

    static let identifier = "GeneralTableViewCell"
    
    
    private let genLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName,size:18)
        return label
    }()
    
    private let genSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName,size:15)
        label.textColor = UIColor(hue: 0.0583, saturation: 0.5, brightness: 0.08, alpha: 1.0)
        return label
    }()
    
    private let genPoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemCyan
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        contentView.addSubview(genPoster)
        contentView.addSubview(genLabel)
        contentView.addSubview(genSubLabel)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let genPosterConstraints = [
            genPoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genPoster.topAnchor.constraint(equalTo: contentView.topAnchor),
            genPoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            genPoster.widthAnchor.constraint(equalToConstant: 61)
        ]
        
        
        let genLabelConstraints = [
            genLabel.leadingAnchor.constraint(equalTo: genPoster.trailingAnchor, constant: 20),
            genLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)
        ]
        
        let genSubLabelConstaints = [
            genSubLabel.leadingAnchor.constraint(equalTo: genPoster.trailingAnchor, constant: 20),
            genSubLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43)
        ]
        
        NSLayoutConstraint.activate(genPosterConstraints)
        NSLayoutConstraint.activate(genLabelConstraints)
        NSLayoutConstraint.activate(genSubLabelConstaints)
    }
    
    public func configure(with model: GenViewModel) {
        guard var url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        if model.posterURL == "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg" {
            url = URL(string: "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg")!
        }
        
        genPoster.sd_setImage(with: url, completed: nil)
        genLabel.text = model.genName
        genSubLabel.text = "\(model.media_type)"
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
