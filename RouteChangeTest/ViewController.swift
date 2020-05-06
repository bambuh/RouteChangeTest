//
//  ViewController.swift
//  RouteChangeTest
//
//  Created by Oleksii Bukhantsov on 06.05.2020.
//  Copyright © 2020 Oleksii Bukhantsov. All rights reserved.
//

import UIKit
import AVFoundation
import ExternalAccessory


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord)
        try? audioSession.setMode(.voiceChat)
        try? audioSession.setActive(true)

        NotificationCenter.default.addObserver(
            forName: AVAudioSession.routeChangeNotification,
            object: nil,
            queue: nil,
            using: routeChanged(notif:) )

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.EAAccessoryDidConnect,
            object: nil,
            queue: nil,
            using: accessoryConnected(notif:) )

        EAAccessoryManager.shared().registerForLocalNotifications()
    }

    @objc private func routeChanged(notif: Notification) {
        print(#function, notif)
    }

    @objc private func accessoryConnected(notif: Notification) {
        print(#function, notif)
    }

}
