#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    
    if (self.count == 0)
    {
        return nil;
    }
    
    NSInteger leftIndex = 0;
    NSInteger rightIndex = self.count - 1;
    
    if (self.count == 1 || ([self[rightIndex] compare:self[leftIndex]] == NSOrderedDescending))
    {
        return self[0];
    }
    
    while (rightIndex >= leftIndex)
    {
        NSInteger midIndex = leftIndex + (rightIndex - leftIndex) / 2;
        
        if ([self[midIndex] compare:self[midIndex + 1]] == NSOrderedDescending)
        {
            return self[midIndex + 1];
        }
        
        if ([self[midIndex - 1] compare:self[midIndex]] == NSOrderedDescending)
        {
            return self[midIndex];
        }
        
        if ([self[midIndex] compare:self[leftIndex]] == NSOrderedDescending) {
            leftIndex = midIndex + 1;
        } else {
            rightIndex = midIndex - 1;
        }
    }
    return nil;
}

@end
