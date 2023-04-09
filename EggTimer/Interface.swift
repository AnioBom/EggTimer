//
//  Interface.swift
//  EggTimer
//
//  Created by mac on 4/5/23.
//

import SnapKit
import UIKit

class Interface: UIView {
    
    var mainImageView: UIImageView!
    
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
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
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
        viewControl.frame = CGRect(x: 0, y: 127, width: 374, height: 6)
        viewControl.progress = 0.5
        viewControl.setProgress(0.8,animated:true)
        viewControl.progressTintColor = .yellow
        viewControl.trackTintColor = .blue
        return viewControl
    }()
    
}

// MARK: - Private methods

private extension Interface {
    
    func initialize() {
        
        backgroundColor = UIColor(cgColor: CGColor(red: 252/255, green: 176/255, blue: 64/255, alpha: 1))
        
        let xStack = UIStackView()
        xStack.axis = .horizontal
        xStack.alignment = .center
        xStack.spacing = 10
        xStack.distribution = .fillProportionally
        
        xStack.addArrangedSubview(createButton(name: "Soft", image: UIImage(named: "main")))
        xStack.addArrangedSubview(createButton(name: "Medium", image: UIImage(named: "main")))
        xStack.addArrangedSubview(createButton(name: "Hard", image: UIImage(named: "main")))
        //xStack.addArrangedSubview(mediumButton)
        //xStack.addArrangedSubview(hardButton)
        
        
        let yStack = UIStackView()
        yStack.axis = .vertical
        yStack.distribution = .fillProportionally
        yStack.spacing = 20
        
        yStack.addArrangedSubview(nameLabel)
        yStack.addArrangedSubview(xStack)
        yStack.addArrangedSubview(timeControl)
        
        addSubview(yStack)
        yStack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            
        }
    }
    
}
