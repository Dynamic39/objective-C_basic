//
//  ChatCell.m
//  FireChat
//
//  Created by Samuel K on 2018. 4. 26..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ChatCell.h"


@implementation ChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)createNewBtn:(id)sender {
  
  FIRDatabaseReference *newChannelRef = [[FIRDatabase database] reference];
  if (self.chatTitleTF.text != nil) {
    
    FIRDatabaseReference *newChAutoID = [newChannelRef childByAutoId];
    NSDictionary *channelItem = @{@"name":self.chatTitleTF.text};
    [newChAutoID setValue:channelItem];
    
  }
  
  
  
}

@end
