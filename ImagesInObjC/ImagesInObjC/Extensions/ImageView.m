//
//  UIImageView.m
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/19/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageView.h"
#import <UIKit/UIKit.h>

@implementation UIImageView (ImageView)

- (void)downloadImageFromUrl:(NSURL*) url{
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          dispatch_async(dispatch_get_main_queue(), ^{
              self.image = [UIImage imageWithData:data];
          });
    }
      ] resume];
}

- (void)downloadImageFromString:(NSString*) stringUrl {
    
    if (stringUrl == nil) {
        NSLog(@"%s","stringUrl is nil");
    }else{
        [self downloadImageFromUrl:[NSURL URLWithString:stringUrl]];
    }
}

@end
