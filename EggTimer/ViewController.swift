//
//  ViewController.swift
//  EggTimer
//
//  Created by mac on 4/5/23.
//

import SnapKit
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var myImageView = UIImageView()
    let mainImage = UIImage(named: "backgraund")
    var timer = Timer()
    var player: AVAudioPlayer!
    
    private var progressView = ProgressView()
    
    var timeDuration = 7.20
    var timeProgress: CGFloat = 0.0
    
    var callBack: (() -> Void)?
    
    //MARK: - Views
    
    private let titleLabel: UILabel = {
       let view = UILabel()
        view.text = "How do you like your eggs?"
        view.font = UIFont.boldSystemFont(ofSize: 30)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let timerLabel: UILabel = {
       let view = UILabel()
        view.text = "00:00"
        view.font = UIFont.boldSystemFont(ofSize: 50)
        view.textColor = .white
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shapeView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "progress")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let softButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Soft", for: .normal)
        
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mediumButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Medium", for: .normal)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let hardButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Hard", for: .normal)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.image = mainImage
        myImageView.contentMode = .scaleAspectFill
        myImageView.center = view.center
        view.addSubview(myImageView)
        
        
        setConstraints()
        
        softButton.addTarget(self, action: #selector(startButton), for: .touchUpInside)
        
    }
    
    // MARK: - Methods
    
    @objc func startButton() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.1,
            repeats: true,
            block: { [weak self] timer in
                guard let self = self else { return }
                
                if self.timeProgress > self.timeDuration {
                    self.timeProgress = self.timeDuration
                    timer.invalidate()
                }
                self.configure(with: self.timeDuration, progress: self.timeProgress)
            })
        
    }
    
    func configure(with duration: Double, progress: Double) {
        
        timeDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        //let percent = tempCurrentValue / goalValueDivider
        
        timerLabel.text = getDisplayString(from: Int(duration) - Int(tempCurrentValue))
        
        
        
        
    }
    
    
    func playSound(soundName: String) {
            
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
            
        }
        
}

// MARK: - Extention

extension ViewController {
    
    func setConstraints() {
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])
        
        view.addSubview(softButton)
        NSLayoutConstraint.activate([
            softButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            softButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            softButton.heightAnchor.constraint(equalToConstant: 70),
            softButton.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        view.addSubview(mediumButton)
        NSLayoutConstraint.activate([
            mediumButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumButton.heightAnchor.constraint(equalToConstant: 70),
            mediumButton.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        view.addSubview(hardButton)
        NSLayoutConstraint.activate([
            hardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            hardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hardButton.heightAnchor.constraint(equalToConstant: 70),
            hardButton.widthAnchor.constraint(equalToConstant: 90)
        ])

        
        view.addSubview(shapeView)
        NSLayoutConstraint.activate([
            shapeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shapeView.heightAnchor.constraint(equalToConstant: 250),
            shapeView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        shapeView.addSubview(timerLabel)
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

private extension ViewController {
    func getDisplayString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
           ? [minutesStr, secondsStr].joined(separator: ":")
           : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
        }
        
}

        

