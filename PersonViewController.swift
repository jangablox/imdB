//
//  PersinViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/22/24.
//

import UIKit

class PersonViewController: UIViewController, UIScrollViewDelegate {
    
    public var media: [Cast] = [Cast]()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        return scroll
    }()
    
    lazy var cView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
      
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        label.textAlignment = .center
        return label
    }()
    
    private let titlePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    
    private let elaRating: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .yellow
        return button
    }()
    
    private let elaStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .yellow
        return imageView
    }()
    
    private let elaNotes: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "note.text")
        imageView.tintColor = .yellow
        return imageView
    }()
    
    private let elaStarVal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "x/10"
        label.textAlignment = .center
        label.textColor = .yellow
        return label
    }()
    
    private let elaNotesVal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "User Notes"
        label.textAlignment = .center
        label.textColor = .yellow
        return label
    }()
    
    private let addToFolder: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        button.setTitle("Add to Folder", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let overviewBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        return imageView
        
    }()
    
    private let overviewLabel: UILabel = {
      
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        label.textAlignment = .center
        return label
    }()
    
    
    private let ratingBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        return imageView
        
    }()
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies/TV Shows"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 71, height: 170)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 523, width: UIScreen.main.bounds.width - 20, height: 160), collectionViewLayout: layout)
        collectionView.backgroundColor = .red
//        let collectionView = UICollectionView(frame: auto,collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ExtraInfoViewCell.self, forCellWithReuseIdentifier: ExtraInfoViewCell.identifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(cView)
        
        cView.addSubview(addToFolder)
        cView.addSubview(elaRating)
        
        cView.addSubview(titlePoster)
        cView.addSubview(titleLabel)
        cView.addSubview(movieLabel)
        cView.addSubview(movieCollectionView)
        cView.addSubview(ratingBackground)
        cView.addSubview(elaNotes)
        cView.addSubview(elaStar)
        cView.addSubview(elaStarVal)
        cView.addSubview(elaNotesVal)
//        cView.addSubview(overviewBackground)
//        cView.addSubview(overviewLabel)
        
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
//        elaRating.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        addToFolder.addTarget(self, action: #selector(didTapButtons), for: .touchUpInside)
        
        
        configureConstraints()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
//        scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
//
//    }
//
//    @objc func didTapButton() {
//        print("hi")
//    }
//
//    @objc func didTapButtons() {
//        print("bye")
//    }

    func configureConstraints() {
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 800)
        ]
        
        let cViewConstraints = [
            cView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            cView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            cView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]
        
        let titlePosterConstraints = [
            titlePoster.topAnchor.constraint(equalTo: cView.topAnchor, constant: 10),
            titlePoster.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 100),
            titlePoster.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -100),
            titlePoster.heightAnchor.constraint(equalToConstant: 270)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20)
        ]
        
//        let overviewBackgroundConstraints = [
//            overviewBackground.topAnchor.constraint(equalTo: titlePoster.bottomAnchor, constant: 20),
//            overviewBackground.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
//            overviewBackground.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
//            overviewBackground.heightAnchor.constraint(equalToConstant: 100)
//        ]
//        
//        let overviewLabelConstraints = [
//            overviewLabel.topAnchor.constraint(equalTo: overviewBackground.topAnchor, constant: 3),
//            overviewLabel.bottomAnchor.constraint(equalTo: overviewBackground.bottomAnchor, constant: -3),
//            overviewLabel.leadingAnchor.constraint(equalTo: overviewBackground.leadingAnchor, constant: 3),
//            overviewLabel.trailingAnchor.constraint(equalTo: overviewBackground.trailingAnchor, constant: -3)
//            
//        ]
        
        
        let ratingBackgroundConstraints = [
            ratingBackground.topAnchor.constraint(equalTo: titlePoster.bottomAnchor, constant: 20),
            ratingBackground.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            ratingBackground.heightAnchor.constraint(equalToConstant: 100),
            ratingBackground.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20)
        ]
        
        let elaStarConstraints = [
            elaStar.topAnchor.constraint(equalTo: ratingBackground.topAnchor, constant: 10),
            elaStar.leadingAnchor.constraint(equalTo: ratingBackground.leadingAnchor, constant: 60),
            elaStar.heightAnchor.constraint(equalToConstant: 60),
            elaStar.widthAnchor.constraint(equalToConstant: 60),
        ]
        
        let elaStarValConstraints = [
            elaStarVal.topAnchor.constraint(equalTo: elaStar.bottomAnchor, constant: 3),
            elaStarVal.leadingAnchor.constraint(equalTo: elaStar.leadingAnchor, constant: 13.5),
//            elaStarVal.widthAnchor.constraint(equalToConstant: 60),
        ]
        
