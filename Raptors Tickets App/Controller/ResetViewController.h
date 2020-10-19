//
//  ResetViewController.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-18.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketMaster.h"
#import "Ticket.h"

// MARK: Protocol Declaration
@protocol RestockDelegate <NSObject>

- (void)updatePickerView:(NSMutableArray *)ticketList;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ResetViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

// MARK: Properties
@property (nonatomic, strong) NSMutableArray *ticketList;
// Protocol delegate property
@property (weak) id <RestockDelegate> delegate;

// MARK: Outlets
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

// MARK: Actions
- (IBAction)reset:(id)sender;
- (IBAction)cancel:(id)sender;

@end

NS_ASSUME_NONNULL_END
