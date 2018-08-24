//
//  ViewController.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/20.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var filteredImageView: UIImageView!
    @IBOutlet weak var filterButton: UIButton!
    
    var imageFilter: ImageFilter = ImageFilter()
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        originalImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loadImage(_:))))
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
                
        authorizePhotoLibraryUsage()
        
        let filters = Filters.shared

        filters.categories().forEach { (category) in
            print(category)
            filters.filters(inCategory: category)?.forEach({ (filter) in
                print("  \(String(describing: filter.filterName()))")
            })
        }
        
        imageFilter.filter = filters.filter(name: "CIMedianFilter")
        
        NotificationCenter.default.addObserver(self, selector: #selector(filterSelected(_:)), name: FilterController.FilterSelected, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFilterButtonLabel()
    }

    func filterImage() {
        guard let image = originalImageView.image else { return }
        let filteredImage = imageFilter.filter(image)
        filteredImageView.image = filteredImage
    }
    
    @IBAction func savePhoto(_ sender: UIButton) {
        guard let image = filteredImageView.image else { return }
        guard let imageData: Data = UIImageJPEGRepresentation(image, 1.0) else { return }
        PHPhotoLibrary.shared().performChanges({
            let creationRequest = PHAssetCreationRequest.forAsset()
            creationRequest.addResource(with: .photo, data: imageData, options: nil)
        }) { (success, failure) in
            if success {
                print("Photo saved from video")
            } else {
                print("Could not save photo from video: \(String(describing: failure))")
            }
        }
    }
    
    @IBAction func openFilterController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FilterVC") as! FilterController
        self.present(vc, animated: false, completion: {
            vc.selectedFilter = self.imageFilter.filter
        })
    }
    
    @objc func loadImage(_ sender: UITapGestureRecognizer) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    private func updateFilterButtonLabel() {
        guard let filter = imageFilter.filter else {
            filterButton.setTitle("No filter. Tap to choose.", for: .normal)
            return
        }
        filterButton.setTitle(filter.filterName(), for: .normal)
    }
    
    private func authorizePhotoLibraryUsage() {
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization { (status) in
            }
        }
    }

    @objc func filterSelected(_ notif: Notification) {
        let info = notif.userInfo
        let filter = info!["selectedFilter"] as! Filter
        imageFilter.filter = filter
        updateFilterButtonLabel()
        filterImage()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        originalImageView.image = image
        dismiss(animated: true, completion: nil)
        filterImage()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
