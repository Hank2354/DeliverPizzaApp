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
            
            // Save table scroll direction
            if scrollView.lastContentOffset > tableOffset && scrollView.shouldCalculateScrollDirection {

                scrollView.scrollDirection = .down

            } else if scrollView.lastContentOffset < tableOffset && scrollView.shouldCalculateScrollDirection {

                scrollView.scrollDirection = .up

            }

            scrollView.lastContentOffset = tableOffset
            
            
            if viewOffset < allowableOffset || tableOffset < 0 {

                let currentScrollViewOffset    =  mainScrollView.contentOffset.y
                let currentTableViewOffset     =  scrollView.contentOffset.y
                
                let newScrollViewOffset        =  min((currentScrollViewOffset + tableOffset), (allowableOffset))
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        guard let scrollView = scrollView as? FooterTableView else { return }
        
        
        
        guard !decelerate else { return }
        
        scrollView.shouldCalculateScrollDirection = false
        
        
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        guard let scrollView = scrollView as? FooterTableView else { return }
        
        
        
        scrollView.shouldCalculateScrollDirection = false
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        guard let scrollView = scrollView as? FooterTableView else { return }
        
        scrollView.fastScroll = false
        
        scrollView.shouldCalculateScrollDirection = true
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableView = tableView as? FooterTableView else { return }
        
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows
        
        guard !tableView.fastScroll else { return }
        
        let items = footerTableView.items
        
        switch tableView.scrollDirection  {
            
        case .up:
            
            let currentIndex = indexPathsForVisibleRows![1].row
            let currentItem = items[currentIndex]

            presenter?.didScrollToNewCategory(category: currentItem.category)
            
        case .down: break
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableView = tableView as? FooterTableView else { return }
        
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows
        
        guard !tableView.fastScroll else { return }
        
        let items = footerTableView.items

        switch tableView.scrollDirection  {

        case .down:

            let currentIndex = indexPathsForVisibleRows![1].row
            let currentItem = items[currentIndex]

            presenter?.didScrollToNewCategory(category: currentItem.category)

        case .up: break

        }
        
    }
    
}
