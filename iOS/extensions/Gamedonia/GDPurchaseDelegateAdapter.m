//
//  GDPurchaseDelegateAdapter.m
//  ____ ____ ____ ____ ____ ____ ____ ____
// ||D |||i |||v |||e |||r |||t |||a |||p ||
// ||__|||__|||__|||__|||__|||__|||__|||__||
// |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
//
//  Copyright Divertap 2013. All rights reserved.

#import "GDPurchaseDelegateAdapter.h"
#import "ccMacros.h"
#import "GDPaymentTransaction.h"

@implementation GDPurchaseDelegateAdapter

- (id) init {
    if( self = [super init] ) {
        // Nothing
    }
    return self;
}

#pragma JS Callbacks
- (void) productsRequested:(NSMutableArray *)productsList {
    CCLOG(@"Product list is: %@", productsList);
}
- (void) productPurchased: (GDPaymentTransaction *) transaction {
    CCLOG(@"Transaction: %@",transaction);
}

@end
