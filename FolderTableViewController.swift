//
//  FolderTableViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/10/24.
//

import UIKit

class FolderTableViewController: UIViewController {
    
    public let folderTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)
        table.register(FolderTableViewCell.self, forCellReuseIdentifier: FolderTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(folderTableView)
        
        folderTableView.delegate = self
        folderTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        folderTableView.frame = view.bounds
    }
}

extension FolderTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FolderTableViewCell.identifier, for: indexPath) as? FolderTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
