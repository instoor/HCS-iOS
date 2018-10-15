//
//  MemberListViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

final class MemberListViewController: UIViewController {
    @IBOutlet weak var memberListTableView: UITableView!
    
    lazy var viewModel: MemberListViewModel = {
        return MemberListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init the static view
        initView()
        
        // init view model
        initVM()
    }
    func initView() {
        
        self.title = "Memeber List"
//        memberListTableView.estimatedRowHeight = 64
//        memberListTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func initVM() {
        viewModel.initFetch()
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.memberListTableView.reloadData()
            }
        }
    }
}

extension MemberListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberListTableViewCell", for: indexPath) as? MemberListTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
         cell.selectionStyle = .none
         let cellVM = viewModel.getCellViewModel( at: indexPath )
         cell.configureChanneListCell(memberListCellVM: cellVM)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memberDetailVc = MemberDetailViewController.instantiate(storyboardName: "Contact", storyboardId: "MemberDetailViewController")
        memberDetailVc.memberListModel = viewModel.getCellViewModel( at: indexPath )
        self.navigationController?.pushViewController(memberDetailVc, animated: true)
    }
}
