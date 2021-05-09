#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    
    NSArray<NSNumber *> *noDuplicates = [[NSOrderedSet orderedSetWithArray:rankedArray] array];
    NSMutableArray *result = [NSMutableArray array];
    
    NSRange searchRange = NSMakeRange(0, [noDuplicates count]);
    for (NSNumber *number in playerArray) {
        NSUInteger findIndex = [noDuplicates indexOfObject:number
                                             inSortedRange:searchRange
                                             options:NSBinarySearchingInsertionIndex
                                             usingComparator:^(id obj1, id obj2)
                                             {
                                                 return [obj2 compare:obj1];
                                             }
                                ];
        NSNumber *index = @(findIndex + 1);
        [result addObject: index];
    }
    
    _playersPlaces = [NSArray arrayWithArray:result];
    
    return _playersPlaces;
}

@end
