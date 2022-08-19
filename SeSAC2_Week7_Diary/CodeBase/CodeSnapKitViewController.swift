//
//  CodeSnapKitViewController.swift
//  SeSAC2_Week7_Diary
//
//  Created by 윤여진 on 2022/08/17.
//

import UIKit

import SnapKit

class CodeSnapKitViewController: UIViewController {

    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .center
        view.placeholder = "제목을 입력하세용"
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let dateTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .center
        view.placeholder = "날짜를 입력하세용"
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    let contentTextView: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        configureUI()
    }
    
    func configureUI() {
        
        //photoImageView.translatesAutoresizingMaskIntoConstraints = false -> SnapKit에 들어있음
        [photoImageView, titleTextField, dateTextField, contentTextView].forEach {
            view.addSubview($0)
        }
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        
      
        
    }
    

    

}
