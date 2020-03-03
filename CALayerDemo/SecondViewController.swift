//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Artur Anissimov on 03.03.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var buttonTakeTheCup: UIButton! {
        didSet {
            buttonTakeTheCup.layer.cornerRadius = buttonTakeTheCup.frame.size.height / 2
            buttonTakeTheCup.layer.shadowOffset = CGSize(width: 0, height: 5)
            buttonTakeTheCup.layer.shadowOpacity = 0.5
            buttonTakeTheCup.layer.shadowRadius = 5
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.shadowOffset = CGSize(width: 0, height: 10)
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowRadius = 10
            imageView.layer.shadowColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 50
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTakeTheCupPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
