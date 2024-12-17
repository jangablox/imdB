//
//  SearchViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 6/25/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let folderFeedTable: UITableView = {
        let table = UITableView()
        table.register(FolderTableViewCell.self, forCellReuseIdentifier: FolderTableViewCell.identifier)
        table.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        return table
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: MediaSearchViewController())
        controller.searchBar.placeholder = "Search "
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        button.setTitle("View More", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        
        view.addSubview(folderFeedTable)
        folderFeedTable.delegate = self
        folderFeedTable.dataSource = self
        
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        
        
        view.addSubview(button)
        button.frame = CGRect(x: 48, y:650, width: view.frame.size.width - 100, height: 55)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //change frame to fit figma frame
        folderFeedTable.frame = view.bounds
    }
    
    @objc func didTapButton() {
        let vc = FolderTableViewController()
        //self.present(vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FolderTableViewCell.identifier, for: indexPath) as? FolderTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension SearchViewController: UISearchResultsUpdating, MediaSearchViewControllerDelegate {
    func mediaSearchViewControllerDidTapItem(_ viewModel: GenViewModel) {
        if viewModel.media_type == "tv" || viewModel.media_type == "movie"{
            DispatchQueue.main.async { [weak self] in
                let vc = TitleViewController()
                vc.configure(with: viewModel)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        if viewModel.media_type == "person" {
            DispatchQueue.main.async { [weak self] in
                let vc = PersonViewController()
                vc.configure(with: viewModel)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
            !query.trimmingCharacters(in: .whitespaces).isEmpty,
            query.trimmingCharacters(in: .whitespaces).count >= 3,
            let resultsController = searchController.searchResultsController as? MediaSearchViewController else{
            return
            }
        
        resultsController.delegate = self
        
        MediaAPI.shared.searchMedia(with: query) { results in
            DispatchQueue.main.async {
                switch results {
                case .success(let notFolders):
                    resultsController.notFolders = notFolders
                    resultsController.mediaSearchTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
//    func mediaSearchViewControllerDidTapItem(_ viewModel: GenViewModel) {
//        print("h")
//        DispatchQueue.main.async { [weak self] in
//            let vc = TitleViewController()
//            vc.configure(with: viewModel)
//            self?.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    
}
