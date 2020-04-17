//
//  ViewController.swift
//  MemeApp
//
//  Created by Nayyer Ali on 10/4/19.
//  Copyright © 2019 Nayyer Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    @IBOutlet weak var topTitle: UITextField!
    
    
    @IBOutlet weak var bottomTitle: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func captureBtn(_ sender: Any) {
        
        let image = self.takeScreenshot()
        self.performSegue(withIdentifier: "ToShow", sender: nil)
    }
    
    
    @IBAction func cameraBtn(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func photoGallertBtn(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
        
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        backgroundImage.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContext(self.backgroundImage.frame.size)
        view.drawHierarchy(in: self.backgroundImage.frame, afterScreenUpdates: true)
        
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()!
        return screenShot
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToShow" {
            let destination = segue.destination as! ShowViewController
            destination.createdMemeImage = sender as? UIImage
        }
    }

}

