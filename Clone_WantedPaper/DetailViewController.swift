//
//  DetailViewController.swift
//  Clone_WantedPaper
//
//  Created by 서동운 on 2021/05/13.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var value: UILabel!
    
    let ViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        if let bountyInfo = ViewModel.bountyInfo {
            img.image = bountyInfo.img
            name.text = bountyInfo.name
            value.text = "\(bountyInfo.bounty)"
        }
    }
}
class DetailViewModel {
    var bountyInfo: bountyInfo?
    
    func update(model: bountyInfo?) {
        bountyInfo = model
    }
}
