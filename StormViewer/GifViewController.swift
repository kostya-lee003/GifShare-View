//
//  GifViewController.swift
//  StormViewer
//
//  Created by Kostya Lee on 09/12/21.
//

import UIKit


class GifViewController: UIViewController {
    @IBOutlet weak var gif: UIImageView!
    var gifName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = gifName?.deletingPrefix("gif")
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.gif.image = UIImage.gif(name: gifName!)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.gif.image = nil
        navigationController?.hidesBarsOnTap = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
