//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Ислам on 26.11.2024.
//

import UIKit
import WebKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    
    let videoLinks = [
        "https://www.youtube.com/embed/dQw4w9WgXcQ",
        "https://www.youtube.com/embed/3JZ_D3ELwOQ",
        "https://www.youtube.com/embed/V-_O7nl0Ii0"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadVideo(url: videoLinks[0])
    }
    
    func loadVideo(url: String) {
        if let videoURL = URL(string: url) {
            webView.load(URLRequest(url: videoURL))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        cell.textLabel?.text = "Video \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadVideo(url: videoLinks[indexPath.row])
    }
}
