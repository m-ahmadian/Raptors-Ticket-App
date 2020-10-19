//
//  TicketMaster.m
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-16.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "TicketMaster.h"

@implementation TicketMaster

- (NSMutableArray *)ticketList {
    if (_ticketList == nil) {
        _ticketList = [[NSMutableArray alloc]initWithObjects:self.balconyLvl, self.lowerLvl, self.courtside, nil];
    }
    return _ticketList;
}

- (TicketHistory *)ticketHistory {
    if (_ticketHistory == nil) {
        _ticketHistory = [[TicketHistory alloc]init];
    }
    return _ticketHistory;
}

- (Ticket *)balconyLvl {
    if (_balconyLvl == nil) {
        _balconyLvl = [[Ticket alloc]initWithName:@"Balcony Level" quantity:12 price:1170.0];
    }
    return _balconyLvl;
}

-(Ticket *)lowerLvl {
    if (_lowerLvl == nil) {
        _lowerLvl = [[Ticket alloc]initWithName:@"Lower Level" quantity:20 price:10434.0];
    }
    return _lowerLvl;
}

- (Ticket *)courtside {
    if (_courtside == nil) {
        _courtside = [[Ticket alloc]initWithName:@"Courtside" quantity:15 price:27777.0];
    }
    return _courtside;
}


@end
