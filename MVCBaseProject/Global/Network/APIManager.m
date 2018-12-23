//
//  APIManager.m
//  MVCBaseProject
//
//  Created by Virendra Ravalji on 2018/12/22.
//  Copyright © 2018 Virendra Ravalji. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (instancetype)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void)apiCallWithRequestType:(NSString *)requestType url:(NSString *)url andParameters:(NSDictionary *)parameters {
    //Convert string URL to NSURL
    NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
    NSURL *URL = [NSURL URLWithString:url];
    if (URL != nil) {
        // Create URLRequest
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:URL];
        [request setHTTPMethod:requestType];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
        
//        NSString *userUpdate =[NSString stringWithFormat:@"user=%@&password=%@&api_id=%@&to=%@&text=%@",_username,_password,_apiID,[_numbers componentsJoinedByString:@","],_txtMsg.text, nil];
        
        //Convert the String to Data
//        NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
        
        //Apply the data to the body
//        [urlRequest setHTTPBody:data1];
        
        //You then can use NSURLSessionDownloadTask
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if(httpResponse.statusCode == 200) {
                NSError *parseError = nil;
                NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                NSLog(@"The response is - %@",responseDictionary);
                NSInteger success = [[responseDictionary objectForKey:@"success"] integerValue];
                if(success == 1)
                {
                    NSLog(@"Login SUCCESS");
                }
                else
                {
                    NSLog(@"Login FAILURE");
                }
            }
            else
            {
                NSLog(@"Error");
            }
        }];
        [dataTask resume];
    }
}
@end
