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
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
}
