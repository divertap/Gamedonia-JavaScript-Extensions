//
//  Credentials.h
//  gamedoniasdk
//
//  Created by Alberto Xaubet Matesanz on 07/11/12.
//  Copyright (c) 2012 Edenic Games S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

//AUTHENTICATION METHODS
#define AUTH_METHOD_SILENT      @"SILENT"
#define AUTH_METHOD_MAIL        @"MAIL"
#define AUTH_METHOD_FACEBOOK    @"FACEBOOK"
#define AUTH_METHOD_TWITTER     @"TWITTER"
#define AUTH_METHOD_GAMECENTER  @"GAMECENTER"

@interface Credentials : NSObject {

    
    NSString *email;
    NSString *fb_uid;
    NSString *tw_uid;
    NSString *open_udid;
    NSString *gamecenter_id;
    NSMutableArray *type;
    
}

@property NSString *password;
@property NSString *fb_access_token;
@property NSString *tw_token_secret;
@property NSString *tw_token;

-(id)init;

-(NSString *)email;
-(void)setEmail: (NSString *)value;

-(NSString *)fb_uid;
-(void)setFb_uid: (NSString *)value;

-(NSString *)tw_uid;
-(void)setTw_uid: (NSString *)value;

-(NSString *)open_udid;
-(void)setOpen_udid: (NSString *)value;

-(NSString *)gamecenter_id;
-(void)setGamecenter_id: (NSString *)value;

- (NSDictionary *) toDictionary;

@end