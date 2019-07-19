//
//  AppDelegate.h
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/18/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

