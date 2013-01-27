//
//  Gamedonia.h
//  gamedoniasdk
//
//  Created by Alberto Xaubet Matesanz on 07/11/12.
//  Copyright (c) 2012 Edenic Games S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamedoniaRequest.h"
#import "GamedoniaUsers.h"
#import "GamedoniaData.h"

@interface Gamedonia : NSObject


+ (void)initialize: (NSString *) apiKey secret:(NSString *)secret apiServerUrl:(NSString *)apiServerUrl apiVersion:(NSString *)apiVersion;

/// ---------------------------------
/// @name Accessing Clients
/// ---------------------------------

/**
 Returns a globally shared instance of GamedoniaUsers.
 
 For most simple cases, this is all you will need; if you need your own unique instance,
 you should use newUsers instead.
 */
+ (GamedoniaUsers *)users;

/**
 Returns a new instance of GamedoniaUsers.
 */
+ (GamedoniaUsers *)newUsers;

/**
 Returns a globally shared instance of GamedoniaData.
 
 For most simple cases, this is all you will need; if you need your own unique instance,
 you should use newUsers instead.
 */
+ (GamedoniaData *)data;

/**
 Returns a new instance of GamedoniaUsers.
 */
+ (GamedoniaData *)newData;

@end
