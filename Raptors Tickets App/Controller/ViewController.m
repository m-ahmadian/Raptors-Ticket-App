//
//  ViewController.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-14.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "ViewController.h"
#import "ResetViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *ticketList;
@property (nonatomic) NSMutableArray *ticketHistory;
@property BOOL isFirstTime;

@end

@implementation ViewController

// MARK: Property Lazy Loading

- (TicketMaster *)tickets {
    if (_tickets == nil) {
        _tickets = [[TicketMaster alloc]init];
    }
    return _tickets;
}

- (NSMutableArray *)ticketList {
    if (_ticketList == nil) {
        _ticketList = [[NSMutableArray alloc]init];
    }
    return _ticketList;
}

- (NSMutableArray *)ticketHistory {
    if (ticketHistory == nil) {
        ticketHistory = [[NSMutableArray alloc]init];
    }
    return ticketHistory;
}


@synthesize totalPriceLabel, ticketsNumberLabel, ticketTypeLabel, ticketsPickerView;

@synthesize ticketHistory;


// MARK: View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketList = [NSMutableArray arrayWithArray:self.tickets.ticketList];
    self.isFirstTime = YES;
    
    // PickerView Delegate & DataSource
    ticketsPickerView.delegate = self;
    ticketsPickerView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [ticketsPickerView reloadAllComponents];
}


// MARK: Actions

- (IBAction)buyTicket:(id)sender {
    
    // Calculate and update the total
    NSNumber *num = [self calculatePriceWithTicket:ticketTypeLabel.text number:[ticketsNumberLabel.text doubleValue]];
    totalPriceLabel.text = [NSNumberFormatter localizedStringFromNumber:num numberStyle:NSNumberFormatterCurrencyStyle];
    
    // Subtract the remaining quantity and update the array
    if ([ticketTypeLabel.text isEqualToString:@"Balcony Level"]) {
        self.tickets.balconyLvl.quantity -= [ticketsNumberLabel.text intValue];
        [self.ticketList replaceObjectAtIndex:0 withObject:self.tickets.balconyLvl];
    }
    else if ([ticketTypeLabel.text isEqualToString:@"Lower Level"]) {
        self.tickets.lowerLvl.quantity -= [ticketsNumberLabel.text intValue];
        [self.ticketList replaceObjectAtIndex:1 withObject:self.tickets.lowerLvl];
    }
    else if ([ticketTypeLabel.text isEqualToString:@"Courtside"]) {
        self.tickets.courtside.quantity -= [ticketsNumberLabel.text intValue];
        [self.ticketList replaceObjectAtIndex:2 withObject:self.tickets.courtside];
    }
    
    // Add the purchased ticket to the history
    TicketHistory *purchasedTicket = [[TicketHistory alloc]initWithName:ticketTypeLabel.text quantity:[ticketsNumberLabel.text intValue] total:totalPriceLabel.text date:[NSDate date]];
    [self.ticketHistory addObject:purchasedTicket];
    
    // Reload the PickerView
    [ticketsPickerView reloadAllComponents];
    // Reset the boolean value for numbers entered
    self.isFirstTime = YES;
}


- (IBAction)quantityEntered:(UIButton *)sender {
    
    if (self.isFirstTime) {
        ticketsNumberLabel.text = [NSString stringWithFormat:@"%@", sender.currentTitle];
        self.isFirstTime = NO;
    } else {
        ticketsNumberLabel.text = [NSString stringWithFormat:@"%@%@", ticketsNumberLabel.text, sender.currentTitle];
    }
    
}


// MARK: PirckerView Delegate & DataSource Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *dataObject = [[self.ticketList objectAtIndex:row]description];
    return dataObject;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    ticketTypeLabel.text = [[self.ticketList objectAtIndex:row] itemName];
}



// MARK: Helper Method

-(NSNumber*)calculatePriceWithTicket:(NSString*)ticket number:(int)number {

    double totalDouble;
    if ([ticket isEqualToString:@"Balcony Level"]) {
        totalDouble = 1170 * number;
    } else if ([ticket isEqualToString:@"Lower Level"]) {
        totalDouble = 10434 * number;
    } else {
        totalDouble = 27777 * number;
    }
    NSNumber *total = [NSNumber numberWithDouble:totalDouble];
    return total;
}


// MARK: Prepare for Segure
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"manager"]) {
        ManagerViewController *managerVC = [segue destinationViewController];
        // Set next view controller's delegate to self
        managerVC.delegate = self;
        // Pass list of tickets and purchased history
        managerVC.ticketHistory = self.ticketHistory;
        managerVC.ticketList = self.ticketList;
    }
}


// MARK: Protocol Method
-(void)updateTicketList:(NSMutableArray *)ticketList {
    self.ticketList = ticketList;
}


@end
