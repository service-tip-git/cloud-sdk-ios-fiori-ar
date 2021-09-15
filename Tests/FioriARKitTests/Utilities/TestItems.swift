//
//  TestsItems.swift
//  FioriARKit
//
//  Created by O'Brien, Patrick on 7/16/21.
//

import SwiftUI

public enum TestsItems {
    public static let carEngineCardItems = [TestCardItem(id: "WasherFluid",
                                                         title_: "Recommended Washer Fluid",
                                                         descriptionText_: "Rain X",
                                                         detailImage_: nil,
                                                         actionText_: nil,
                                                         icon_: nil),
                                            
                                            TestCardItem(id: "Coolant",
                                                         title_: "Genuine Coolant",
                                                         descriptionText_: "Price: 20.99",
                                                         detailImage_: nil,
                                                         actionText_: "Order",
                                                         icon_: Image(systemName: "cart.fill")),
                                            
                                            TestCardItem(id: "Oilstick",
                                                         title_: "Check Oil Stick",
                                                         descriptionText_: "Suggested Date: 06/02/2021",
                                                         detailImage_: Image("Schedule"),
                                                         actionText_: "Schedule",
                                                         icon_: Image(systemName: "calendar")),
                                            
                                            TestCardItem(id: "BrakeFluid",
                                                         title_: "Brake Fluid Manual",
                                                         descriptionText_: nil,
                                                         detailImage_: nil,
                                                         actionText_: "Open Car Manual",
                                                         icon_: Image(systemName: "book.fill")),
                                            
                                            TestCardItem(id: "Battery",
                                                         title_: "Jump Battery",
                                                         descriptionText_: "Instructional Video",
                                                         detailImage_: Image("Battery"),
                                                         actionText_: "Play Video",
                                                         icon_: Image(systemName: "play.fill")),
                                            
                                            TestCardItem(id: "Fusebox",
                                                         title_: "Service App",
                                                         descriptionText_: "Change Fuse",
                                                         detailImage_: nil,
                                                         actionText_: "Open App",
                                                         icon_: Image(systemName: "link"))]
}