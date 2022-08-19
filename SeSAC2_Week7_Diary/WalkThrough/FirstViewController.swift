//
//  FirstViewController.swift
//  SeSAC2_Week7_Diary
//
//  Created by 윤여진 on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(systemName: "star.fill")
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.backgroundColor = .red
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.textColor = .black
        tutorialLabel.text = """
        일기 씁시다!
        잘 써봅시다!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        tutorialLabel.alpha = 0
        
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
            self.tutorialLabel.backgroundColor = .yellow
        } completion: { (_) in
            self.animateBlackView()
            self.animateImageView()
        }

        
    }
    
    func animateBlackView() {
        UIView.animate(withDuration: 3) {
            //self.blackView.frame.size.width += 350
            self.blackView.transform = CGAffineTransform(scaleX: 3, y: 1)
            self.blackView.alpha = 1
            self.blackView.layoutIfNeeded()
        } completion: { _ in
            
        }

    }
    
    func animateImageView() {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.imageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3) // 1.3배씩 키워준다.
        } completion: { (_) in
            
        }

        
    }
    
    
    
}
