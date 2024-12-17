
import UIKit
import WebKit
import SDWebImage


protocol TitleViewControllerDelegate: AnyObject {
    func titleViewControllerDidTapItem(_ viewModel: CastViewModel)
}

class TitleViewController: UIViewController, UIScrollViewDelegate {
    
    public var cast: [Cast] = [Cast]()
    
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
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let ratingStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .yellow
        return imageView
    }()
    
    private let ratingVal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7/10"
        label.textAlignment = .center
        label.textColor = .yellow
        return label
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
    
    private let elaVal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "User Rating"
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
    
    private let ratingBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        return imageView
        
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cast"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 71, height: 160)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 630, width: UIScreen.main.bounds.width - 20, height: 160), collectionViewLayout: layout)
//        let collectionView = UICollectionView(frame: auto,collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ExtraInfoViewCell.self, forCellWithReuseIdentifier: ExtraInfoViewCell.identifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        return collectionView
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
   
    
       
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(cView)
        cView.addSubview(webView)
        cView.addSubview(ratingBackground)
        cView.addSubview(addToFolder)
        cView.addSubview(elaRating)
        cView.addSubview(elaStar)
        cView.addSubview(elaVal)
        cView.addSubview(ratingVal)
        cView.addSubview(ratingStar)
        cView.addSubview(titlePoster)
        cView.addSubview(titleLabel)
        cView.addSubview(overviewBackground)
        cView.addSubview(overviewLabel)
        cView.addSubview(castLabel)
        cView.addSubview(castCollectionView)
        
        elaRating.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        
//        elaRating.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        addToFolder.addTarget(self, action: #selector(didTapButtons), for: .touchUpInside)
        
        
        configureConstraints()
    }
    
    @objc private func didTapButton() {
        navigationController?.pushViewController(PersonViewController(), animated: true)
        //change this to a view controler that has stars and user input
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
        
        
        
        
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: cView.topAnchor),
            webView.leadingAnchor.constraint(equalTo: cView.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20)
        ]
        
        let titlePosterConstraints = [
            titlePoster.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titlePoster.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            titlePoster.heightAnchor.constraint(equalToConstant: 100),
            titlePoster.widthAnchor.constraint(equalToConstant: 71)
        ]
        
        let overviewBackgroundConstraints = [
            overviewBackground.topAnchor.constraint(equalTo: titlePoster.topAnchor),
            overviewBackground.leadingAnchor.constraint(equalTo: titlePoster.trailingAnchor, constant: 20),
            overviewBackground.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            overviewBackground.bottomAnchor.constraint(equalTo: titlePoster.bottomAnchor)
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: overviewBackground.topAnchor, constant: 3),
            overviewLabel.bottomAnchor.constraint(equalTo: overviewBackground.bottomAnchor, constant: -3),
            overviewLabel.leadingAnchor.constraint(equalTo: overviewBackground.leadingAnchor, constant: 3),
            overviewLabel.trailingAnchor.constraint(equalTo: overviewBackground.trailingAnchor, constant: -3)
            
        ]
        
        let ratingBackgroundConstraints = [
            ratingBackground.topAnchor.constraint(equalTo: overviewBackground.bottomAnchor, constant: 20),
            ratingBackground.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            ratingBackground.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            ratingBackground.heightAnchor.constraint(equalToConstant: 120),
        ]
        
        let ratingStarConstraints = [
            ratingStar.topAnchor.constraint(equalTo: ratingBackground.topAnchor, constant: 10),
            ratingStar.leadingAnchor.constraint(equalTo: ratingBackground.leadingAnchor, constant: 60),
            ratingStar.heightAnchor.constraint(equalToConstant: 60),
            ratingStar.widthAnchor.constraint(equalToConstant: 60),
        ]
        
        let ratingValConstraints = [
            ratingVal.topAnchor.constraint(equalTo: ratingStar.bottomAnchor, constant: 3),
            ratingVal.leadingAnchor.constraint(equalTo: ratingStar.leadingAnchor, constant: 9.5),
            ratingStar.widthAnchor.constraint(equalToConstant: 60),
        ]
        
        let elaRatingConstraints = [
            elaRating.topAnchor.constraint(equalTo: ratingBackground.topAnchor),
            elaRating.trailingAnchor.constraint(equalTo: ratingBackground.trailingAnchor, constant: -40),
            elaRating.heightAnchor.constraint(equalToConstant: 120),
            elaRating.widthAnchor.constraint(equalToConstant: 97),
        ]
        
        let elaStarConstraints = [
            elaStar.topAnchor.constraint(equalTo: ratingBackground.topAnchor, constant: 10),
            elaStar.trailingAnchor.constraint(equalTo: ratingBackground.trailingAnchor, constant: -60),
            elaStar.heightAnchor.constraint(equalToConstant: 60),
            elaStar.widthAnchor.constraint(equalToConstant: 60),
        ]
        
        let elaValConstraints = [
            elaVal.topAnchor.constraint(equalTo: elaStar.bottomAnchor, constant: -3),
            elaVal.leadingAnchor.constraint(equalTo: elaStar.leadingAnchor),
            elaVal.trailingAnchor.constraint(equalTo: elaStar.trailingAnchor),
        ]
        
        let addToFolderConstraints = [
            addToFolder.topAnchor.constraint(equalTo: ratingBackground.bottomAnchor, constant: 20),
            addToFolder.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            addToFolder.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            addToFolder.heightAnchor.constraint(equalToConstant: 60),
        ]
        