//        let elaRatingConstraints = [
//            elaRating.topAnchor.constraint(equalTo: ratingBackground.topAnchor),
//            elaRating.trailingAnchor.constraint(equalTo: ratingBackground.trailingAnchor, constant: -40),
//            elaRating.heightAnchor.constraint(equalToConstant: 120),
//            elaRating.widthAnchor.constraint(equalToConstant: 97),
//        ]
        
        let elaNotesConstraints = [
            elaNotes.topAnchor.constraint(equalTo: ratingBackground.topAnchor, constant: 10),
            elaNotes.trailingAnchor.constraint(equalTo: ratingBackground.trailingAnchor, constant: -60),
            elaNotes.heightAnchor.constraint(equalToConstant: 60),
            elaNotes.widthAnchor.constraint(equalToConstant: 60),
        ]
        
        let elaNotesValConstraints = [
            elaNotesVal.topAnchor.constraint(equalTo: elaNotes.bottomAnchor, constant: -3),
            elaNotesVal.leadingAnchor.constraint(equalTo: elaNotes.leadingAnchor, constant: -10)
            /*elaNotesVal.trailingAnchor.constraint(equalTo: elaNotes.trailingAnchor)*/
        ]
        
        let addToFolderConstraints = [
            addToFolder.topAnchor.constraint(equalTo: ratingBackground.bottomAnchor, constant: 20),
            addToFolder.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            addToFolder.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            addToFolder.heightAnchor.constraint(equalToConstant: 60),
        ]
        
        let movieLabelConstraints = [
            movieLabel.topAnchor.constraint(equalTo: addToFolder.bottomAnchor, constant: 20),
            movieLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            movieLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
        ]
        
//        let elaValConstraints = [
//            elaVal.topAnchor.constraint(equalTo: elaStar.bottomAnchor, constant: -3),
//            elaVal.leadingAnchor.constraint(equalTo: elaStar.leadingAnchor),
//            elaVal.trailingAnchor.constraint(equalTo: elaStar.trailingAnchor),
//        ]
        
        
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(cViewConstraints)
        NSLayoutConstraint.activate(titlePosterConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(overviewBackgroundConstraints)
//        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(ratingBackgroundConstraints)
        NSLayoutConstraint.activate(elaStarConstraints)
        NSLayoutConstraint.activate(elaStarValConstraints)
        NSLayoutConstraint.activate(elaNotesConstraints)
        NSLayoutConstraint.activate(elaNotesValConstraints)

        NSLayoutConstraint.activate(addToFolderConstraints)
        NSLayoutConstraint.activate(movieLabelConstraints)
        
        
        

        
    }
    
    public func configure(with model: GenViewModel) {
        titleLabel.text = model.genName
        //print(model)
        //overviewLabel.text = model.overview
        //let va = String(format: "%.1f", model.vote_average)
        guard var url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        if model.posterURL == "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg" {
            url = URL(string: "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg")!
        }
        
        titlePoster.sd_setImage(with: url, completed: nil)
        
        
        
       
        MediaAPI.shared.findMediaCast(with: model.id) {results in
            DispatchQueue.main.async {
                switch results {
                case .success(let cast):
                    self.media = cast
                    self.movieCollectionView.reloadData()
                case .failure(let error):
                    
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
}


extension PersonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return media.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtraInfoViewCell.identifier, for: indexPath) as? ExtraInfoViewCell else {
                    return UICollectionViewCell()
                }
        
        let cast_mem = media[indexPath.row]
        var name: String = "Unknown Name"
        var profile_path: String = "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg"
        var character: String = ""
        
        if cast_mem.name != nil {
            name = cast_mem.name!
        } else if cast_mem.original_title != nil {
            name = cast_mem.original_title!
        }
        
        if cast_mem.poster_path != nil {
            profile_path = cast_mem.poster_path!
        }
        
        if cast_mem.character != nil {
            character = cast_mem.character!
        }
        cell.configure(with: CastViewModel(name: (name), profile_path: profile_path, character: character, id: cast_mem.id, media_type: cast_mem.media_type))
//
        return cell
    }
    
    
    
}

extension PersonViewController: TitleViewControllerDelegate {
    func titleViewControllerDidTapItem(_ viewModel: CastViewModel) {
        var vm = GenViewModel(genName: String = viewModel.name, posterURL: String = viewModel.profile_path, media_type:  = "Movie", overview: <#T##String#> = "", vote_average: <#T##Float#> = 0.28, id: <#T##Int#> = viewModel.id, release_date: <#T##String#> = "")
        DispatchQueue.main.async { [weak self] in
            let vc = TitleViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
