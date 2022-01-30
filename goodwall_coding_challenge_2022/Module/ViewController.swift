//
//  ViewController.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test()
    }

    func test() {
//        let imageUrls = ["/images/4628912/4628912-1639866308468-94952.jpg",
//                         "/images/4628912/4628912-1643304472965-15682.jpg",
//                         "/images/4628912/4628912-1639866308468-94952.jpg",
//                         "/images/4628912/4628912-1643304472965-15682.jpg",]
//        
//        mediaInfoView.mediaSlider.configure(with: imageUrls)
//        mediaInfoView.achivmetTitle.text = "Achievement"
        
        
    }
    // MARK: Helping Functions
      // Api Call for Movieslist
      private func getMostPopularMovies() {
          NetworkManager().getGoodWallPosts() { result in
              switch result {
              case .success(let response):
                  print(response)
              case .failure(let error):
                  print(error)
              }
          }
      }
}

