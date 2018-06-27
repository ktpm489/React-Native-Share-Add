//
//  GooglePlusShare.m
//  RNShare
//
//  Created by Diseño Uno BBCL on 23-07-16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "SkypeShare.h"

@implementation SkypeShare
//- (void *) shareSingle:(NSDictionary *)options failureCallback:(RCTResponseErrorBlock)failureCallback successCallback:(RCTResponseSenderBlock)successCallback serviceType:(NSString*)serviceType
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null] && [options objectForKey:@"text"] && [options objectForKey:@"text"] != [NSNull null]) {
    
        NSString *url = [NSString stringWithFormat:@"https://web.skype.com/share?url=%@&text=%@", options[@"url"], options[ @"text"]];
        NSURL *gplusURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        if ([[UIApplication sharedApplication] canOpenURL: gplusURL]) {
            [[UIApplication sharedApplication] openURL:gplusURL];
            successCallback(@[]);
        } else {
            NSLog(@"No Web Skype Intent");
        }
    }
}


@end


