//
//  CameraController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/27/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit
import Vision

class CameraController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
         imageView.image = userPickedImage
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
            }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    

}
