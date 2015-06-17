//
//  NSString+LHSAdditions.m
//  LHSCategoryCollection
//
//  Created by Daniel Loewenherz on 2/19/15.
//
//

#import "NSString+LHSAdditions.h"

@implementation NSString (LHSAdditions)

- (NSRange)lhs_range {
    return NSMakeRange(0, self.length);
}

@end
