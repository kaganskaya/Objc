//
//  NewControllerSwift.swift
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/19/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

import Foundation

@objc class NewControllerSwift: ViewController {
    var parentView = ViewController()
    let ns = NetworkService()
    var data:[Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let parent = parent as? UITabBarController, let oneVc = parent.viewControllers?.first as? ViewController {
            parentView = oneVc
        }
    }
}
    
extension NewControllerSwift:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       print(parentView.photosUrls.count)
        return parentView.photosUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        let dataItem = parentView.photosUrls[indexPath.row] as! Photo
             cell.photoImageView?.downloadImage(from:dataItem.imageUrl)
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        var collectionViewSize = collectionView.bounds.size
            collectionViewSize.width = collectionViewSize.width/2
            collectionViewSize.height = collectionViewSize.width
        return collectionViewSize
    }
}
//Mark: need to be fixed

//extension NewControllerSwift:UISearchBarDelegate{
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        ns.getQueryPhotos(searchBar.text) { result in
//            self.parentView.photosUrls = result
//            DispatchQueue.main.sync {
//                self.collectionView?.reloadData()
//
//            }
//        }
//
//    }
//}

