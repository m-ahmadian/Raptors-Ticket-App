//
//  TicketHistory.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-17.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketHistory : Ticket

@property (nonatomic) NSString *ticketName;
@property (nonatomic) int purchasedQty;
@property (nonatomic) NSString *total;
@property (nonatomic) NSDate *purchasedDate;

- (instancetype)initWithName:(NSString *)name quantity:(int)quantity total:(NSString *)total date:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
