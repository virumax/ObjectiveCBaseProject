//
//  APIManager.h
//  MVCBaseProject
//
//  Created by Virendra Ravalji on 2018/12/22.
//  Copyright © 2018 Virendra Ravalji. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject
+ (instancetype)sharedInstance;
- (void)apiCallWithRequestType:(NSString *)requestType url:(NSString *)url andParameters:(NSDictionary *)parameters;
@end

NS_ASSUME_NONNULL_END
