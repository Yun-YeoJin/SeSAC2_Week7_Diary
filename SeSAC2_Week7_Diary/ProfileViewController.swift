//
//  ProfileViewController.swift
//  SeSAC2_Week7_Diary
//
//  Created by 윤여진 on 2022/08/18.
//

import UIKit
import SnapKit

extension NSNotification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}

class ProfileViewController: UIViewController {

    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .black
        return view
    }()
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이름을 입력하세요"
        view.backgroundColor = .brown
        view.textColor = .white
        return view
    }()
    
    var saveButtonActionHandler: ((String) -> ())?
    
    func configure() {
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(50)
            $0.top.equalTo(50)
            $0.height.equalTo(50)
        }
        saveButton.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.width.height.equalTo(100)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        view.backgroundColor = .yellow
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("TEST"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameTextField.text = name
        }
    }
    
    @objc func saveButtonClicked() {
        
        
        //MARK: 2. Notification 보내기
        NotificationCenter.default.post(name: .saveButton, object: nil, userInfo: ["name": nameTextField.text!, "value": 123456])
        
        //1. 클로저 기능
        //값 전달기능 실행 => 클로저 구문 활용
        saveButtonActionHandler?(nameTextField.text!)
        
        //화면 dismiss
        dismiss(animated: true)
    }

   

}
