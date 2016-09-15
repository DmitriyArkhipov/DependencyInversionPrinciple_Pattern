//
//  DIP.h
//  dependency_inversion_principle
//
//  Created by Dmitriy Arkhipov on 06.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>


//Реализация объектов с тесной зависимостью друг от друга

@interface ConsoleWriter : NSObject

- (void) printText:(NSString *) text;

@end



@interface Book : NSObject

@property (strong, nonatomic) NSString *text;

//@property (strong, nonatomic) id printer;

@property (strong, nonatomic) ConsoleWriter *printer;

- (void) print;


@end


//Избавление от зависимости между объектами ConsoleWriter и Book

@protocol IPrinter <NSObject>

- (void) printText:(NSString *) text;

@end



@interface NormalBook : NSObject

@property (strong, nonatomic) NSString *text;

@property (strong, nonatomic) id<IPrinter> printer;

- (instancetype) initWithPrinter: (id<IPrinter>) printer;

- (void) print;

@end


@interface NormalConsoleWriter : NSObject <IPrinter>

- (void) printText:(NSString *) text;

@end