//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Artur Anissimov on 03.03.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer() /* Инициализируем наш градиент */
        view.layer.insertSublayer(gradientLayer, at: 0) /* Добавляем на градиет для нашего view */
    }


}

