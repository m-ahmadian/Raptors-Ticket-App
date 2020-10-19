//
//  Ticket.h
//  Raptors Tickets App
//
//  Created by Mehrdad on 2020-10-14.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject

@property (nonatomic) NSString *itemName;
@property (nonatomic) int quantity;
@property (nonatomic) double price;

-(instancetype)initWithName:(NSString*)name quantity:(int)quantity price:(double)price;

- (NSString *)description;

- (void)restock:(int)numberOfTickets;

@end

NS_ASSUME_NONNULL_END
