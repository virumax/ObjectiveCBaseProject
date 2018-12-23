//
//  SampleTableViewCell.m
//  MVCBaseProject
//
//  Created by Virendra Ravalji on 2018/12/22.
//  Copyright © 2018 Virendra Ravalji. All rights reserved.
//

#import "SampleTableViewCell.h"

@implementation SampleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadImageAsynchronously:(NSInteger)row {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.gstatic.com/webp/gallery3/%ld.png", (long)row]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.thumbnailImageView.image = image;
                });
            }
        }
    }];
    [task resume];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
    self.subTitleLabel.text = @"";
    self.thumbnailImageView.image = nil;
}
@end
