//
//  SampleTableViewCell.h
//  MVCBaseProject
//
//  Created by Virendra Ravalji on 2018/12/22.
//  Copyright © 2018 Virendra Ravalji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SampleTableViewCell : UITableViewCell

// Properties
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

// Methods
- (void)loadImageAsynchronously:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
