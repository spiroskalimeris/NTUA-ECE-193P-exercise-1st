//
//  CalculatorBrain.h
//  Calculator
//
//  Created by spiros kalimeris on 02/12/2011.
//  Copyright (c) 2011 ntua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

//η παυλα λεει πως ειναι μεθοδος υποστασης (οχι κλασης)Δ162
-(void)pushOperand:(double)operand;//μεθοδος για να pushαρω αριθμους
-(double)performOperation:(NSString *)operation;

@end
