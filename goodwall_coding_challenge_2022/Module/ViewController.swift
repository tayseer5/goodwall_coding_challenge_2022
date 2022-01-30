//
//  ViewController.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mediaInfoView: MediaInfo!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test()
    }

    func test() {
        let images: [UIImage] = [UIImage(named: "test")!,
                                 UIImage(named: "waseet_app_icon_40")!,
                                 UIImage(named: "test")!,
                                 UIImage(named: "achivment")!,
                                 UIImage(named: "goodWallPlaceHolder")!,
                                 UIImage(named: "waseet_app_icon_40")!]
        
        mediaInfoView.mediaSlider.configure(with: images, view: mediaInfoView)
        mediaInfoView.achivmetTitle.text = "Achievement"
        
        
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

