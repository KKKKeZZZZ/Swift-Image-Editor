//
//  ViewController.swift
//  ImageEditor
//
//  Created by 张珂 on 20/8/19.
//  Copyright © 2019 Ke Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage(named: "Killer_queen.png")
    let filter = CIFilter(name: "CIColorControls")
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialise()
    }
    private func getImage() -> CIImage{
        return CIImage(image: imageView.image!)!
    }

    @IBAction func changeToMonochrome(_ sender: UIButton) {
        adjustSaturation(level: 0.0)
    }
    private func initialise(){
        imageView.image = image
        filter?.setValue(getImage(), forKey: "inputImage")
    }
    private func adjustSaturation(level: Double){
        filter?.setValue(level, forKey: "inputSaturation")
        let filteredImage = filter!.outputImage
        let graphicsImage = context.createCGImage(filteredImage!, from: filteredImage!.extent)
        imageView.image = UIImage(cgImage: graphicsImage!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func changeToSaturate(_ sender: UIButton) {
        adjustSaturation(level: 2.0)
    }
    @IBAction func changeToInvert(_ sender: UIButton) {
        adjustSaturation(level: -1)
    }
}

