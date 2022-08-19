//
//  WriteViewController.swift
//  SeSAC2_Week7_Diary
//
//  Created by 윤여진 on 2022/08/19.
//

import UIKit
import SnapKit

class WriteViewController: BaseViewController {
    
    var mainView = WriteView()
    
    override func loadView() { //super. loadview는 불필요
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
    
    override func configure() {
    
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    @objc func titleTextFieldClicked(_ textfield: UITextField) {
        guard let text = textfield.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", buttonTitle: "확인")
            return
        }
    }
    
    
    
}