//        let castCollectionViewConstraints = [
//            //castCollectionView.topAnchor.constraint(equalTo: addToFolder.bottomAnchor, constant: 20),
//            castCollectionView.topAnchor.constraint(equalTo: addToFolder.bottomAnchor, constant: 45),
//            castCollectionView.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
//            castCollectionView.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
//        ]
        
        let castLabelConstraints = [
            castLabel.topAnchor.constraint(equalTo: addToFolder.bottomAnchor, constant: 20),
            castLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            castLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(cViewConstraints)
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(titlePosterConstraints)
        NSLayoutConstraint.activate(overviewBackgroundConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(ratingBackgroundConstraints)
        NSLayoutConstraint.activate(ratingStarConstraints)
        NSLayoutConstraint.activate(ratingValConstraints)
        NSLayoutConstraint.activate(elaRatingConstraints)
        NSLayoutConstraint.activate(elaStarConstraints)
        NSLayoutConstraint.activate(elaValConstraints)
        NSLayoutConstraint.activate(addToFolderConstraints)
        NSLayoutConstraint.activate(castLabelConstraints)
        //NSLayoutConstraint.activate(castCollectionViewConstraints)
        

        
    }
    
    public func configure(with model: GenViewModel) {
        titleLabel.text = model.genName
        overviewLabel.text = model.overview
        let va = String(format: "%.1f", model.vote_average)
        ratingVal.text = "\(va)/10"
        guard var url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        if model.posterURL == "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg" {
            url = URL(string: "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg")!
        }
        
        titlePoster.sd_setImage(with: url, completed: nil)
        
        let query = "\(model.genName) (\(model.release_date)) trailer"
        
        MediaAPI.shared.getMovie(with: query) { [weak self] result in
                    switch result {
                    case .success(let videoElement):
                        DispatchQueue.main.async {
                            guard let url = URL(string: "https://www.youtube.com/embed/\(videoElement.id.videoId)") else {
                                        return
                                    }
                                    
                            self?.webView.load(URLRequest(url: url))
                        }

                        
                    case .failure(let error):
                        print("hi")
                        print(error.localizedDescription)
                    }
                }
        
        if model.media_type == "tv" {
            MediaAPI.shared.findCastTV(with: model.id) {results in
                DispatchQueue.main.async {
                    switch results {
                    case .success(let cast):
                        self.cast = cast
                        self.castCollectionView.reloadData()
                    case .failure(let error):
                        
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        else {
            MediaAPI.shared.findCastMovie(with: model.id) {results in
                DispatchQueue.main.async {
                    switch results {
                    case .success(let cast):
                        self.cast = cast
                        self.castCollectionView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
}


extension TitleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtraInfoViewCell.identifier, for: indexPath) as? ExtraInfoViewCell else {
                    return UICollectionViewCell()
                }
        
        let cast_mem = cast[indexPath.row]
        var name: String = "Unknown Name"
        var profile_path: String = "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg"
        var character: String = ""
        var id = cast_mem.id
        
        if cast_mem.name != nil {
            name = cast_mem.name!
        } else if cast_mem.original_name != nil {
            name = cast_mem.original_name!
        }
        
        if cast_mem.profile_path != nil {
            profile_path = cast_mem.profile_path!
        }
        
        if cast_mem.character != nil {
            character = cast_mem.character!
        }
        
        cell.configure(with: CastViewModel(name: (name), profile_path: profile_path, character: character, id: id, media_type: cast_mem.media_type))
        
        return cell
    }
    
    
    
}
