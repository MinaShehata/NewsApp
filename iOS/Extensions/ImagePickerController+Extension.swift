//
//  ImagePickerController+Extension.swift
//  Template-iOS
//
//  Created by Mina Shehata on 1/3/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import MobileCoreServices
import CFAlertViewController

extension UIViewController
{
    // MARK:- CFAlert ALERT
    public func OpenCFAlertImagePicker(title: String = "", message: String = "", with imagePicker: UIImagePickerController, sourceRect: UIButton) {
        
        var cameraAction: CFAlertAction?
        var photoLibraryAction: CFAlertAction?
        
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            cameraAction = createCFAction(title: "Use Camera", style: .Default, backgroundColor: .clear, handler: { (action) in
                self.checkCamera(imagePicker: imagePicker, sourceRect: sourceRect)
            })
        }
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            photoLibraryAction = createCFAction(title: "Use Photo Library", style: .Default, backgroundColor: .clear, handler: { (action) in
                self.checkCamera(imagePicker: imagePicker, sourceRect: sourceRect)
            })
        }
        
        let cancelAlert = createCFAction(title: "Cancel", style: .Cancel, backgroundColor: .lightGray, handler: nil)
        CFAlert(title: title, titleColor: .black, message: message, messageColor: .darkGray, textAlignment: .center, preferredStyle: .actionSheet, headerView: nil, footerView: nil, handler: nil, actions: cameraAction, photoLibraryAction, cancelAlert)
    }
    
    // MARK:- REGULAR ALERT
    public func openPickerController(title: String = "", message: String = "", with imagePicker: UIImagePickerController, sourceRect: UIButton) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let cameraAction = UIAlertAction(title: "Use Camera", style: .default) { (action) in
                self.checkCamera(imagePicker: imagePicker, sourceRect: sourceRect)
            }
            alertController.addAction(cameraAction)
        }
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            let photoLibraryAction = UIAlertAction(title: "Use Photo Library", style: .default) { (action) in
               self.checkPhotoLibrary(imagePicker: imagePicker, sourceRect: sourceRect)
            }
            alertController.addAction(photoLibraryAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sourceRect
        alertController.popoverPresentationController?.sourceRect = sourceRect.bounds
        present(alertController, animated: true, completion: nil)
    }
    
    private func checkCamera(imagePicker: UIImagePickerController, sourceRect: UIButton) {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if (status == .authorized) {
            self.displayPicker(imagePicker: imagePicker, of: .camera)
        }
        if (status == .restricted) {
            self.handleRestricted(sourceRect: sourceRect)
        }
        if (status == .denied) {
            self.handleDenied(sourceRect: sourceRect)
        }
        if (status == .notDetermined) {
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                if granted {
                    self.displayPicker(imagePicker: imagePicker, of: .camera)
                }
            })
        }
    }
    
    private func checkPhotoLibrary(imagePicker: UIImagePickerController, sourceRect: UIButton) {
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .authorized) {
            self.displayPicker(imagePicker: imagePicker, of: .photoLibrary)
        }
        if (status == .restricted) {
            self.handleRestricted(sourceRect: sourceRect)
        }
        if (status == .denied) {
            self.handleDenied(sourceRect: sourceRect)
        }
        if (status == .notDetermined) {
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized
                {
                    self.displayPicker(imagePicker: imagePicker, of: .photoLibrary)
                }
            })
        }
    }
    //MARK:- private functions
    private func handleDenied(sourceRect: UIButton) {
        let alertController = UIAlertController(title: "Media Access Denied", message: "trips doesn't have access to use your device's media. please update you settings", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Go To Settings", style: .default) { (action) in
            DispatchQueue.main.async {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.popoverPresentationController?.sourceRect = sourceRect.bounds
        alertController.popoverPresentationController?.sourceView = sourceRect
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    private func handleRestricted(sourceRect: UIButton) {
        let alertController = UIAlertController(title: "Media Access Denied", message: "This device is restricted from accessing any media at this time", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.popoverPresentationController?.sourceRect = sourceRect.bounds
        alertController.popoverPresentationController?.sourceView = sourceRect
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    private func displayPicker(imagePicker: UIImagePickerController, of type: UIImagePickerController.SourceType, mediaTypes: [String] = []) {
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: type)!
        imagePicker.mediaTypes = mediaTypes // the default value is kUTTypeImage ..
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        DispatchQueue.main.async {
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}



