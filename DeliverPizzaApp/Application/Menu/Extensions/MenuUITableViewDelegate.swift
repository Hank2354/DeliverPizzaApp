//
//  MenuUITableViewDelegate.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

extension MenuViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Get headerViewHeight and calsulate allowable y offset
        let headerViewHeight =  headerView.bounds.height
        let allowableOffset  =  headerViewHeight - CGFloat(70)
        
        if let scrollView    = scrollView as? FooterTableView {
            
            // get table and view offsets
            let tableOffset  = scrollView.contentOffset.y
            let viewOffset   = mainScrollView.contentOffset.y
            
            if viewOffset < allowableOffset || tableOffset < 0 {

                let currentScrollViewOffset    =  mainScrollView.contentOffset.y
                let currentTableViewOffset     =  scrollView.contentOffset.y
                
                let newScrollViewOffset        =  min((currentScrollViewOffset + tableOffset), (allowableOffset + 1))
                let newTableViewOffset         =  min((currentTableViewOffset - tableOffset), allowableOffset)
                
                scrollView.contentOffset.y     =  newTableViewOffset
                mainScrollView.contentOffset.y =  newScrollViewOffset

            }
            
            // Show header menu if user want
            if viewOffset < -10 || tableOffset < -1 {
                
                mainScrollView  .setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                footerTableView .isScrollEnabled = false
                footerTableView .isScrollEnabled = true
                
            }
            
        }
    }
}
