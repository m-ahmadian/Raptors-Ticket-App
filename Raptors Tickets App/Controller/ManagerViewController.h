//
//  ManagerViewController.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-17.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryTableViewController.h"
#import "ResetViewController.h"

NS_ASSUME_NONNULL_BEGIN

// Protocol Declaration
@protocol UpdateDelegate <NSObject>

- (void)updateTicketList:(NSMutableArray *)ticketList;

@end


@interface ManagerViewController : UIViewController <RestockDelegate>

// Properties
@property (nonatomic) NSMutableArray *ticketHistory;
@property (nonatomic) NSMutableArray *ticketList;
@property (weak) id <UpdateDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
