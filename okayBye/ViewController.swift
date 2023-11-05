//
//  ViewController.swift
//  okayBye
//
//  Created by sudeepa pal on 03/11/23.
//

import UIKit

class ViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var nextButton = UIButton()
    let initialPage = 0
    
    //for animations
    var pagecontroller : UIPageViewController!
    var nextButtonTopAnchor: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        style()
        layout()
        
        
        
        
    }


}

extension ViewController {
    func setup(){
        pagecontroller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pagecontroller.dataSource = self
        pagecontroller.delegate = self
        
                
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        
        
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()
        let page4 = ViewController4()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        pagecontroller.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
      
        
        
        addChild(pagecontroller)
       
        
        view.addSubview(pagecontroller.view)
        
        pagecontroller.didMove(toParent: self)
        
        pagecontroller.view.frame = view.bounds
        
       // setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        
    }
    
    
    func style(){
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        
        nextButton = UIButton(frame: CGRect(x: 50, y: 850, width: 320, height: 50))
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(red: 1/255, green: 46/255, blue: 87/255,alpha: 1)
        nextButton.layer.cornerRadius = 25
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        
    }

    func layout(){
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 1),
        ])
        
        
        
    }
    
   
    
    
}

extension ViewController{
    @objc func pageControlTapped(_ sender: UIPageControl){
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: false, completion: nil)
    }
    
    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        print("Button Tapped")
        
    }
}


//Data Source

extension ViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
            
        }
        if currentIndex > 0{
            return pages[currentIndex - 1]
        }else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController)else{
            return nil
        }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        }else{
            return nil
        }
    }
    
    
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else {
            return
        }
        pageControl.currentPage = currentIndex
        
    }
}


extension UIPageViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
}


