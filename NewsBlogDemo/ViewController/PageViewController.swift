//
//  PageViewController.swift
//  PageViewController
//  NewsBlogDemo
//
//  Created by gwl-42 on 22/11/23.


import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var pages: Int = 4
    var views = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        for i in 0..<pages {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as? PageContentViewController {
                vc.index = i
                views.append(vc)
            }
        }
        self.setViewControllers([views[0]], direction: .forward , animated: false, completion: nil)
    }
    
    // PageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index + 1
        return idx < views.count ? views[idx] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index - 1
        return idx >= 0 ? views[idx] : nil
    }
    
    //     to hide the page control that's automatically created by UIPageViewController, comment out the 2 below functions
    //    func presentationCount(for pageViewController: UIPageViewController) -> Int {
    //        return views.count
    //    }
    //
    //    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    //        return 0
    //    }
    
    
}
