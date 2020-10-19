//
//  ViewController.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-14.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"
#import "TicketMaster.h"
#import "TicketHistory.h"
#import "ManagerViewController.h"
#import "ResetViewController.h"

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UpdateDelegate>

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketsNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketTypeLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketsPickerView;

// Properties
@property (nonatomic) TicketMaster *tickets;

// Actions
- (IBAction)buyTicket:(id)sender;
- (IBAction)quantityEntered:(UIButton *)sender;


@end

