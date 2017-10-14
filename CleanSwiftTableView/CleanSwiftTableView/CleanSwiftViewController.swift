//
//  CleanSwiftViewController.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftDisplayLogic: class {
    func displayList(viewModel: CleanSwift.MapInfos.ViewModel)
}

class CleanSwiftViewController: UIViewController, CleanSwiftDisplayLogic {
    var interactor: CleanSwiftBusinessLogic?
    var router: (NSObjectProtocol & CleanSwiftRoutingLogic & CleanSwiftDataPassing)?
    let tableViewDelegate = CleanSwiftTableViewDelegate()
    let tableViewDatasource = CleanSwiftTableViewDatasource()
    private lazy var tableView: UITableView = self.createTableView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CleanSwiftInteractor()
        let presenter = CleanSwiftPresenter()
        let router = CleanSwiftRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        tableViewDelegate.router = router
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
    
    // MARK: Do something
        
    func fetchDataStore() {
        let request = CleanSwift.MapInfos.Request()
        interactor?.fetchDataStore(request: request)
    }
    
    func displayList(viewModel: CleanSwift.MapInfos.ViewModel) {
        tableViewDatasource.dataStore = viewModel.infos
        tableView.reloadData()
    }
}
