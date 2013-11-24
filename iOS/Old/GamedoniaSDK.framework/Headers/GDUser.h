//
//  GDUser.h
//  gamedoniasdk
//
//  Created by Alberto Xaubet Matesanz on 07/11/12.
//  Copyright (c) 2012 Edenic Games S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDUserProfile.h"
#import "Credentials.h"

@interface GDUser : GDUserProfile

    @property Credentials *credentials;

- (NSDictionary *) toDictionary;
@end
