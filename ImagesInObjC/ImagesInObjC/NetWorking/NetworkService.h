//
//  NetworkService.h
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/18/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#ifndef NetworkService_h
#define NetworkService_h
@class Photo;

#endif /* NetworkService_h */
@interface NetworkService : NSObject  
#define apiUrl @"https://api.unsplash.com/photos?page=1&per_page=30&client_id=4c9fbfbbd92c17a2e95081cec370b4511659666240eb4db9416c40c641ee843b"
- (void)getPhotos:(void (^) (NSMutableArray<Photo*> *photos))block;

@end
