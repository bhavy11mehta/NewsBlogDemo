//
//  PageContentViewController.swift
//  PageViewController
//
//  NewsBlogDemo
//
//  Created by gwl-42 on 22/11/23.


import UIKit
import RxSwift
import RxDataSources

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var lblNews: UILabel!
    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var index: Int = 0
    private let viewModel = PageContentViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.loadMoreData() // Load first page with 20 items
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgHeader.image = UIImage(named: NewsSet.data[index].image)
        lblNews.text = NewsSet.data[index].title
        sizeHeaderToFit()
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "YourCellIdentifier")
        
        // Configure the table view using RxDataSources
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<Void, Item>>(
            configureCell: { _, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.text = item.name
                
                return cell
            }
        )
        
        viewModel.items
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.contentOffset
            .map { [weak self] contentOffset in
                guard let self = self else { return false }
                let offsetY = contentOffset.y
                let contentHeight = self.tableView.contentSize.height
                let screenHeight = self.tableView.bounds.size.height
                return offsetY > contentHeight - screenHeight
            }
            .distinctUntilChanged()
            .filter { $0 }
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel.loadMoreData()
            })
            .disposed(by: disposeBag)
    }
    
    // manage table view header height
    func sizeHeaderToFit() {
        let headerView = tableView.tableHeaderView!
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame
        
        tableView.tableHeaderView = headerView
    }
}

