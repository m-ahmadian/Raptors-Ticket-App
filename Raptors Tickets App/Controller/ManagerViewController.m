//
//  ManagerViewController.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-17.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "ManagerViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    // Pass data to the previous VC
    [self.delegate updateTicketList:self.ticketList];
}


// Prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"history"]) {
        HistoryTableViewController *historyVC = [segue destinationViewController];
        // Pass the hitory of purchases to the History VC
        historyVC.ticketHistory = self.ticketHistory;
    }
    
    if ([segue.identifier isEqualToString:@"reset"]) {
        ResetViewController *resetVC = [segue destinationViewController];
        // Set the delegate of Reset View Controller to self
        resetVC.delegate = self;
        // Pass list of tickets to the Reset VC
        resetVC.ticketList = self.ticketList;
    }
}

// Protocol Method
-(void)updatePickerView:(NSMutableArray *)ticketList {
    self.ticketList = ticketList;
}

@end
