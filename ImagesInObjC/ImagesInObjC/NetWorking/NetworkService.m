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
@property NSMutableArray<Photo*> *myPhotos;
@end

@implementation NetworkService

- (instancetype)init {
    if (self = [super init]) {
            self->_myPhotos = [NSMutableArray array];
    }
    return self;
}

- (void)getRequest:(NSString *)url :(void (^) (NSData *data, NSError *error))block{
  
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          if (block){
              block(data,error);
          }
      }] resume];
}

- (void)getPhotos:(NSString *)url :(void (^) (NSMutableArray<Photo*> *photos))block{
    
    [self getRequest:url :^(NSData *data, NSError *error) {
        NSArray *allPhotos = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
        
        for ( NSDictionary *photo in allPhotos ){
            NSString *url = photo[@"urls"][@"thumb"];
            Photo *myPhoto = [Photo new];
            myPhoto.imageUrl = url;
            [ self->_myPhotos addObject:myPhoto];
        }
        if (block){
            block(self->_myPhotos);
        }
    }];
}

- (void)getQueryPhotos:(NSString *)query :(void (^) (NSMutableArray<Photo*> *queryPhotos))queryBlock{
    
    NSString *queryUrl = [NSString stringWithFormat:@"https://api.unsplash.com/search/photos?query=%@&page=1&per_page=30&client_id=4c9fbfbbd92c17a2e95081cec370b4511659666240eb4db9416c40c641ee843b",query];
 
    [self getRequest:queryUrl :^(NSData *data, NSError *error) {
        NSDictionary *allPhotos = [NSJSONSerialization
                                   JSONObjectWithData:data
                                   options:kNilOptions
                                   error:&error];
        NSArray *aray = allPhotos[@"results"];
        
        for ( NSDictionary *photo in aray ){
            NSString *url = photo[@"urls"][@"thumb"];
            Photo *myPhoto = [Photo new];
            myPhoto.imageUrl = url;
            [ self->_myPhotos addObject:myPhoto];
        }
        
        if (queryBlock){
            queryBlock(self->_myPhotos);
        }
    }];
}


@end
