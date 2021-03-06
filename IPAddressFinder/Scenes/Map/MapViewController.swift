//
//  MapViewController.swift
//  IPAddressFinder
//
//  Created by Siqueira on 29/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var timezoneTitle: UILabel! {
        didSet {
            timezoneTitle.text = String.localized(by: "Timezone")
        }
    }
    @IBOutlet private weak var ispTitle: UILabel! {
        didSet {
            ispTitle.text = String.localized(by: "Isp")
        }
    }
    @IBOutlet private weak var timezone: UILabel!
    @IBOutlet private weak var isp: UILabel!
    @IBOutlet private weak var ipMap: MKMapView!

    // MARK: - Attributes
    private var viewModel: MapViewModelProtocol

    // MARK: - Initializer
    init(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "MapViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView(latitude: viewModel.ipAddress.lat, longitude: viewModel.ipAddress.lon)
        setupUI()
        setupBinds()
    }

    // MARK: - Functions
    private func setupUI() {
        title = String.localized(by: "IPAddressFinder")
    }

    private func setupBinds() {
        timezone.text = viewModel.ipAddress.timezone
        isp.text = viewModel.ipAddress.isp
    }

    private func setupMapView(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let regionRadius: CLLocationDistance = 400
        let location = CLLocation(latitude: latitude, longitude: longitude)

        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        ipMap.setRegion(coordinateRegion, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = viewModel.getTitle()
        ipMap.addAnnotation(annotation)
    }
}
