//
//  HomeViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 6/25/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.contentMode = .scaleAspectFit
        photoView.backgroundColor = .white
        return photoView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.309933275, green: 0.9620077014, blue: 0.8476579785, alpha: 1)
        button.setTitle("Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.8960843682, green: 0.8887797594, blue: 0.4351575375, alpha: 1)

        view.addSubview(photoView)

        getPhoto()
        
        view.addSubview(button)
        button.frame = CGRect(x: 48, y:650, width: view.frame.size.width - 100, height: 55)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //navigationController?.pushViewController(PersonViewController(), animated: true)
    }
    
    @objc func didTapButton() {
        getPhoto()
    }
    
    func getPhoto() {
        let urlString = "https://r.sine.com/index"//This seems problamatic :(||| Replace w our photo album :)
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) 
            else{return}
        let image = UIImage(data: data)!
        let width = image.size.width
        let height = image.size.height
        photoView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        photoView.center = view.center
        photoView.image = image
        
        //navigationController?.pushViewController(TitleViewController(), animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
