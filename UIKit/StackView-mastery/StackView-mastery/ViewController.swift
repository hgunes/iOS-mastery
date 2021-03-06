//
//  ViewController.swift
//  StackView-mastery
//
//  Created by Harun Gunes on 18/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    
    let view6 = UIView()
    let view7 = UIView()
    let view8 = UIView()
    let view9 = UIView()
    let view10 = UIView()
    
    let viewA = UIView()
    let viewB = UIView()
    let viewC = UIView()
    let viewD = UIView()
    let viewE = UIView()
    
    let stackView1 = UIStackView()
    let stackView2 = UIStackView()
    let stackView3 = UIStackView()
    let stackView4 = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        configureViews()
        stackView2Configure()
        stackView3Configure()
//        stacView4Configure()
    }
    
    
    private func configureViews() {
        let views = [view1, view2, view3, view4, view5]
        
        for item in views {
            item.translatesAutoresizingMaskIntoConstraints = false
            item.backgroundColor = .white
            
            item.widthAnchor.constraint(equalToConstant: 1).isActive = true
            item.layer.cornerRadius = 8
            stackView1.addArrangedSubview(item)
        }
        
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .horizontal
        stackView1.distribution = .equalSpacing // .fillEqually no need for height or width
        stackView1.spacing = 8
        
        view.addSubview(stackView1)
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView1.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        
    }
    
    func stackView2Configure() {
        
        let views = [view6, view7, view8, view9, view10]
        
        for item in views {
            item.translatesAutoresizingMaskIntoConstraints = false
            item.backgroundColor = .white
            
            item.heightAnchor.constraint(equalToConstant: 1).isActive = true
            item.layer.cornerRadius = 8
            stackView2.addArrangedSubview(item)
        }
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView2)

        stackView2.axis = .vertical
        stackView2.distribution = .equalSpacing
        stackView2.spacing = 8
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalToSystemSpacingBelow: stackView1.bottomAnchor, multiplier: 6),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView2.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    func stackView3Configure() {
        
        let views = [viewA, viewB, viewC, viewD, viewE]
        
        for item in views {
            item.translatesAutoresizingMaskIntoConstraints = false
            item.backgroundColor = .white
            
            item.heightAnchor.constraint(equalToConstant: 1).isActive = true
            item.layer.cornerRadius = 8
            stackView3.addArrangedSubview(item)
        }
        
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView3)
        
        stackView3.axis = .horizontal
        stackView3.distribution = .equalSpacing
        stackView3.spacing = 8
        
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalToSystemSpacingBelow: stackView2.bottomAnchor, multiplier: 8),
            stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView3.heightAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    
    
//    func stacView4Configure() {
//        stackView4.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView4)
//
//        stackView4.addArrangedSubview(stackView1)
//        stackView4.addArrangedSubview(stackView2)
//        stackView4.addArrangedSubview(stackView3)
//
//        stackView4.axis = .vertical
//        stackView4.distribution = .fillProportionally
//        stackView4.spacing = 10
//
//        NSLayoutConstraint.activate([
//            stackView4.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
//            stackView4.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView4.trailingAnchor, multiplier: 1),
//            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView4.bottomAnchor, multiplier: 1)
//        ])
//    }
    
    
}

