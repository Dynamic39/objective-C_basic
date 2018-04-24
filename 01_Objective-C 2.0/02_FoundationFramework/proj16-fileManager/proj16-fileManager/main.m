//
//  main.m
//  proj16-fileManager
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
//    NSString *fName = @"/Users/samuelk/Documents/Education/01_iOS_education/08_Objective-C/01_Objective-C 2.0/02_FoundationFramework/proj16-fileManager/proj16-fileManager/testfile";
//
    NSString *newPathName = @"/Users/samuelk/Documents/Education/01_iOS_education/08_Objective-C/01_Objective-C 2.0/02_FoundationFramework/proj16-fileManager/proj16-fileManager/";
//    NSFileManager *fm;
//    NSDictionary *attr;
//
//    //파일 매니저 인스턴스 생성
//    fm = [NSFileManager defaultManager];
//
//    //testfile의 존재 여부를 먼저 확인한다
//    if ([fm fileExistsAtPath:fName] == NO)
//    {
//      NSLog(@"File doesn't exist");
//      return 1;
//    }
//
//    //복사본 만들기
//    if ([fm copyItemAtPath:fName toPath:[newPathName stringByAppendingString:@"newfile"] error:NULL] == NO)
//    {
//      NSLog(@"File Copy failed");
//      return 2;
//    }
//
//    //두개의 파일이 일치하는지 확인한다.
//    if ([fm contentsEqualAtPath:fName andPath:[newPathName stringByAppendingString:@"newfile"]] == NO)
//    {
//      NSLog(@"Files are Not Equal");
//      return 3;
//    }
//
//    //사본의 이름을 변경
//    if ([fm moveItemAtPath:[newPathName stringByAppendingString:@"newfile"] toPath:[newPathName stringByAppendingString:@"newfile2"] error:NULL] == NO)
//    {
//      NSLog(@"File rename Failed");
//      return 4;
//    }
//
//    //newfile2의 크기를 알아낸다.
//    if ((attr = [fm attributesOfItemAtPath:[newPathName stringByAppendingString:@"newfile2"] error:NULL])==nil)
//    {
//      NSLog(@"Couldn't get file attributes");
//      return 5;
//    }
//
//    NSLog(@"File size is %llu bytes", [[attr objectForKey:NSFileSize] unsignedLongLongValue]);
//
//    //원본 파일을 삭제한다.
//    if ([fm removeItemAtPath:fName error:NULL] == NO)
//    {
//      NSLog(@"file removal failed");
//      return 6;
//    }
//
//    NSLog(@"All operations were successful");
//
//    //새로 생성한 파일의 내용을 표시
//    NSLog(@"%@", [NSString stringWithContentsOfFile:[newPathName stringByAppendingString:@"newfile2"] encoding:NSUTF8StringEncoding error:NULL]);
    
    
    //파일 복사하기
    
//    NSFileManager *fm;
//    NSData *fileData;
//
//    fm = [NSFileManager defaultManager];
//
//    //newfile2를 읽는다
//    fileData = [fm contentsAtPath:[newPathName stringByAppendingString:@"newfile2"]];
//
//    //파일이 없는 경우 에러처리
//    if (fileData == nil)
//    {
//      NSLog(@"File read failed");
//      return 1;
//    }
//
//    //newfile3에 데이터를 기록한다.
//    if ([fm createFileAtPath:[newPathName stringByAppendingString:@"newfile3"] contents:fileData attributes:nil] == NO)
//    {
//      NSLog(@"Couldn't create the copy!");
//      return 2;
//    }
//
//    NSLog(@"File copy was successful!");
    
    //기본 디렉터리 작업
//    NSString *dirName = @"testdir";
//    NSString *path;
//    NSFileManager *fm;
//
//    //파일 매니저의 인스턴스를 생성한다
//    fm = [NSFileManager defaultManager];
//
//    //현재 디렉토리를 받아온다.
//    path = [fm currentDirectoryPath];
//    NSLog(@"Current directory path is %@", path);
//
//    //새 디렉터리를 생성한다.
//    if ([fm createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:NULL] == NO)
//    {
//      NSLog(@"Couldn't create directory!");
//      return 1;
//    }
//
//    //새 디렉터리의 이름을 변경한다.
//    if ([fm moveItemAtPath:dirName toPath:@"newdir" error:NULL] == NO)
//    {
//      NSLog(@"Directory rename failed!");
//      return 2;
//    }
//
//    //새 디렉터리로 현재 디렉터리를 이동한다
//    if ([fm changeCurrentDirectoryPath:@"newdir"] == NO)
//    {
//      NSLog(@"Change directory failed");
//      return 3;
//    }
//
//    //현재 디렉터리를 받아 표시한다.
//    path = [fm currentDirectoryPath];
//    NSLog(@"Current directory path is %@", path);
//
//    NSLog(@"All operation were sucessful!");
    
    //디렉터리의 내용물을 열거한다.
