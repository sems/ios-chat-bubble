//
//  ViewController.swift
//  TutorialMessageBubble
//
//  Created by Robert Kerr on 11/9/17.
//  Copyright © 2017 Robert Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    @IBOutlet weak var bubbleHeight: UILabel!
    @IBOutlet weak var bubbleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var bubbleViewHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "This is just a load of text. This is just a load of text. This is just a load of text. This is just a load of text."
        let height = label.heightForView(text: text, width: 323)
        label.text = text
        labelHeightConstraint.constant = height
        bubbleHeightConstraint.constant = height + 8
        bubbleViewHeightConstraint.constant = height
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        
        changeImage("chat_bubble_sent")
        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_sent")
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        bubbleHeight.text = "\(sender.value)"
    }
    
    func getLabelHeight() -> CGFloat {
        return label.bounds.size.height
    }

    @IBAction func sentButtonTapped(_ sender: UIButton) {
        changeImage("chat_bubble_sent")
        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_sent")
    }
    
    @IBAction func receivedButtonTapped(_ sender: UIButton) {
        changeImage("chat_bubble_received")
        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_received")
    }
    
    func changeImage(_ name: String) {
        guard let image = UIImage(named: name) else { return }
        bubbleImageView.image = image
            .resizableImage(withCapInsets: 
                UIEdgeInsetsMake(17, 21, 17, 21),
                                    resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
    }
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        bubbleImageView.tintColor = sender.backgroundColor
    }
}

extension UILabel {
    func heightForView(text:String, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
     label.numberOfLines = 0
     label.lineBreakMode = NSLineBreakMode.byWordWrapping
     label.text = text

     label.sizeToFit()
     return label.frame.height
    }
}
