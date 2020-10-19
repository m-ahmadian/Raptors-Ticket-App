//
//  ResetViewController.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-18.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "ResetViewController.h"

@interface ResetViewController ()

@property NSInteger objectIndex;

@end


@implementation ResetViewController

@synthesize pickerView, textField;


// View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    // Pass data to the previous VC (delegate)
    [self.delegate updatePickerView:self.ticketList];
}


// PickerView Delegate & DataSource Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.ticketList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self.ticketList objectAtIndex:row]description];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.objectIndex = row;
}


// MARK: Actions

- (IBAction)reset:(id)sender {
    // Create a variable, holding the selected ticket
    Ticket *selectedTicket = [self.ticketList objectAtIndex:self.objectIndex];
    // call the restock method on the selected ticket to add to its quantity
    [selectedTicket restock:[textField.text intValue]];
    // Update the ticketList array with the selected ticket and its updated quantity
    [self.ticketList replaceObjectAtIndex:self.objectIndex withObject:selectedTicket];
    // Reload the picker view to apply the changes
    [pickerView reloadAllComponents];
}


- (IBAction)cancel:(id)sender {
    // Cancel the entered number
    textField.text = @"0";
}


@end
