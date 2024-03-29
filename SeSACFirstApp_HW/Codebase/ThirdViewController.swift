//
//  ThirdViewController.swift
//  SeSACFirstApp_HW
//
//  Created by 박지은 on 1/26/24.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    
    let savedTitle = UILabel()
    let savedBody = UILabel()
    let contentImg = UIImageView()
    let settingButton = UIButton()
    let savedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "저장한 콘텐츠 목록"
        
        configureHierachy()
        configureView()
        configureConstraints()
    }
    
    func configureHierachy() {
        
        [savedTitle, savedBody, contentImg, settingButton, savedBody].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        savedTitle.text = "'나만의 자동 저장' 기능"
        
        savedBody.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        savedBody.numberOfLines = 0
        savedBody.textAlignment = .center
        savedBody.font = UIFont.systemFont(ofSize: 13)
        savedBody.textColor = .gray
        
        contentImg.image = .dummy
        
        buttonType(settingButton, title: "설정하기", backColor: .systemBlue, titlecolor: .white)
        buttonType(savedButton, title: "저장 가능한 콘텐츠 살펴보기", backColor: .white, titlecolor: .black)
    }
    
    func configureConstraints() {
        savedTitle.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(savedBody.snp.top)
        }
        
        savedBody.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(contentImg.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        contentImg.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.top.equalTo(contentImg.snp.bottom).offset(40)
            $0.height.equalTo(40)
        }
        
        savedButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.top.equalTo(settingButton.snp.bottom).offset(20)
            $0.height.equalTo(40)
        }
    }
    
    func buttonType(_ sender: UIButton, title: String, backColor: UIColor, titlecolor: UIColor) {
        sender.setTitle(title, for: .normal)
        sender.backgroundColor = backColor
        sender.setTitleColor(titlecolor, for: .normal)
        sender.layer.cornerRadius = 5
        sender.clipsToBounds = true
    }
}
