//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Artur Anissimov on 03.03.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            gradientLayer.locations = [0.2, 1, 0.8]
        }
    }
    
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
            let borderColor = UIColor.white
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 5
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func buttonTakeTheCupPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
