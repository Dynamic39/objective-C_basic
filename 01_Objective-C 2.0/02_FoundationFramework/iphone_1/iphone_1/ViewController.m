//
//  ViewController.m
//  iphone_1
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import "CalCulator.h"
#import "Fraction.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *display;
@property NSString *opStr;

//필요 메서드 구현
-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

//숫자키
-(IBAction)clickDigit:(UIButton *)sender;

//산술 연산키
-(IBAction)clickPlus:(id)sender;
-(IBAction)clickMinus:(id)sender;
-(IBAction)clickMultiply:(id)sender;
-(IBAction)clickDivide:(id)sender;

//기타 키
-(IBAction)clickOver:(id)sender;
-(IBAction)clickEquals:(id)sender;
-(IBAction)clickClear:(id)sender;

@end

@implementation ViewController
{
  //해당 뷰 컨트롤러에서만 사용이 가능한 변수 설정
  char op;
  int currentNumber;
  BOOL firstOperand, isNumerator;
  CalCulator *myCalculator;
  NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //애플리케이션 실행 후 사용자화 하려면 여기에 코드를 추가한다.
  firstOperand = YES;
  isNumerator = YES;
  displayString = [NSMutableString stringWithCapacity:40];
  myCalculator = [[CalCulator alloc] init];
  
}

#pragma mark - Methods

- (void)processDigit:(int)digit
{
  currentNumber = currentNumber * 10 + digit;
  [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
  display.text = displayString;
}

- (void)clickDigit:(UIButton *)sender
{
  int digit = sender.tag;
  [self processDigit:digit];
}

- (void)processOp:(char)theOp
{
  op = theOp;
  
  switch (theOp) {
    case '+':
      _opStr = @" + ";
      break;
    case '-':
      _opStr = @" - ";
      break;
    case '*':
      _opStr = @" * ";
      break;
    case '/':
      _opStr = @" / ";
      break;
      
    default:
      break;
  }
  
  [self storeFracPart];
  firstOperand = NO;
  display.text = displayString;
}

- (void)storeFracPart
{
  if (firstOperand)
  {
    if (isNumerator)
    {
      myCalculator.operand1.numerator = currentNumber;
      myCalculator.operand1.denominator = 1;
    }else
    {
      myCalculator.operand1.denominator = currentNumber;
    }
  }else if (isNumerator)
  {
    myCalculator.operand2.numerator = currentNumber;
    myCalculator.operand2.denominator = 1;
  } else
  {
    myCalculator.operand2.denominator = currentNumber;
    firstOperand = YES;
  }
  
  currentNumber = 0;
}

-(void)clickOver:(id)sender
{
  
  [self storeFracPart];
  isNumerator = NO;
  [displayString appendString:@"/"];
  display.text = displayString;
  
}

//연산 관련키
- (void)clickPlus:(id)sender
{
  [self processOp:'+'];
  display.text = [display.text stringByAppendingString:_opStr];
}

- (void)clickMinus:(id)sender
{
  [self processOp:'-'];
}
-(void)clickMultiply:(id)sender
{
  [self processOp:'*'];
}
-(void)clickDivide:(id)sender
{
  [self processOp:'/'];
}

//기타 키
- (void)clickEquals:(id)sender
{
  if (firstOperand == NO)
  {
    [self storeFracPart];
    [myCalculator perfomOperation:op];
    
    [displayString appendString:@" = "];
    [displayString appendString:[myCalculator.accumulator convertToString]];
    display.text = displayString;
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString:@""];
  }
}

- (void)clickClear:(id)sender
{
  isNumerator = YES;
  firstOperand = YES;
  currentNumber = 0;
  [myCalculator clear];
  
  [displayString setString:@""];
  display.text = displayString;
}

@end
