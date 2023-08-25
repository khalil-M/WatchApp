//
//  HomeViewController.swift
//  WatchApp
//
//  Created by Khalil Mhelheli on 25/8/2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel: HomeViewControllerViewModel
    let router: HomeViewRouting
    
    private var movies: [Movie] = []
    
    
    init(viewModel: HomeViewControllerViewModel, router: HomeViewRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getData()
        self.movies = viewModel.movies
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        registerCell()
        
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
   
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = viewModel.itemAt(indexPath: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.itemAt(indexPath: indexPath)
        router.routeToMovieDetails(for: movie)
    }
    
    
}
