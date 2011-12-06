//
//  CalculatorBrain.m
//  Calculator
//
//  Created by spiros kalimeris on 02/12/2011.
//  Copyright (c) 2011 ntua. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
  //για να φτιαξουμε μια private στηβα τελεστων
@property (nonatomic,strong) NSMutableArray *operantStack;
 // το weak  σημαινει οτι αν κανεις αλλος δεν ενδιαφερεται ,δεν ενδιαφερομαι υτε εγω, καντο NIL        


@end


@implementation CalculatorBrain


@synthesize operantStack=_operandStack;
//ας κανουμε την δουλεια του synthesize...

-(NSMutableArray *)operantStack{ //o getter,τον αρχικοποιω ωστε την πρωτη φορα που θα χρησημοποιηθει να μην επιστεψει Nil
    if(!_operandStack){
        _operandStack = [[NSMutableArray alloc]init];//lazy intiatiator
        
    }
    
    return _operandStack;
}



//εως εδω η δουκεια του synthesize..(ο setter δεν εχει τιποτα ιδιεταιρο οποτε αφηνω το synthesize να το φτιαξει μονο του..)




-(void)pushOperand:(double)operand{
    
    // επειδη το operandStack ειναι αντικειμενο και οχι double
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    
    //το operandStack εχει στην αρχη Nil και δεν θα δουλευε, δες στον getter
    [self.operantStack addObject:operandObject];// μαλλον η addObject θα αυξανει τον δεικτη κατα 1..
}

-(double) popOperand{
    
    NSNumber *operandObject=[self.operantStack lastObject];
    
    if (operandObject) {
        [self.operantStack removeLastObject];//για να κανει pop..
    }
    
    return [operandObject doubleValue];
    //ολα τα αντικειμενα στο operandStack ειναι NSNumbers και αυτα ανταποκρινοντε
    //στη μεθοδο που επιστρεφει double
    
}



-(double)performOperation:(NSString *)operation{
 
    double result=0;

    if ([operation isEqualToString:@"+"]) {
        result= [self popOperand] + [self popOperand];
    }
    else if([operation isEqualToString:@"*"]){
        result=[self popOperand]*[self popOperand];
    }
    else if([operation isEqualToString:@"-"]){
        double aferetis=[self popOperand];
        result=[self popOperand]-aferetis;
    }
    else if([operation isEqualToString:@"/"]){
        double dieretis=[self popOperand];
        if(dieretis){//αν δεν ειναι 0 κανε διαιρεση..
            result=[self popOperand]/dieretis;
        }
    }
    [self pushOperand:result];//βαζω το αποτελεσμα στην στηβα γιατι μπορει να
    //μας ξαναχρειαστει στις επομενες πραξεις
    
    return result;
  
    
}



@end
