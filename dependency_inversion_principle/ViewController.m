//
//  ViewController.m
//  dependency_inversion_principle
//
//  Created by Dmitriy Arkhipov on 06.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"


#import "DIP.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    Book *book = [[Book alloc] init];
//    [book print];
    
    NormalConsoleWriter *n_printer = [[NormalConsoleWriter alloc] init];
    
    NormalBook *n_book = [[NormalBook alloc] initWithPrinter:n_printer];
    
    [n_book print];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
