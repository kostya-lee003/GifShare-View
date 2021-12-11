//
//  ViewController.swift
//  StormViewer
//
//  Created by Kostya Lee on 09/12/21.
//

import UIKit

class ViewController: UITableViewController {
    var gifs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gifs!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("gif") {
                gifs.append(item)
            }
        }
        
        print(gifs)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GifView") as? GifViewController {
            vc.gifName = gifs[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gif", for: indexPath)
        cell.textLabel?.text = gifs[indexPath.row]
        return cell
    }
    
}

