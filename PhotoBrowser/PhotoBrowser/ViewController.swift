//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by asokol on 10/12/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos: [Image] = []
    var image: Image?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    //Aloow for animated transitions between the two View Controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let photoViewController = segue.destination as? PhotoViewController
            let collectionCell = sender as! ImageCell
            photoViewController?.image = collectionCell.photo
            
 
            }
        }
    func fetchData() {
        let url = URL(string: "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=daffodil&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            //data required are dictionaries in an array in a dictionary in a dictionary
            let outerDict = json as! [String:Any]
            let innerDict = outerDict["photos"] as! [String:Any]
            let array = innerDict["photo"] as! [[String: Any]]
            self.photos = array.map { Image(dictionary: $0) }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.configure(photo: photos[indexPath.item])
        return cell
        
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let photoViewController = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        photoViewController.image = photos[indexPath.item]
        present(photoViewController, animated: true, completion: nil)
        
        }
}
