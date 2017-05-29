//
//  ViewController.swift
//  ImagePickerController
//
//  Created by iFlame on 5/29/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate , UIImagePickerControllerDelegate  {
    
    @IBOutlet var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.backgroundColor = UIColor .lightGray
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override var prefersStatusBarHidden: Bool{
        return false    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myImage.backgroundColor = UIColor .red
        
        let alert = UIAlertController()
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default, handler: { (action) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction.init(title: "Photo", style: .default, handler: { (UIAlertAction) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImage.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
