//
//  NetworkService.m
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/18/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkService.h"
#import "Photo.h"

@interface NetworkService ()
    
@end

@implementation NetworkService

- (void)getPhotos:(void (^) (NSMutableArray<Photo*> *photos))block {
    
    NSMutableArray<Photo*> *myPhotos = [NSMutableArray array];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:apiUrl]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          NSArray *allPhotos = [NSJSONSerialization
                                      JSONObjectWithData:data
                                      options:kNilOptions
                                      error:&error];

          for ( NSDictionary *photo in allPhotos ){

              NSString *url = photo[@"urls"][@"thumb"];
              
              Photo *myPhoto = [Photo new];
                  
                  myPhoto.imageUrl = url;

              [ myPhotos addObject:myPhoto];
          }
          
          if (block){
              block(myPhotos);
          }
      }] resume];
    
}




@end
