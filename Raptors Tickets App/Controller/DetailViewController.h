//
//  DetailViewController.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-18.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

// MARK: Properties
@property (nonatomic, strong) TicketHistory *selectedTicket;

// MARK: Outlets
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

// MARK: Actions
- (IBAction)okPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
