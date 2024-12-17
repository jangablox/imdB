//
//  MediaSearchViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/4/24.
//

import UIKit

protocol MediaSearchViewControllerDelegate: AnyObject {
    func mediaSearchViewControllerDidTapItem(_ viewModel: GenViewModel)
}

class MediaSearchViewController: UIViewController {
    
    public var notFolders: [NotFolder] = [NotFolder]()
    
    public weak var delegate: MediaSearchViewControllerDelegate?

    public let mediaSearchTableView: UITableView = {
        
        let table = UITableView()
        //table.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        table.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        table.register(GeneralTableViewCell.self, forCellReuseIdentifier: GeneralTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        view.addSubview(mediaSearchTableView)//with rating + pictures
        
        mediaSearchTableView.delegate = self
        mediaSearchTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mediaSearchTableView.frame = view.bounds
    }

}

extension MediaSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notFolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralTableViewCell.identifier, for: indexPath) as? GeneralTableViewCell else {
            return UITableViewCell()
        }
        
        let notFolder = notFolders[indexPath.row]
        let media_type: String = notFolder.media_type
        var name: String = "Unknown Name"
        var posterURL: String = "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg"
        var overview: String = "No Overview Avaliable"
        var voter_average: Float = 0
        var release_date: String = ""
        if notFolder.name != nil {
            name = notFolder.name!
        } else if notFolder.original_name != nil {
            name = notFolder.original_name!
        } else if notFolder.title != nil {
            name = notFolder.title!
        } else if notFolder.origional_title != nil {
            name = notFolder.origional_title!
        }
        
        if notFolder.poster_path != nil {
            posterURL = notFolder.poster_path!
        } else if notFolder.profile_path != nil {
            posterURL = notFolder.profile_path!
        }
        
        if notFolder.overview != nil {
            overview = notFolder.overview!
        }
        
        if notFolder.vote_average != nil {
            voter_average = notFolder.vote_average!
        }
        if notFolder.release_date != nil {
            release_date = notFolder.release_date!
        }
        //if media_type == "person" {
        cell.configure(with: GenViewModel(genName: (name), posterURL: posterURL, media_type: media_type, overview: overview, vote_average: voter_average, id: notFolder.id, release_date: release_date))
//        } else {
//            cell.configure(with: GenViewModel(genName: (name), posterURL: posterURL, media_type: media_type))
//        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let notFolder = notFolders[indexPath.row]
        let media_type: String = notFolder.media_type
        var name: String = "Unknown Name"
        var posterURL: String = "https://i.pinimg.com/originals/87/67/64/8767644bc68a14c50addf8cb2de8c59e.jpg"
        var overview: String = "No Overview Avaliable"
        var voter_average: Float = 0
        var release_date: String = ""
        if notFolder.name != nil {
            name = notFolder.name!
        } else if notFolder.original_name != nil {
            name = notFolder.original_name!
        } else if notFolder.title != nil {
            name = notFolder.title!
        } else if notFolder.origional_title != nil {
            name = notFolder.origional_title!
        }
        
        if notFolder.poster_path != nil {
            posterURL = notFolder.poster_path!
        } else if notFolder.profile_path != nil {
            posterURL = notFolder.profile_path!
        }
        
        if notFolder.overview != nil {
            overview = notFolder.overview!
        }
        
        if notFolder.vote_average != nil {
            voter_average = notFolder.vote_average!
        }
        if notFolder.release_date != nil {
            release_date = notFolder.release_date!
        }
        
        self.delegate?.mediaSearchViewControllerDidTapItem(GenViewModel(genName: name, posterURL: posterURL, media_type: media_type, overview: overview, vote_average: voter_average, id: notFolder.id, release_date: release_date))
        

        
    }
    
}

