//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Artur Anissimov on 03.03.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

