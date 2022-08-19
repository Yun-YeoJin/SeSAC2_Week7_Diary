//
//  ViewController.swift
//  SeSAC2_Week7_Diary
//
//  Created by 윤여진 on 2022/08/16.
//

import UIKit
import SeSAC2_UIFramework
import SnapKit


class ViewController: UIViewController {
    
    var testArray: Array<Int> = [1,2,3,4]
    var testdic: Dictionary<Int, String> = [:]
    var testSet: Set = [2,3,4]
    
    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        //MARK: Notification 받기
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameButton.setTitle(name, for: .normal)
        }
    }
    @objc func nameButtonClicked() {
        
//        let vc = WriteViewController()
//        present(vc, animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name("TEST"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value": 123456])
        
        let vc = ProfileViewController()
        
        vc.saveButtonActionHandler = { name in
            
           self.nameButton.setTitle(name, for: .normal)
        
        }
        present(vc, animated: true)
    }
    
    func configure() {
        
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }
    
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //
    //        let vc = CodeSnap2ViewController()
    //        vc.modalPresentationStyle = .fullScreen
    //        present(vc, animated: true)
    //
    //    }
}

