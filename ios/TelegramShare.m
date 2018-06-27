//
//  GooglePlusShare.m
//  RNShare
//
//  Created by Diseño Uno BBCL on 23-07-16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "TelegramShare.h"

@implementation TelegramShare
//- (void *) shareSingle:(NSDictionary *)options failureCallback:(RCTResponseErrorBlock)failureCallback successCallback:(RCTResponseSenderBlock)successCallback serviceType:(NSString*)serviceType
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null] && [options objectForKey:@"text"] && [options objectForKey:@"text"] != [NSNull null]) {
            
//        NSString *url = [NSString stringWithFormat:@"https://telegram.me/share/url?url=%@&text=%@", options[@"url", @"text"]];
         NSString *url = [NSString stringWithFormat:@"https://telegram.me/share/url?url=%@&text=%@", options[@"url"], options[ @"text"]];
        NSURL *gplusURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        if ([[UIApplication sharedApplication] canOpenURL: gplusURL]) {
            [[UIApplication sharedApplication] openURL:gplusURL];
            successCallback(@[]);
        } else {
            // Cannot open whatsapp
            NSString *stringURL = @"https://itunes.apple.com/us/app/telegram-messenger/id686449807";
            NSURL *url = [NSURL URLWithString:stringURL];
            [[UIApplication sharedApplication] openURL:url];
            
            NSString *errorMessage = @"Not installed";
            NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: NSLocalizedString(errorMessage, nil)};
            NSError *error = [NSError errorWithDomain:@"com.rnshare" code:1 userInfo:userInfo];
            
            NSLog(errorMessage);
            failureCallback(error);
        }
    }
}


@end

