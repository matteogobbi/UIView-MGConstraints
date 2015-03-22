//
//  UIView+Constraints.m
//  Matteo Gobbi
//
//  Created by Matteo Gobbi on 22/03/2014.
//  Copyright (c) 2015 busuu. All rights reserved.
//

#import "UIView+Constraints.h"
#import <objc/runtime.h>

static void const *kBSUConstraintsDictionaryKey = "kBSUConstraintsDictionaryKey";

@interface UIView (MGConstraints_Private)

@property (strong, nonatomic) NSMutableDictionary *mg_constraintsDictionary;

@end

@implementation UIView (MGConstraints)

#pragma mark - Private

- (NSMutableDictionary *)mg_constraintsDictionary
{
    id obj = objc_getAssociatedObject(self, kBSUConstraintsDictionaryKey);
    
    if (!obj) {
        obj = [NSMutableDictionary new];
        self.mg_constraintsDictionary = obj;
    }
    
    return obj;
}

- (void)setmg_constraintsDictionary:(NSMutableDictionary *)mg_constraintsDictionary
{
    objc_setAssociatedObject(self, kBSUConstraintsDictionaryKey, mg_constraintsDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Custom Methods

- (void)addAndStoreConstraint:(NSLayoutConstraint *)constraint forKey:(id<NSCopying>)key
{
    NSParameterAssert([constraint isKindOfClass:[NSLayoutConstraint class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == NO, @"You can't store a constraint with the same key of another already existing. To replace a constraint use please the method replaceConstraintForKey:withConstraint:");
    
    [self addConstraint:constraint];
    [self.mg_constraintsDictionary setObject:constraint forKey:key];
}

- (void)addAndStoreConstraints:(NSArray *)constraints forKey:(id<NSCopying>)key
{
    NSParameterAssert([constraints isKindOfClass:[NSArray class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == NO, @"You can't store a constraints with the same key of another already existing. To replace a constraint use please the method replaceConstraintForKey:withConstraint:");
    
    [self addConstraints:constraints];
    [self.mg_constraintsDictionary setObject:constraints forKey:key];
}

- (void)storeConstraint:(NSLayoutConstraint *)constraint forKey:(id<NSCopying>)key
{
    NSParameterAssert([constraint isKindOfClass:[NSLayoutConstraint class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == NO, @"You can't store a constraint with the same key of another already existing. To replace a constraint use please the method replaceConstraintForKey:withConstraint:");
        
    [self.mg_constraintsDictionary setObject:constraint forKey:key];
}

- (void)storeConstraints:(NSArray *)constraints forKey:(id<NSCopying>)key
{
    NSParameterAssert([constraints isKindOfClass:[NSArray class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == NO, @"You can't store a constraints with the same key of another already existing. To replace a constraint use please the method replaceConstraintForKey:withConstraint:");
    
    [self.mg_constraintsDictionary setObject:constraints forKey:key];
}

- (NSLayoutConstraint *)constraintForKey:(id<NSCopying>)key
{
    NSParameterAssert(key != nil);
    
    return [self.mg_constraintsDictionary objectForKey:key];
}

- (NSArray *)constraintsForKey:(id<NSCopying>)key
{
    NSParameterAssert(key != nil);
    
    return [self.mg_constraintsDictionary objectForKey:key];
}

- (void)removeConstraintsForKey:(id<NSCopying>)key
{
    NSParameterAssert(key != nil);
    
    id constraints = [self constraintForKey:key];
    
    if (!constraints)
        return;
    
    if ([constraints isKindOfClass:[NSArray class]]) {
        [self removeConstraints:constraints];
    } else {
        [self removeConstraint:constraints];
    }
    
    [self.mg_constraintsDictionary removeObjectForKey:key];
}

- (void)replaceConstraintForKey:(id<NSCopying>)key withConstraint:(NSLayoutConstraint *)constraint
{
    NSParameterAssert([constraint isKindOfClass:[NSLayoutConstraint class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == YES, @"The constraint you want to replace doesn't exist.");
    
    [self removeConstraintsForKey:key];
    [self addAndStoreConstraint:constraint forKey:key];
}

- (void)replaceConstraintsForKey:(id<NSCopying>)key withConstraints:(NSArray *)constraints
{
    NSParameterAssert([constraints isKindOfClass:[NSArray class]]);
    NSParameterAssert(key != nil);
    
    NSAssert([self.mg_constraintsDictionary.allKeys containsObject:key] == YES, @"The constraints you want to replace doesn't exist.");
    
    [self removeConstraintsForKey:key];
    [self addAndStoreConstraints:constraints forKey:key];
}

- (void)removeAllStoredConstraints
{
    for (id key in self.mg_constraintsDictionary.allKeys) {
        [self removeConstraintsForKey:key];
    }
    
    [self.mg_constraintsDictionary removeAllObjects];
}

- (NSDictionary *)copyStoredConstraintsDictionary
{
    return [self.mg_constraintsDictionary copy];
}

- (NSUInteger)countStoredConstraints
{
    return [self.mg_constraintsDictionary count];
}

@end
