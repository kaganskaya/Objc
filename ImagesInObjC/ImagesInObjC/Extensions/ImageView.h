//
//  ImageView.h
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/19/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImageView (ImageView)
- (void)downloadImageFromString:(NSString*) stringUrl;
- (void)downloadImageFromUrl:(NSURL*) url;

@end
