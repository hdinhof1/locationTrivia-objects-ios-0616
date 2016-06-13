//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (FISLocation *location in self.locations) {
        [names addObject:location.name];
    }
    NSArray *namesArr = [NSArray arrayWithArray:names];
    return namesArr;
}
-(FISLocation *)locationNamed:(NSString *)name {
    FISLocation *match = [[FISLocation alloc] init];
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", name];
    NSArray *matchesToSearch = [self.locations filteredArrayUsingPredicate:namePredicate];
    if (matchesToSearch.count == 0) {
        match = nil;
    }else {
        match = matchesToSearch[0];
    }
    
    return match;
}
-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin
{
    CGFloat latitudeMAX = latitude+margin;
    CGFloat latitudeMIN = latitude-margin;
    CGFloat longitudeMAX = longitude+margin;
    CGFloat longitudeMIN = longitude-margin;
    
    NSPredicate *latitudePredicate = [NSPredicate predicateWithFormat:@"latitude BETWEEN %@", @[@(latitudeMIN), @(latitudeMAX)]];
    NSArray *locationsWithCorrectLatitude = [self.locations filteredArrayUsingPredicate:latitudePredicate];
    
    NSPredicate *longitudePredicate = [NSPredicate predicateWithFormat:@"longitude BETWEEN %@", @[@(longitudeMIN), @(longitudeMAX)]];
    NSArray *filteredLocations = [locationsWithCorrectLatitude filteredArrayUsingPredicate:longitudePredicate];

    
    return filteredLocations;
}


@end
