//
//  CustomImageView.swift
//  IntermediateTraining
//
//  Created by Mina Shehata on 11/1/18.
//  Copyright © 2018 Mina Shehata. All rights reserved.
//

import UIKit

let imageCashe = NSCache<NSURL , UIImage>()

class CustomImageView: UIImageView {
    var imageUrl: URL?
    func loadProfileImageWithUrl(url: URL){
        image = nil
        imageUrl = url
        if let image = imageCashe.object(forKey: url as NSURL){
            self.image = image
            return
        }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            do {
                let imageData = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let downloadesImage = UIImage(data: imageData), url == self?.imageUrl {
                        imageCashe.setObject(downloadesImage, forKey: url as NSURL)
                        self?.image = downloadesImage
                    }
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
}

