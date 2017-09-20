//
//  DetailViewController.swift
//  FuturamaCharacters
//
//  Created by Steven Vlaminck on 9/12/17.
//  Copyright © 2017 Steven Vlaminck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var characters: Character?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataTitle = characters?.name {
            nameLabel.text = dataTitle
        }
        if let dataDescription = characters?.description {
            descriptionLabel.text = dataDescription
        }
        if let dataImage = characters?.image() {
            imageView.image = dataImage
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(doneso))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func doneso() {
        self.dismiss(animated: true)
    }
}
