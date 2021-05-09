#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    
    if ([number isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    
    NSString *stringValue = [number stringValue];
    
    if ([stringValue containsString:@"-"])
    {
        stringValue = [stringValue stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    NSInteger stringLength = [stringValue length];
    NSMutableArray *array = [NSMutableArray array];
    
    while (stringLength > 0)
    {
        stringLength--;
        NSRange range = NSMakeRange(stringLength, 1);
        NSString *character = [stringValue substringWithRange:range];
        [array addObject:character];
    }
    
    return array;
}

@end
