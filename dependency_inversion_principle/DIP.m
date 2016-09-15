//
//  DIP.m
//  dependency_inversion_principle
//
//  Created by Dmitriy Arkhipov on 06.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "DIP.h"


//Реализация объектов с тесной зависимостью друг от друга

@implementation Book


- (instancetype) init {


    if (self = [super init])
    {
    
        _printer = [[ConsoleWriter alloc] init];
    
    }

    
    return self;


}

- (void) print {

    [_printer printText:@"TEST TEXT BLA BLA BLA! :)"];
    
}

@end


@implementation ConsoleWriter

- (void) printText:(NSString *)text {

    NSLog(@"ConsoleWriter print text: %@", text);

}

@end


//Избавление от зависимости между объектами ConsoleWriter и Book


@implementation NormalBook

- (instancetype) initWithPrinter: (id<IPrinter>) printer {

    if (self = [super init])
    {
        
        _printer = printer;
        
    }
    
    
    return self;
    
}


- (void) print {
    
    [_printer printText:@"TEST TEXT BLA BLA BLA! зависим только от абстракций :)"];
    //приложение упадет если принтер не будет инициализирован
    //исключение
    
}

@end


@implementation NormalConsoleWriter

- (void) printText:(NSString *)text {
    
    NSLog(@"ConsoleWriter print text: %@", text);
    
}

@end