//    NSString *path;
//    NSFileManager *fm;
//    NSDirectoryEnumerator *dirEnum;
//    NSArray *dirArray;
//
//    //파일 매니저의 인스턴스를 생성한다.
//    fm = [NSFileManager defaultManager];
//
//    //현재 작업 디렉터리 경로를 받아온다.
//    path = [fm currentDirectoryPath];
//    //디렉터리를 열거한다.
//    dirEnum = [fm enumeratorAtPath:path];
//    NSLog(@"Content of %@", path);
//
//    while ((path = [dirEnum nextObject]) != nil)
//      NSLog(@"%@",path);
//
//    dirArray = [fm contentsOfDirectoryAtPath:[fm currentDirectoryPath] error:NULL];
//
//    NSLog(@"Contents using contentsOfDirectoryAtPath:error:");
//
//    for (path in dirArray)
//      NSLog(@"%@", path);
    
    //기본 경로 작업
//    NSString *fName = @"path.m";
//    NSFileManager *fm;
//    NSString *path, *temdir, *extension, *homedir, *fullpath;
//    NSArray *components;
//
//    //파일 매니저 작성
//    fm = [NSFileManager defaultManager];
//
//    //임시 작업 디렉터리를 얻어 온다.
//    temdir = NSTemporaryDirectory();
//    NSLog(@"Temporary Directory is %@", temdir);
//
//    //현재 디렉터리에서 기본 디렉터리를 추출한다.
//    path = [fm currentDirectoryPath];
//    NSLog(@"Base dir is %@", [path lastPathComponent]);
//
//    //현재 디렉터리의 fName 파일의 전체 경로를 생성한다.
//    fullpath = [path stringByAppendingPathComponent:fName];
//    NSLog(@"extension for %@ is %@", fName, fullpath);
//
//    //파일 확장자 얻어오기
//    extension = [fullpath pathExtension];
//    NSLog(@"extension for %@ is %@", fullpath, extension);
//
//    //사용자의 홈 디렉터리 얻어오기
//    homedir = NSHomeDirectory();
//    NSLog(@"Your home diretory is %@", homedir);
//
//    //경로를 각 요소로 분리한다.
//    components = [homedir pathComponents];
//
//    for (path in components)
//      NSLog(@"%@", path);
    
    //기본 복사 유틸리티 구현하기
    
//    NSFileManager *fm;
//    NSString *source, *dest;
//    BOOL isDir;
//    NSProcessInfo *proc = [NSProcessInfo processInfo];
//    NSArray *args = [proc arguments];
//
//    fm = [NSFileManager defaultManager];
//
//    //커맨드 라인의 인수 두개를 확인한다.
//    if ([args count] != 3)
//    {
//      NSLog(@"Usage: %@ src dest", [proc processName]);
//      return 1;
//    }
//
//    source = [args objectAtIndex:1];
//    dest = [args objectAtIndex:2];
//
//    //소스 파일을 읽을 수 있는 확인한다.
//    if ([fm isReadableFileAtPath:source] == NO)
//    {
//      NSLog(@"Can't read %@", source);
//      return 2;
//    }
//
//    //목적 파일이 디렉터리인지 확인한다.
//    //만일 그렇다면 목적 파일 뒤에 소스를 붙인다.
//    [fm fileExistsAtPath:dest isDirectory:&isDir];
//
//    if (isDir == YES)
//      dest = [dest stringByAppendingPathComponent:[source lastPathComponent]];
//
//    //목적 파일이 이미 존재하면 삭제한다.
//    [fm removeItemAtPath:dest error:NULL];
//    //이제 복사를 수행한다.
//    if ([fm copyItemAtPath:source toPath:dest error:NULL] == NO)
//    {
//      NSLog(@"Copy failed");
//      return 3;
//    }
//
//    NSLog(@"Copy of %@ to %@ succeeded", source, dest);
    
    //URL에 저장된 파일의 내용을 읽는다
    
    NSURL *myURL = [NSURL URLWithString:@"https://www.naver.com/"];
    NSString *myHomePage = [NSString stringWithContentsOfURL:myURL encoding:NSASCIIStringEncoding error:NULL];
    NSLog(@"%@", myHomePage);
    
    NSString *txtFilePath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"m"];
  
  }
  return 0;
}
