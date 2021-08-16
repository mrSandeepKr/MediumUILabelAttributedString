//
//  ViewController.swift
//  AttributedTextStyling
//
//  Created by Sandeep Kumar on 16/08/21.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel() //Creating a UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground //Add Background Color to the View.
        view.addSubview(label)  // Add the Text Label to View hierarchy
        
        setUpLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.sizeToFit() //Adjust the size of UILabel according to the content
        label.center = view.center //Position the UILabel to the center of the screen.
    }
    
    private func setUpLabel() {
        //Add Code Snippet to Set Up UILabel.
    }
}

