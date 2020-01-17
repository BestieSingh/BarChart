//
//  ChartsModel.swift
//  BarChart
//
//  Created by ksolves on 16/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation
import UIKit

struct ChartsModel: Codable {
    var result: Result?
    var status: Int?
    var msg: String?
    
    enum  CodingKeys: String, CodingKey {
        case result = "result"
        case status = "status"
        case msg = "msg"
    }
}

struct Result: Codable {
    var dashboardData: DashBoardData?
    var ticketWidget: TicketWidget?
    var eventStatus: Int?
    var eventTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case dashboardData = "dashboard_data"
        case ticketWidget = "ticket_widget"
        case eventStatus = "event_status"
        case eventTitle = "event_title"
    }
}

struct DashBoardData: Codable {
    var channels: [String]?
    var revenue: [Double]?
    var bgColor: [String]?
    var bgBorderColor: [String]?
    var grossSales: String?
    var netSales: String?
    var bgColorCode: [UIColor]?
    var bgBorderColorCode: [UIColor]?
    
    enum CodingKeys: String, CodingKey {
        case channels = "channels"
        case revenue = "revenue"
        case bgColor = "bgColor"
        case bgBorderColor = "bgBorderColor"
        case grossSales = "gross_sales"
        case netSales = "net_sales"
//        case bgColorCode = "bgColorCode"
//        case bgBorderColorCode = "bgBorderColorCode"
    }
    
}

struct TicketWidget: Codable {
    var allotedTickets: String?
    var totalCheckedIn: Int?
    var totalTickets: Int?
    var soldTickets: String?
    var ticketSoldRatio: Int?
    
    enum CodingKeys: String, CodingKey {
        case allotedTickets = "alloted_tickets"
        case totalCheckedIn = "total_checkedin"
        case totalTickets = "total_tickets"
        case soldTickets = "sold_tickets"
        case ticketSoldRatio = "ticket_sold_ratio"
    }
}



