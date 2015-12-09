//
//  ListPostCell.m
//  PublicHealth
//
//  Created by Ben Chan on 5/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ListPostCell.h"

@implementation ListPostCell

- (void)setData:(NSDictionary *)dict {
    postTitle.text = dict[@"title"];
//    if (dict[@"image"])
//        [postImage setImage:<#(UIImage * _Nullable)#>];
}

@end
