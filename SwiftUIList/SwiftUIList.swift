//
//  SwiftUIList.swift
//  SwiftUIList
//
//  Created by Shimaa Nagah on 11/12/19.
//  Copyright © 2019 Code95. All rights reserved.
//

import SwiftUI

protocol SwiftUIListDelegate {
    func navigateToDestination(item:Any) -> AnyView
    func displayView(item:Any) -> AnyView
    func loadMore()
}

struct SwiftUIList<Data>:View where Data:RandomAccessCollection, Data.Element:Hashable {
    
    // MARK: Properties
    var scrollDirection:Axis.Set
    var showIndicator:Bool
    var specingBetweenItems:CGFloat
    var data:[Data.Element]
    var delegate:SwiftUIListDelegate
    let scaleX = Locale.current.languageCode == "en" ? CGFloat(1) : CGFloat(-1)
    
    // MARK: Initialization
    init(scrollDirection:Axis.Set, showIndicator:Bool, specingBetweenItems:CGFloat, data:Data, delegate:SwiftUIListDelegate) {
        self.scrollDirection = scrollDirection
        self.showIndicator = showIndicator
        self.specingBetweenItems = specingBetweenItems
        self.data = data.map { $0 }
        self.delegate = delegate
    }
    
    // MARK: Body
    var body: some View {
        ScrollView(scrollDirection, showsIndicators: showIndicator) {
            displayStackView(withDirection: scrollDirection,
                             specingBetweenItems: specingBetweenItems)
        }.flipsForRightToLeftLayoutDirection(true)
    }
    
    // MARK: Methods
    
    /// Display a VStack or HStack according to the scroll direction determined by the user.
    /// - Parameter scrollDirection: Vertical or Horizontal List.
    /// - Parameter specingBetweenItems: The Spacing between the items.
    private func displayStackView(withDirection scrollDirection:Axis.Set, specingBetweenItems:CGFloat) -> AnyView {
        var stackView: AnyView
        if scrollDirection == .vertical {
            stackView = AnyView(VStack(alignment: .center, spacing: specingBetweenItems, content: {
                displayListView()
            }))
        } else {
            stackView = AnyView(HStack(alignment: .center, spacing: specingBetweenItems, content: {
                displayListView()
            }))
        }
        return stackView
    }
    
    /// Display a list of items wrapped in a NavigationLink.
    private func displayListView() -> some View {
        return ForEach(data, id: \.self) { (item) in
            NavigationLink(destination: self.delegate.navigateToDestination(item: item)) {
                self.delegate.displayView(item: item).scaleEffect(x: self.scaleX, y: 1, anchor: .center)
            }.onAppear {
                //For pagination
                if item == self.data.last {
                    self.delegate.loadMore()
                }
            }
        }
    }
}


