//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Henry Dinhofer on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init {
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}
-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}
-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    NSString *shortenedName = @"";
    if (length < self.name.length) {
        shortenedName = [self.name substringToIndex:length];
    }else {
        shortenedName = self.name;
    }
    return shortenedName;
}
-(BOOL)hasValidData {
    BOOL isGoodData = YES;
    if (self.name == nil ||
        self.name.length == 0) {
        isGoodData = NO;
    }else if (self.latitude < -90.0 ||
              self.latitude > 90.0)
    {
        isGoodData = NO;
    }else if (self.longitude <= -180.0 ||
              self.longitude > 180.0)
    {
        isGoodData = NO;
    }
    return isGoodData;
}
-(FISTrivium *)triviumWithMostLikes {
    FISTrivium *mostLikes = [[FISTrivium alloc] init];
    if (self.trivia.count == 0) {
        mostLikes = nil;
    }else
    {
        NSSortDescriptor *filterDescriptor = [[NSSortDescriptor alloc] initWithKey:@"likes" ascending:NO];
        [self.trivia sortUsingDescriptors:@[filterDescriptor]];
        mostLikes = self.trivia[0];
    }
    return mostLikes;
}
-(NSString *)description {
    return [NSString stringWithFormat:@"Name: %@ Latitude: %lu Longitude: %lu", self.name, self.latitude, self.longitude];
}

@end
