//
//  ViewController2.swift
//  okayBye
//
//  Created by sudeepa pal on 03/11/23.
//

import UIKit

class ViewController2: UIViewController {
    let button = UIButton(frame: CGRect(x:50,y:750,width:320,height:50))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        
        
        
        
        let bgColouring = UIView()
        bgColouring.backgroundColor = UIColor(red:0, green:0, blue: 0, alpha:0.160)
        
        // Calculate the frame for the gray bacground  to cover half of the screen
        let halfScreenHeight = UIScreen.main.bounds.height / 2
        let halfViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: halfScreenHeight)
        
        ///Setting background colour half
        bgColouring.frame = halfViewFrame
        //displaying the view
        view.addSubview(bgColouring)
        
        //The Underline View---> an underline
//          let myView = UIView(frame: CGRect(x: 50, y: 538, width: 300, height:1))
//          myView.backgroundColor = .black
//          view.addSubview(myView)
      
        //Showing Doctor's and Patient image
        let imageView = UIImageView(frame: CGRect(x: 52, y: 300, width: 300, height: 300))
        imageView.image = UIImage(named: "Photo2")
        view.addSubview(imageView)
        
        
        //Editing on a Button
        //let button = UIButton(frame: CGRect(x:50,y:750,width:320,height:50))
        button.backgroundColor = UIColor(red: 1/255, green: 46/255, blue: 87/255,alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitle("Next", for:.normal)
        button.setTitleColor(.white, for: .normal)
        //button.addTarget(self, action: #selector(secondToThird), for: .touchUpInside)
        view.addSubview(button)
        
        ///Setting Labels for frontview
        let label1 =  UILabel()
        label1.text="Track Every Progress"
        label1.textColor=UIColor(red: 1/255, green: 46/255, blue: 87/255,alpha: 1)
        label1.textAlignment = .center
        label1.font = UIFont.boldSystemFont(ofSize:30)
        label1.frame = CGRect(x: 20, y: halfScreenHeight - 370, width: self.view.bounds.width - 40, height: 40)
        
        
        
        view.addSubview(label1)
        
        //Adding Subtitle
        let subTitle = UILabel()
        subTitle.text = "Pheezee monitors range of\nmotion, EMG biofeedback and\n other session parameters"
        subTitle.textColor = UIColor(red: 1/255, green: 46/255, blue: 87/255,alpha: 1)
        subTitle.frame = CGRect(x: 42, y: halfScreenHeight-350, width:330, height: 200)
        subTitle.textAlignment = .center
        subTitle.numberOfLines=0
        
        view.addSubview(subTitle)
        
        
        ///Adding Dots for navigation
        for i in 0..<4 {
                    let dotSize: CGFloat = 10
                    let dot = UIView()
                    
                    dot.frame = CGRect(x: CGFloat(180 + i * 15), y: halfScreenHeight + 255, width: dotSize, height: dotSize)
                    dot.layer.cornerRadius = dotSize / 2 // Make the view circular
            
                        if i == 1 {
                            dot.backgroundColor = UIColor(red: 1/255, green: 46/255, blue: 87/255,alpha: 1) // The first dot is blue
                        } else {
                            dot.backgroundColor = UIColor(red:0, green:0, blue: 0, alpha:0.160) // Rest of the dots are gray
                        }
            
                     
                    self.view.addSubview(dot)
                }
    }
    
    
//    @objc func secondToThird(){
//        navigationController?.pushViewController(ViewController3(), animated: false)
//        navigationController?.setNavigationBarHidden(true, animated: true)
//        
//        print("third screen")
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
