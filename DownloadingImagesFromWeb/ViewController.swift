//
//  ViewController.swift
//  DownloadingImagesFromWeb
//
//  Created by Сергей Голенко on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageFromWeb: UIImageView!
    
    let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Registan_Complex_%288145371129%29.jpg/240px-Registan_Complex_%288145371129%29.jpg")
    


    override func viewDidLoad() {
        super.viewDidLoad()

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
                     
                        
                    }
                }
                
            }
            
        }
        task.resume()
    }


}

