//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Artur Anissimov on 03.03.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet { /* Начальные настройки для нашего shapeLayer */
            shapeLayer.lineWidth = 20 /* Ширина линии */
            shapeLayer.lineCap = .round /* Углы линии */
            shapeLayer.fillColor = nil /* */
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet { /* Начальные настройки для нашего shapeLayer */
            overShapeLayer.lineWidth = 20 /* Ширина линии */
            overShapeLayer.lineCap = .round /* Углы линии */
            overShapeLayer.fillColor = nil /* */
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet { /* Начальные настройки для нашего gradientLayer */
            gradientLayer.startPoint = CGPoint(x: 0, y: 0) /* Стартовая точка для градиента (верхний левый угол) */
            gradientLayer.endPoint = CGPoint(x: 0, y: 1) /* Конечная точка для градиента (нижний левый угол) */
            let startColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor /* Начальный цвет */
            let endColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor /* Конечный цвет */
            gradientLayer.colors = [startColor, endColor] /* Массив цветов для нашего градиента */
            // gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor] /* Массив цветов для нашего градиента */
            
        }
    }
    

    @IBOutlet weak var imageView: UIImageView! {
        didSet { /* Начальные настройки для нашего imageView */
            imageView.layer.cornerRadius = imageView.frame.size.height / 2 /* Делаем наше изображение круглым */
            imageView.layer.masksToBounds = true /* Делаем обрезание картинки по нашему радиусу */
            let borderColor = UIColor.white /* Создаём цвет для нашей границе */
            imageView.layer.borderColor = borderColor.cgColor /* Меняем цвет границы на созданный цвет выше */
            imageView.layer.borderWidth = 10 /* Увеличиваем толщину нашей границы */
        }
    }
    
    @IBOutlet weak var buttonTapMe: UIButton! {
        didSet { /* Начальные настройки для нашего buttonTapMe */
            buttonTapMe.layer.shadowOffset = CGSize(width: 0, height: 5) /* Смещение тени */
            buttonTapMe.layer.shadowOpacity = 0.5 /* Прозрачность тени */
            buttonTapMe.layer.shadowRadius = 5 /* Радиус тени */
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer() /* Инициализируем наш градиент */
        view.layer.insertSublayer(gradientLayer, at: 0) /* Добавляем на градиет для нашего view */
        
        shapeLayer = CAShapeLayer() /* Инициализируем нашу линию */
        view.layer.addSublayer(shapeLayer) /* Добавляем линию для нашего view */
        
        overShapeLayer = CAShapeLayer() /* Инициализируем нашу линию */
        view.layer.addSublayer(overShapeLayer) /* Добавляем линию для нашего view */
    }

    @IBAction func buttonTapMeTapped(_ sender: UIButton) {
        
//        overShapeLayer.strokeEnd += 0.2
//
//        if overShapeLayer.strokeEnd == 1 {
//            performSegue(withIdentifier: "showSecondScreen", sender: self)
//        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd") /* Создаём анимацию */
        animation.toValue = 1 /* Значение анимации по окончанию самой анимации */
        animation.duration = 2 /* Длительность анимации */
        
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "showSecondScreen", sender: self)
    }
    
}

