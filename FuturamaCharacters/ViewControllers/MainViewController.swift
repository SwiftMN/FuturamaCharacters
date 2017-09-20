//
//  MainViewController.swift
//  FuturamaCharacters
//
//  Created by Steven Vlaminck on 9/12/17.
//  Copyright © 2017 Steven Vlaminck. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let cellIdentifier = "dataObjectCell"
    private var selectedIndexPath = IndexPath()
    private let transition = TransitionAnimator()

    var characters: [Character] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        characters = initialData()
    }
    
    func nameLabelCopy() -> UILabel? {
        // tableView.cellForRow(at:) crashes if you call createCopy() on the result so build a new cell.
        return tableView(tableView, cellForRowAt: selectedIndexPath).textLabel?.createCopy()
    }
    
    func imageViewCopy() -> UIImageView? {
        // tableView.cellForRow(at:) crashes if you call createCopy() on the result so build a new cell.
        return tableView(tableView, cellForRowAt: selectedIndexPath).imageView?.createCopy()
    }
    
    func nameLabelFrame() -> CGRect? {
        return tableView.cellForRow(at: selectedIndexPath)?.textLabel?.frame
    }
    
    func imageViewFrame() -> CGRect? {
        return tableView.cellForRow(at: selectedIndexPath)?.imageView?.frame
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.description
        cell.imageView?.image = character.image()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndexPath = indexPath
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detail = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        detail.characters = characters[indexPath.row]
        detail.transitioningDelegate = self
        transition.cellFrame = tableView.convert(tableView.rectForRow(at: indexPath), to: nil)
        present(detail, animated: true)
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
}

extension UILabel {
    func createCopy() -> UILabel {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UILabel
    }
}

extension UIImageView {
    func createCopy() -> UIImageView {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UIImageView
    }
}


