//
//  CleanSwiftViewController.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftViewControllerInput {
    func displayList(_ viewModel: CleanSwift.MapInfos.ViewModel)
}

protocol CleanSwiftViewControllerOutput {
    func fetchDataStore(_ request: CleanSwift.MapInfos.Request)
}

class CleanSwiftViewController: UIViewController {
    var output: CleanSwiftViewControllerOutput?
    var router: (NSObjectProtocol & CleanSwiftRoutingLogic & CleanSwiftDataPassing)?
    let tableViewDelegate = CleanSwiftTableViewDelegate()
    let tableViewDatasource = CleanSwiftTableViewDatasource()
    private lazy var tableView: UITableView = self.createTableView()
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        CleanSwiftConfigurator.shared.configure(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CleanSwiftConfigurator.shared.configure(self)
    }

    private func createTableView() -> UITableView {
        let view = UITableView()
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: UIScreen.main.bounds.width,
                            height: self.view.bounds.height)
        view.delegate = tableViewDelegate
        view.dataSource = tableViewDatasource
        view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return view
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Capital"
        view.addSubview(tableView)
        fetchDataStore()
    }
    
    // MARK: Event Handler
    
    private func doSomethingOnLoad() {
        
    }
    
    private func doSomething(request: CleanSwift.MapInfos.Request) {
        
    }

    private func fetchDataStore() {
        let request = CleanSwift.MapInfos.Request()
        output?.fetchDataStore(request)
    }
}
// MARK: - CleanSwiftViewControllerInput
extension CleanSwiftViewController: CleanSwiftViewControllerInput {
    func displayList(_ viewModel: CleanSwift.MapInfos.ViewModel) {
        tableViewDatasource.dataStore = viewModel.infos
        tableView.reloadData()
    }
}
