//
//  TicketHistory.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-17.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "TicketHistory.h"

@implementation TicketHistory

- (instancetype)initWithName:(NSString *)name quantity:(int)quantity total:(NSString *)total date:(NSDate *)date {
    self = [super init];
    
    if (self) {
        _ticketName = name;
        _purchasedQty = quantity;
        _total = total;
        _purchasedDate = date;
    }
    return self;
}

@end
