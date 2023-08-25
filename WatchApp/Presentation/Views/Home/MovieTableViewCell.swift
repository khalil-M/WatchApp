//
//  MovieTableViewCell.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var task: URLSessionDataTask?
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.release_date
        let posterPath = movie.poster_path
        guard let posterURL = getImageURL(from: posterPath) else { return }
        
        do {
            if let cachedImage = try OnDiskImageCaching.publicCache.image(url: posterURL) {
                DispatchQueue.main.async {
                    self.movieImage.image = cachedImage
                }
                return
            }
        } catch {
        }
        task = movieImage.downloadImage(fromURL: posterURL)
    }
    
    public func getImageURL(from imagePath: String) -> URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/")!
        let imageSize = "w500"
        
        return baseURL.appendingPathComponent(imageSize).appendingPathComponent(imagePath)
    }
    
    
}

