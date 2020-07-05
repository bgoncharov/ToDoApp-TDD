//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 7/5/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    var task: Task!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.descriprion
        self.locationLabel.text = task.location?.name
    }
}
