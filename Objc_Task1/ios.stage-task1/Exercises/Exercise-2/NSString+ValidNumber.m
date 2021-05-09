#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    if (self.length > 0 && self.length <= 100 && self != nil) {
        NSCharacterSet *numbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSString *tempString = [[self componentsSeparatedByCharactersInSet:numbers] componentsJoinedByString:@""];
        if (self.length == tempString.length) {
            return true;
        }
    }
    return false;
}

@end
