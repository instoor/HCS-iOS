//
//  ChannelListViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 08/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController {
    
    fileprivate var idleChannelListArray: [Channel]?
    fileprivate var activeChannelListArray: [Channel]?
    
    lazy var viewModel: ChannelListViewModel = {
        return ChannelListViewModel()
    }()
    
    let screenSize = UIScreen.main.bounds
    private var isNetworkAvailable: Bool = false
    
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet private weak var icFabButton: UIButton!
    @IBOutlet private weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var syncWithServerView: UIView!
    @IBOutlet private weak var syncAnimationImageView: UIImageView!
    @IBOutlet private weak var syncWithServerButton: UIButton!
    @IBOutlet private weak var updatingLabel: UILabel!
    @IBOutlet private weak var updatingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelCollectionView.register(UINib.init(nibName: "ChannelCell", bundle: nil), forCellWithReuseIdentifier: "ChannelCell" )
        channelCollectionView.register(UINib.init(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        initViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatingView.isHidden = true
        syncWithServerView.isHidden = true
        loadingActivityIndicator.isHidden = true
        syncAnimationImageView.isHidden = true
        
        setupsyncWithServerButton()
        setupICFabButtons()
        
        if (!isNetworkAvailable) {
            channelCollectionView.isHidden = true
            icFabButton.isHidden = true
            syncWithServerView.isHidden = false
        }
        
    }
}

private extension ChannelListViewController {
    func initViewModel() {
        viewModel.initFetch()
        viewModel.reloadCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.channelCollectionView.reloadData()
            }
        }
    }
    
    private func setupsyncWithServerButton() {
        syncWithServerButton.layer.borderWidth = 1
        syncWithServerButton.layer.borderColor = UIColor.black.cgColor
        syncWithServerButton.layer.masksToBounds = true
    }
    
    private func setupICFabButtons() {
        icFabButton.setTitle("IC", for: .normal)
        icFabButton.backgroundColor = UIColor.darkGray
        icFabButton.layer.cornerRadius = 27
        icFabButton.layer.masksToBounds = true
        icFabButton.layer.zPosition = 1
    }
    
    @IBAction func syncWithServerButtonAction(_ sender: Any) {
        syncWithServerView.isHidden = true
        channelCollectionView.isHidden = true
        updatingView.isHidden = false
        loadingActivityIndicator.isHidden = false
        loadingActivityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // your code here
            self.isNetworkAvailable = true
            self.loadingActivityIndicator.stopAnimating()
            self.updatingView.isHidden = true
            self.syncWithServerView.isHidden = true
            self.channelCollectionView.isHidden = false
            self.icFabButton.isHidden = false
        }
    }
    
    @IBAction func icFabButtonAction(_ sender: Any) {
        let contactSearchViewContoller = ContactSearchViewController.instantiateFromStoryboard("Contact", storyboardId: "ContactSearchViewController")
        navigationController?.pushViewController(contactSearchViewContoller, animated: true)
    }
}

extension ChannelListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as? SectionHeaderCell else {
            return UICollectionReusableView()
        }
        view.headerNameLabel.text = indexPath.section == 0 ? "Active" : "Idle"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: screenSize.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.numberOfActiveChannelCells
        default:
            return viewModel.numberOfIdleChannelCells
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCell", for: indexPath) as? ChannelCell else {
            fatalError("Cell does not exist in storyboard")
        }
        
        cell.separatorView.isHidden = true
        switch indexPath.section {
        case 0:
            cell.channel = viewModel.getActiveChannelCellViewModel(at: indexPath)
            cell.countStatusLabel.isHidden = true
            cell.channelIconImage.isHidden = true
            
        default:
            cell.channel = viewModel.getIdleChannelCellViewModel(at: indexPath)
            cell.separatorView.isHidden = false
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let conversationViewController = ConversationViewController.instantiate(storyboardName: "Channel", storyboardId: "ConversationViewController")
        navigationController?.pushViewController(conversationViewController, animated: true)
    }

}
