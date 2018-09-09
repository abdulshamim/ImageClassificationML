//
//  ViewController.swift
//  ImageClassificationML
//
//  Created by Abdul Shamim on 09/09/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var categoeryLabel: UILabel!
    
    let model = GoogLeNetPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as? UIImageView
        
        if let imageToAnalyse = imageView?.image {
            if let sceneLabelString = self.sceneLabel(forImage: imageToAnalyse) {
                categoeryLabel.text = sceneLabelString
            }
        }
    }
    
    func sceneLabel(forImage image: UIImage) -> String? {
       
        if let pixelBuffer =  image.pixelBuffer(width: 224, height: 224) {
            guard let scene = try? model.prediction(sceneImage: pixelBuffer) else {
                fatalError("Run time error")
            }
            
            return scene.sceneLabel
        }
        return nil
    }
}

