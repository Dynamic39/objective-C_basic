//
//  Rectangle.h
//  proj8-2dgraphics
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

//다른클래스를 참조하기 위하여 연결
//방법은 두가지, 임포트 하거나, @class 해주거나

#import "XYPoint.h"
@interface Rectangle : NSObject

@property int width, height;

//XYPoint를 인스턴스로 받으면서 생성하는 메서드
-(XYPoint *)origin;
-(void)setOrigin:(XYPoint *) pt;


//기존 클래스 입력 변수 및 메서드
-(int) area;
-(int) perimeter;
-(void) setWidth: (int)w andHeight:(int)h;

@end
