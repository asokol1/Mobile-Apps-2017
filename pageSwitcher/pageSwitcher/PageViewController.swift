//
//  PageViewController.swift
//  pageSwitcher
//
//  Created by asokol on 10/26/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController"){
            self.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        }
        
    }
}
