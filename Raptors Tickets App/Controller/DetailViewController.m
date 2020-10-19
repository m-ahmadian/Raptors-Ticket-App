//
//  DetailViewController.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-18.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize nameLabel, quantityLabel, totalLabel, dateLabel;


// MARK: View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    
    [self updateItems];
}


// Actions
- (IBAction)okPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Methods
- (void) updateItems {
    nameLabel.text = self.selectedTicket.ticketName;
    quantityLabel.text = [NSString stringWithFormat:@"%d", self.selectedTicket.purchasedQty];
    totalLabel.text = self.selectedTicket.total;
    
    dateLabel.text = [NSDateFormatter localizedStringFromDate:self.selectedTicket.purchasedDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

@end
