//
//  Ticket.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-14.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

// Designated Initializer
-(instancetype)initWithName:(NSString*)name quantity:(int)quantity price:(double)price {
    self = [super init];
    
    if (self) {
        _itemName = name;
        _quantity = quantity;
        _price = price;
    }
    return self;
}

// Description Method 
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ Ticket %d price: $ %.2f", self.itemName, self.quantity, self.price];
}


- (void)restock:(int)numberOfTickets {
    self.quantity += numberOfTickets;
}

@end
