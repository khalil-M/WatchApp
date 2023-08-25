//
//  MovieDetailsViewController.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import UIKit

protocol MovieDetailsDelegate: AnyObject {
    func reloadData()
}

class MovieDetailsViewController: UIViewController, MovieDetailsDelegate {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    let viewModel: MovieDetailsViewControllerViewModel
    
    init(viewModel: MovieDetailsViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMovie()
    }
    
    // notify the Vc to receive the movie
    func reloadData() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.viewModel.getTitle()
            self.yearLabel.text = self.viewModel.getReleaseDate()
            self.descriptionLabel.text = self.viewModel.getDescription()
            guard let imageURL = self.viewModel.getImageURL() else {
                self.movieImage.image = UIImage(systemName: "film")
                return
            }
            
            do {
                if let cachedImage = try OnDiskImageCaching.publicCache.image(url: imageURL) {
                    DispatchQueue.main.async {
                        self.movieImage.image = cachedImage
                    }
                    return
                }
            } catch {
                print(error.localizedDescription)
            }
            _ = self.movieImage.downloadImage(fromURL: imageURL)
        }
        
        
    }
}

