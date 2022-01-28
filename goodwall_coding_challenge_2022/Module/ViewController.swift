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
    }

    @IBAction func test(_ sender: Any) {
        getMostPopularMovies()
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

