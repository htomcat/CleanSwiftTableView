//
//  CleanSwiftRouter.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

@objc protocol CleanSwiftRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CleanSwiftDataPassing
{
  var dataStore: CleanSwiftDataStore? { get }
}

class CleanSwiftRouter: NSObject, CleanSwiftRoutingLogic, CleanSwiftDataPassing
{
  weak var viewController: CleanSwiftViewController?
  var dataStore: CleanSwiftDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: CleanSwiftViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: CleanSwiftDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
