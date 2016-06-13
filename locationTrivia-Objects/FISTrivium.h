//
//  FISTrivium.h
//  locationTrivia-Objects
//
//  Created by Henry Dinhofer on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISTrivium : NSObject

@property (nonatomic, strong) NSString *content;

@property (nonatomic) NSUInteger likes;

-(instancetype)init;

-(instancetype)initWithContent:(NSString *)content likes:(NSUInteger)likes;

@end
