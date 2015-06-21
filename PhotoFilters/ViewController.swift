//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Taylor Boren on 6/20/15.
//  Copyright (c) 2015 Taylor Boren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func applyFilter(sender: AnyObject) {
        // Create an image to filter
        let inputImage = CIImage(image: photoImageView.image)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        // Reflect the change back in the interface
        photoImageView.image = UIImage(CGImage: renderedImage)
    }
    
    // create place to render filtered image
    let context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

