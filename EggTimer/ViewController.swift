//
//  ViewController.swift
//  EggTimer
//
//  Created by mac on 4/5/23.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interface = Interface()
        view.addSubview(interface)
        interface.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        
        
    }
    
    
    }

