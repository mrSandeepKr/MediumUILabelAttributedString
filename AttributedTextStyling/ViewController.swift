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
        // create a string
        let labelText = "Hello World!"
        // converting the string to attributed text
        let attributedText = NSMutableAttributedString(string: labelText)
        
        // MARK: FONT SIZE
        let textFontSize:CGFloat = 40
        let fontSizeAttribute = [NSAttributedString.Key.font:  UIFont.systemFont(ofSize: textFontSize)]
        attributedText.addAttributes(fontSizeAttribute, range: NSRange(location: 0, length: labelText.count))
        
        
        // MARK: BOLD
        let boldAttribute = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: textFontSize)]
        
        // Getting the range for Hello
        // Need to case the string to NSString in order to get NSRange
        let rangeToBold = (labelText as NSString).range(of: "Hello")
        
        // Adding attributs to the range
        attributedText.addAttributes(boldAttribute, range: rangeToBold)
        
        label.attributedText = attributedText
    }
}

