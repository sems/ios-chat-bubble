//
//  ViewController.swift
//  TutorialMessageBubble
//
//  Created by Robert Kerr on 11/9/17.
//  Copyright © 2017 Robert Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bubbleImageView: UIImageView!
    

    @IBOutlet weak var bubbleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var bubbleViewHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "Et tenetur libero omnis. Qui voluptas mollitia sit modi rerum. Quos doloremque tempora eum. Quia dicta et illum velit esse. Quia dicta quam culpa occaecati aut impedit rerum non. Dicta laborum rerum sunt quis eligendi et harum est. Reprehenderit illum et ut quia. Deserunt totam cupiditate placeat quisquam ipsa consequatur voluptatibus. Culpa deleniti quisquam provident et dolore nesciunt aut qui. Quo laborum alias qui asperiores sit. Qui nobis ratione mollitia assumenda."
        let height = label.heightForView(text: text, width: 315)
        label.text = text
        bubbleViewHeightConstraint.constant = height + 16
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        
        changeImage("chat_bubble_sent")
//        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_sent")
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
