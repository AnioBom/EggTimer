//
//  Interface.swift
//  EggTimer
//
//  Created by mac on 4/5/23.
//

import SnapKit
import UIKit

class Interface: UIView {
    
    
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Private properties
    
    // Label
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.textColor = .brown
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    // Buttons
    
    func createButton(name: String, image: UIImage?) -> UIButton {
    
        let button = UIButton()
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.frame = CGRect(origin: .zero, size: .init(width: 50, height: 100))
        button.setBackgroundImage(image, for: .normal)
        return button
    }
    
    // Progress View
    
    private let timeControl: UIProgressView = {
        let viewControl = UIProgressView(progressViewStyle: .default)
        viewControl.center = viewControl.center
        viewControl.frame = CGRect(origin: .zero, size: .init(width: 340, height: 3))
        viewControl.progress = 0.5
        viewControl.setProgress(0.8,animated:true)
        viewControl.progressTintColor = .lightGray
        viewControl.trackTintColor = .yellow
        return viewControl
    }()
    
}

// MARK: - Private methods

private extension Interface {
    
    func initialize() {
        
        backgroundColor = .white
        
        let xStack = UIStackView()
        xStack.axis = .horizontal
        xStack.alignment = .center
        xStack.spacing = 10
        xStack.distribution = .fillProportionally
        
        xStack.addArrangedSubview(createButton(name: "Soft", image: UIImage(named: "1")))
        xStack.addArrangedSubview(createButton(name: "Medium", image: UIImage(named: "2")))
        xStack.addArrangedSubview(createButton(name: "Hard", image: UIImage(named: "3")))
        //xStack.addArrangedSubview(mediumButton)
        //xStack.addArrangedSubview(hardButton)
        
        
        let yStack = UIStackView()
        yStack.axis = .vertical
        //yStack.alignment = .fill
        yStack.distribution = .fillProportionally
        yStack.spacing = 20
        
        yStack.addArrangedSubview(nameLabel)
        yStack.addArrangedSubview(xStack)
        yStack.addArrangedSubview(timeControl)
        
        addSubview(yStack)
        yStack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(250)
            
        }
        
    }
    
}
