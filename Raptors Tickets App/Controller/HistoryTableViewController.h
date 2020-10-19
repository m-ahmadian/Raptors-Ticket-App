//
//  HistoryTableViewController.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-17.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryTableViewController.h"
#import "TicketMaster.h"
#import "TicketHistory.h"
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *ticketHistory;

@end

NS_ASSUME_NONNULL_END
