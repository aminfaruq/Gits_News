//
//  HomeController.swift
//  Gits News
//
//  Created by Amin faruq on 16/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire
import SwiftyJSON
import iCarousel
import SDWebImage

class HomeController: UIViewController{
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    @IBOutlet weak var collectionSlider: UICollectionView!
    
    
    
    
    let collectionData = ["Sport","Politics","Tech"]
    
    @IBOutlet weak var tbViewBerita: UITableView!
    var newsModel: [News] = []
    var items: [Int] = []


    @IBOutlet weak var CollectionView: UICollectionView!
    
    
     let NEWS_URL =  "https://newsapi.org/v2/top-headlines?country=id&category=entertainment&apiKey=45edc79fad7c497f957b65c3a95d605f"
    
    
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    
    let imageData = ["https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080","https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080","https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        fetchBerita(url: NEWS_URL)
        registerCell()
        delegateDatasource()
       
        
        let popupView = UIView()
        popupView.backgroundColor = .red
        
    }
    
    func registerCell(){
        self.tbViewBerita.register(UINib(nibName: "TableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "TableViewCell")
        
        
        self.CollectionView.register(UINib(nibName: "CollectionViewCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.collectionSlider.register(UINib(nibName: "CollectionSlider", bundle: self.nibBundle), forCellWithReuseIdentifier: "CollectionSlider")
    }
    
    func delegateDatasource(){
        CollectionView.delegate = self
        CollectionView.dataSource = self
        collectionSlider.delegate = self
        collectionSlider.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    func fetchBerita(url : String){
        Alamofire.request(url).responseJSON { (response) in
            let newsJSON : JSON = JSON(response.result.value!)
            self.updateNews(json: newsJSON)
        }
    }
    
    func updateNews(json : JSON){
        for articleJSON in 0 ..< json["articles"].count{
            
            let news = News()
            
            let title = json["articles"][articleJSON]["title"].string
            let newsDescription = json["articles"][articleJSON]["description"].string
            let imgURL = json["articles"][articleJSON]["urlToImage"].string
            let url = json["articles"][articleJSON]["url"].string
            let date = json["articles"][articleJSON]["publishedAt"].string
            
            news.date = date
            news.url = url
            news.judul = title
            news.deskripsi = newsDescription
            news.imgUrl = imgURL
            
            self.newsModel.append(news)
            
        }
        self.tbViewBerita.reloadData()
    }
    
    
//    @objc func didTap() {
//        let fullScreenController = slideShow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
//    }
    

}

//extension HomeController : ImageSlideshowDelegate {
//    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
//        print("current page:", page)
//    }
//    
//    
//    
//    
//}

//
extension HomeController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.newsModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        
        cell.lbTitle.text = self.newsModel[indexPath.item].judul
        cell.lbDate.text = self.newsModel[indexPath.item].date
        cell.imgNews.downloadImage(from: (self.newsModel[indexPath.item].imgUrl)!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard(name: "Detail", bundle: nil)

        
        let toNewsDetail = story.instantiateViewController(withIdentifier: "newsDetail") as! DetailViewController

        //toNewsDetail.urlWeb = self.newsModel[indexPath.item].url!
        toNewsDetail.gambarBerita = self.newsModel[indexPath.item].imgUrl
        toNewsDetail.judulBerita = self.newsModel[indexPath.item].judul
        toNewsDetail.detailBerita = self.newsModel[indexPath.item].deskripsi

        tableView.deselectRow(at: indexPath, animated: true)

        show(toNewsDetail, sender: self)

        
    }
    
    
    
}

extension UIImageView {
    func downloadImage(from url : String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            
            if error != nil{
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}


extension HomeController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == CollectionView{
            return collectionData.count
            
        }else{
            return imageData.count
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == CollectionView{
            let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            collection.labelTitle.text = self.collectionData[indexPath.item]
            
            
            return collection
        }else{
            let collection2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionSlider", for: indexPath) as! CollectionSlider
            
            collection2.imgSlider.sd_setImage(with: URL(string: imageData[indexPath.item]), placeholderImage: UIImage(named: "star1"))
            
            collection2.lbSlider.text = self.collectionData[indexPath.item]
            
            return collection2
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if collectionView == CollectionView{
            return CGSize(width: 140.0, height: 60.0)

        }else{
            return CGSize(width: 300.0, height: 200.0)
        }
    }
    
    
    
}



