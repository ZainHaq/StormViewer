//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Zain-Ul Haq on 2016-05-04.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {



    @IBOutlet weak var imageView: UIImageView!
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.imageView {
                imageView.image = UIImage(named: detail)
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        navigationController?.hidesBarsOnTap = true
        if let title = self.detailItem {
            self.title = title;
        } else {
            self.title = "Images"
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))

        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        print("viewWillAppear");
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false;
        print("viewWillDisapear");
    }

    func shareTapped() {
        if let image = imageView.image {
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            presentViewController(vc, animated: true, completion: nil)
        } else {
            var ac = UIAlertController(title: "Error", message: "No Image was selected", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Destructive, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            
        }
        
        
        // for facebook
//        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//        vc.setInitialText("Look at this great picture!")
//        vc.addImage(imageView.image!)
//        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
//        presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

