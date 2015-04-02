//
//  UIViewPlusMGConstraintsTests.m
//  Matteo Gobbi
//
//  Created by Matteo Gobbi on 31/03/2015.
//  Copyright (c) 2014 Matteo Gobbi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIView+MGConstraints.h"

@interface UIViewPlusMGConstraintsTests : XCTestCase

@property (nonatomic, strong) UIView *view;

@end

static NSString *aKey = @"aKey";

@implementation UIViewPlusMGConstraintsTests

- (void)setUp {
    [super setUp];
    
    _view = [UIView new];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testStoreConstraintMethod
{
    NSUInteger startCount = [_view countStoredConstraints];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    
    [_view storeConstraint:constraint forKey:aKey];
    
    XCTAssertEqual([_view countStoredConstraints], startCount + 1, @"The constraint store method should store a new constraint.");
}

- (void)testStoreConstraintsMethod
{
    NSUInteger startCount = [_view countStoredConstraints];
    
    NSArray *constraints = [NSArray new];
    
    [_view storeConstraints:constraints forKey:aKey];
    
    XCTAssertEqual([_view countStoredConstraints], startCount + 1, @"The constraint store method should store a new constraint.");
}

- (void)testAddAndStoreConstraintMethod
{
    NSUInteger startCount = [_view countStoredConstraints];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    
    [_view addAndStoreConstraint:constraint forKey:aKey];
    
    XCTAssertEqual([_view countStoredConstraints], startCount + 1, @"The constraint addAndStore method should store a new constraint.");
}

- (void)testAddAndStoreConstraintsMethod
{
    NSUInteger startCount = [_view countStoredConstraints];
    
    NSArray *constraints = [NSArray new];
    
    [_view addAndStoreConstraints:constraints forKey:aKey];
    
    XCTAssertEqual([_view countStoredConstraints], startCount + 1, @"The constraint addAndStore method should store a new constraint.");
}

- (void)testGetConstraintMethod
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    [_view storeConstraint:constraint forKey:aKey];
    
    id gotConstraint = [_view constraintForKey:aKey];
    
    XCTAssertNotEqualObjects(gotConstraint, nil, @"A constraint early set and then got can't be nil.");
    XCTAssertTrue([gotConstraint isKindOfClass:[NSLayoutConstraint class]], @"The constraint got should be kind of class 'NSLayoutConstraint'.");
    XCTAssertEqualObjects(gotConstraint, constraint, @"The constraints early set and then got should be the same object.");
    
    gotConstraint = [_view constraintForKey:@"unknownKey"];
    
    XCTAssertEqualObjects(gotConstraint, nil, @"A constraint for an unknown key should be nil");
}

- (void)testGetConstraintsMethod
{
    NSArray *constraints = [NSArray new];
    [_view storeConstraints:constraints forKey:aKey];
    
    id gotConstraints = [_view constraintsForKey:aKey];
    
    XCTAssertNotEqualObjects(gotConstraints, nil, @"A constraints early set and then got can't be nil.");
    XCTAssertTrue([gotConstraints isKindOfClass:[NSArray class]], @"The constraints got should be kind of class 'NSArray'.");
    XCTAssertEqualObjects(gotConstraints, constraints, @"The constraints early set and then got should be the same object.");
    
    gotConstraints = [_view constraintsForKey:@"unknownKey"];
    
    XCTAssertEqualObjects(gotConstraints, nil, @"A constraint for an unknown key should be nil");
}

- (void)testReplaceConstraintMethod
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    [_view storeConstraint:constraint forKey:aKey];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint new];
    [_view replaceConstraintForKey:aKey withConstraint:constraint2];
    
    id gotConstraint = [_view constraintForKey:aKey];
    
    XCTAssertEqualObjects(gotConstraint, constraint2, @"The constraints early set and then replaced should be the replaced object.");
}

- (void)testReplaceConstraintsMethod
{
    NSArray *constraints = [NSArray new];
    [_view storeConstraints:constraints forKey:aKey];
    
    NSArray *constraints2 = [NSArray new];
    [_view replaceConstraintsForKey:aKey withConstraints:constraints2];
    
    id gotConstraints = [_view constraintForKey:aKey];
    
    XCTAssertEqualObjects(gotConstraints, constraints2, @"The constraints early set and then replaced should be the replaced object.");
}

- (void)testDeleteMethod
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    [_view storeConstraint:constraint forKey:aKey];
    
    NSUInteger startCount = [_view countStoredConstraints];
    
    [_view removeConstraintsForKey:aKey];
    
    XCTAssertEqual([_view countStoredConstraints], startCount - 1, @"The number of stored constraints should be decremented after a deletion.");
    XCTAssertEqualObjects([_view constraintForKey:aKey], nil, @"The constraint got from a a key just deleted, should be nil.");
}

- (void)testRemoveAllStoredConstraintMethod
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint new];
    [_view storeConstraint:constraint forKey:@"key1"];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint new];
    [_view storeConstraint:constraint2 forKey:@"key2"];
    
    NSUInteger startCount = [_view countStoredConstraints];
    
    [_view removeAllStoredConstraints];
    
    XCTAssertEqual([_view countStoredConstraints], startCount - 2, @"Remove all constraint method, should remove all constraints.");
    XCTAssertEqual([_view countStoredConstraints], 0, @"Remove all constraint method, should remove all constraints.");
}

@end
