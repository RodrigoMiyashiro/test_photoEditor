//
//  ViewController.swift
//  Test_PhotoEditor
//
//  Created by Rodrigo Miyashiro on 03/04/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import iOSPhotoEditor

class ViewController: UIViewController
{
    @IBOutlet weak var imgBackground: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func openEditor(_ sender: UIButton)
    {
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.sourceType = .photoLibrary
//        present(picker, animated: true, completion: nil)
        
        showEditor()
    }
    
    
    private func showEditor()
    {
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        
        photoEditor.photoEditorDelegate = self
        
        photoEditor.image = imgBackground.image ?? UIImage(named: "img_test2")
        
        //Colors for drawing and Text, If not set default values will be used
        photoEditor.colors = [.red,.blue,.green]
        
        //Stickers that the user will choose from to add on the image
        //        for i in 0...10 {
        //            photoEditor.stickers.append(UIImage(named: i.description )!)
        //        }
        photoEditor.stickers.append(UIImage(named: "img_red_rectangle")!)
        
        //To hide controls - array of enum control
        //        photoEditor.hiddenControls = [.crop, .draw, .share]
        
        present(photoEditor, animated: true, completion: nil)
    }

}

extension ViewController: PhotoEditorDelegate {
    
    func doneEditing(image: UIImage)
    {
        self.imgBackground.image = image
        print("Done")
    }
    
    func canceledEditing()
    {
        print("Canceled")
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        picker.dismiss(animated: true, completion: nil)
        
        
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        
        photoEditor.photoEditorDelegate = self
        
        photoEditor.image = image
        
        //Colors for drawing and Text, If not set default values will be used
        photoEditor.colors = [.red,.blue,.green]
        
        //Stickers that the user will choose from to add on the image
//        for i in 0...10 {
//            photoEditor.stickers.append(UIImage(named: i.description )!)
//        }
        photoEditor.stickers.append(UIImage(named: "img_red_rectangle")!)
        
        //To hide controls - array of enum control
        //        photoEditor.hiddenControls = [.crop, .draw, .share]
        
        present(photoEditor, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
