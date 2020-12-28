//
//  ViewController.swift
//  DownloadingImagesFromWeb
//
//  Created by Сергей Голенко on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageFromWeb: UIImageView!
    
    let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Robert_Lewandowski123666.jpg/240px-Robert_Lewandowski123666.jpg")
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //grab picture from saved local documents
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            let restorePath = documentsDirectory + "/bach.jpg"
            imageFromWeb.image = UIImage(contentsOfFile: restorePath)
        }
        
        
        

        //loading picture from web
        let request = NSMutableURLRequest(url:self.url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
        if error != nil {
            print("ERROR = \(error)")
        } else {
            if let data = data{
                if let bachImage = UIImage(data: data){
                         DispatchQueue.main.async {
                            self.imageFromWeb.image = bachImage
                        }
                    //save picture in local Document
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                            if documentsPath.count > 0 {
                                let documentsDirectory = documentsPath[0]
                                   let savePath = documentsDirectory + "/bach.jpg"
                               do{
                                    try bachImage.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: savePath))
                                    } catch {
                                }
                        }
                    }
                }
            }
        }
        task.resume()
    }

}
