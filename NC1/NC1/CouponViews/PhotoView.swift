//////
//////  PhotoView.swift
//////  NC1
//////
//////  Created by Hyorim Nam on 2022/05/05.
//////
////
//import Photos
//import PhotosUI
//import UIKit
//import SwiftUI
////import SwiftUI
//
////class PhotoViewController: UIViewController{
////    @IBOutlet weak var imageView: UIImageView! // <- storyboard 연결임
////    @IBAction func presentPicker(_ sender: Any){
////        var configuration = PHPickerConfiguration()
////        configuration.filter = .images
////
////        let picker = PHPickerViewController(configuration: configuration)
////        picker.delegate = self
////        present(picker, animated: true)
////    }
////}
//
//class ViewController: UIViewController, PHPickerViewControllerDelegate{
//    var configuration = PHPickerConfiguration()
//
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]){
//        dismiss(animated: true)
//
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = self
//        self.present(picker, animated: true, completion: nil)
////        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
////            let previousImage = imageView?.image
////            itemProvider.canLoadObject(ofClass: UIImage.self){
////                [weak self] image, error in
////                DispatchQueue.main.async {
////                    guard let self = self, let image = image as? UIImage, self.imageView.image == previousImage else {return}
////                    self.imageView.image = image
////                }
////            }
////        }
//    }
//}
//
//struct PhotoView: View{
//    @Binding var nav: Bool
//
//    var body: some View{
//        NavigationView{
//            ZStack{
//                NavigationLink(destination: InsertionView(nav: $nav), isActive: $nav, label: {EmptyView()})
//
//                Text("d")
//            }
//        }
//    }
//}
////struct PhotoController{
////    var configuration = PHPickerConfiguration()
////
////    configuration.selectionLimit = 10
////    configuration.filter = .images
////
////    let picker = PHPickerViewController(configuration: configuration)
////
////
////}
//
////
////class MyCell: UICollectionView{
////    private let imageView = UIImageView()
////
////    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout){
////        super.init(frame: frame)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError()
////    }
////
////    //11:36
////    //https://www.youtube.com/watch?v=LlZUQW3Zj9c
////}
////
////class ViewController: UIViewController, PHPickerViewControllerDelegate{
////
////    private let collectionView: UICollectionView = {
////        let layout = UICollectionViewFlowLayout()
////        let c = UICollectionView(frame:.zero, collectionViewLayout: layout)
////        c.register(MyCell.self, forCellWithReuseIdentifier: "cell")
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "title phpicker"
////        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
////    }
////    @objc private func didTapAdd(){
////        var config = PHPickerConfiguration(photoLibrary: .shared()) //다른 디렉토리 만들어서 하기?
////        config.selectionLimit = 3
////        config.filter = .images
////        let vc = PHPickerViewController(configuration: config)
////        vc.delegate = self
////        present(vc, animated: true)
////    }
////    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]){
////        picker.dismiss(animated: true, completion: nil)
////
////        results.forEach{result in
////            result.itemProvider.loadObject(ofClass: UIImage.self){ reading, error in
////                guard let image = reading as? UIImage, error == nil else{
////                    return
////                }
////                print(image)
////            }
////        }
////    }
////}
