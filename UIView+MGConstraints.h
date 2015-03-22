//
//  UIView+Constraints.h
//  Matteo Gobbi
//
//  Created by Matteo Gobbi on 22/03/2014.
//  Copyright (c) 2015 busuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MGConstraints)

#pragma mark - Custom Methods

- (void)addAndStoreConstraint:(NSLayoutConstraint *)constraint forKey:(id<NSCopying>)key;
- (void)addAndStoreConstraints:(NSArray *)constraints forKey:(id<NSCopying>)key;
- (void)storeConstraint:(NSLayoutConstraint *)constraint forKey:(id<NSCopying>)key;
- (void)storeConstraints:(NSArray *)constraints forKey:(id<NSCopying>)key;
- (NSLayoutConstraint *)constraintForKey:(id<NSCopying>)key;
- (NSArray *)constraintsForKey:(id<NSCopying>)key;
- (void)removeConstraintsForKey:(id<NSCopying>)key;
- (void)replaceConstraintForKey:(id<NSCopying>)key withConstraint:(NSLayoutConstraint *)constraint;
- (void)replaceConstraintsForKey:(id<NSCopying>)key withConstraints:(NSArray *)constraints;
- (void)removeAllStoredConstraints;
- (NSUInteger)countStoredConstraints;

- (NSDictionary *)copyStoredConstraintsDictionary;


@end
