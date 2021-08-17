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
        
        // MARK: KERN (Text Spacing)
        
        // Getting the range for the word World
        let rangeToChangeSpacing = (labelText as NSString).range(of: "World")
        
        // setting the Kern Attribute to 4
        let kerningAttribute = [NSAttributedString.Key.kern : 4]
        
        // Adding kern attributs to the range
        attributedText.addAttributes(kerningAttribute, range: rangeToChangeSpacing)
        
        // MARK: IMAGE ATTACHMENT
        
        // Choose a image to attach to the UILabel
        let image = UIImage.init(systemName: "square.and.pencil")!
        
        // Building a NSTextAttachment from the chosen  image
        let textAttachment = NSTextAttachment(image: image)
        
        // Giving the textAttachment a desired Size
        // Here we shall be keeping it's dimensions same as font size
        textAttachment.bounds = CGRect(x: 0,
                                       y: 0,
                                       width: textFontSize,
                                       height: textFontSize)
        
        // Converting the textAttachment to an AttributedString
        let textAttachmentAttriText = NSAttributedString(attachment: textAttachment)
        
        attributedText.append(NSAttributedString(string: "  "))
        // Appending Image Attachment to string
        attributedText.append(textAttachmentAttriText)
        
        // MARK: Background and Foreground Coloring
        
        // Getting the range for Coloring Text
        let rangeToColor = (labelText as NSString).range(of: "o Worl")
        
        // Setting the foreground color to Red
        // and background Color to grey
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,
                              NSAttributedString.Key.backgroundColor: UIColor.lightGray]
        
        attributedText.addAttributes(textAttributes, range: rangeToColor)
        
        label.attributedText = attributedText
    }
}

