//
//  FirstViewController.h
//  Autoamtion101
//
//  Created by Eric McConkie on 11/3/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain)NSArray *data;
@end
