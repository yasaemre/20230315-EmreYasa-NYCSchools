//
//  SchoolVC.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//


import UIKit

class SchoolVC: UIViewController {
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(NYCSSchoolTableViewCell.self, forCellReuseIdentifier: NYCSSchoolTableViewCell.reusId)
        return tableView
    }()
    
    private let searchVC = UISearchController(searchResultsController: nil)
    private var isFiltered = false
    private var viewModels = [NYCSSchoolCellVM]()
    private var filteredViewModels = [NYCSSchoolCellVM]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchSchools()
        createSearchBar()
    }
    
    private func setUpTableView() {
        title = "NYC High Schools"
        view.backgroundColor = .systemBackground
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createSearchBar() {
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
}

extension SchoolVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered {
            return filteredViewModels.count
        } else {
            return viewModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NYCSSchoolTableViewCell.reusId, for: indexPath) as? NYCSSchoolTableViewCell else {
            fatalError()
        }
        if isFiltered {
            cell.configure(with: filteredViewModels[indexPath.row])
        } else {
            cell.configure(with: viewModels[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = SchoolDetailVC()
        self.navigationController?.pushViewController(detailVC, animated: true)
        if isFiltered {
            detailVC.detailView.schoolId = filteredViewModels[indexPath.row].idSchool
        } else {
            detailVC.detailView.schoolId = viewModels[indexPath.row].idSchool
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 5
    }
}

extension SchoolVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltered = false
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        
        searchedSchools(search:text)
    }
    
    private func fetchSchools() {
        APICaller.shared.fetchSchools { [weak self] result in
            switch result {
            case.success(let schools):
                self?.viewModels = schools.compactMap({
                    NYCSSchoolCellVM (
                        schools: $0
                    )
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func searchedSchools(search:String) {
        APICaller.shared.searchedSchools (with: search) { [weak self] result in
            switch result {
            case.success(let schools):
                self?.isFiltered = true
                self?.filteredViewModels = schools.compactMap({
                    NYCSSchoolCellVM(schools: $0)
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.searchVC.dismiss(animated: true, completion: nil)
                }
            case .failure( _ ):
                fatalError()
            }
        }
    }
}
