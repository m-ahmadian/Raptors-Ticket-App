//
//  TicketMaster.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-16.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ticket.h"
#import "TicketHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketMaster : Ticket

@property (nonatomic) NSMutableArray *ticketList;
@property (nonatomic) TicketHistory *ticketHistory;
@property (nonatomic) Ticket *balconyLvl;
@property (nonatomic) Ticket *lowerLvl;
@property (nonatomic) Ticket *courtside;

@end

NS_ASSUME_NONNULL_END
