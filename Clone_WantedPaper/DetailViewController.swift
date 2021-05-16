//
//  DetailViewController.swift
//  Clone_WantedPaper
//
//  Created by 서동운 on 2021/05/13.
//

import UIKit

// MARK: - Detail ViewController
class DetailViewController: UIViewController {
    
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bountyLabel: UILabel!
    
    @IBOutlet var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet var bountyLabelCenterX: NSLayoutConstraint!
    
    let ViewModel = DetailViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
        // 설정한 오토 레이아웃과 다르게 설정.
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180).scaledBy(x: 3, y: 3)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180).scaledBy(x: 3, y: 3)
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
//        UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded) // 심플버전
        
//        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: self.view.layoutIfNeeded, completion: nil)
        
        // nameLabel, bountyLabel animation effect
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: self.view.layoutIfNeeded, completion: nil)
        // self.view.layoutIfNeeded은 prepareAnimation()으로 레이아웃이 바꼈으니 돌아오게 수행하라
        
        //imgView animation effect
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: self.view.layoutIfNeeded, completion: nil)
        
        //transform
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            self.nameLabel.alpha = 1
            self.nameLabel.transform = CGAffineTransform.identity
            
        })
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        })
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    func updateUI() {
        if let bountyInfo = ViewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
}
// MARK: - Detail ViewModel
class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
