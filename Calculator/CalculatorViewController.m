//
//  CalculatorViewController.m
//  Calculator
//
//  Created by spiros kalimeris on 01/12/2011.
//  Copyright (c) 2011 ntua. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"//εισαγω το model μου!!!

//για private μεθοδους
@interface CalculatorViewController() 

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong)CalculatorBrain *brain;//ενας δεικτης απο τον controller στο model


@end


@implementation CalculatorViewController

@synthesize display;// εδω δημιουργησαμε τα setter & getter του display
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain=_brain;


-(CalculatorBrain *)brain{
    if(! _brain) _brain=[[CalculatorBrain alloc]init];
    return _brain;
                         
}



//το IBAction ειναι σαν void (για να ξεχωριζει το action method)
// το (id) σημαινει οτι ΔΕΙΚΤΗΣ σε αντικειμενο ποιασδηποτε κλασης (διαφ 55) και ειναι βολικο
//το αλλαζουμε απο (id)sender σε (UIButton *)sender

- (IBAction)digitPressed:(UIButton *)sender {
    
    
    //θα μπορουσαμε να πουμε  id digit αλλα προτημαμε τo static typing
    //ΠΡΟΣΟΧΗ στα object αναφερομαστε με ΔΕΙΚΤΕΣ
    
    // θελω να παρω μια τιμη ,θα πρεπει να στηλω το μηνυμα στο 
    //object sender,  currentTitle που μου δινει το text του
    
    //τα UIButtons αντικειμενα με το currenTitle επιστρεφουν το
    //NSString που εχει τον τιτλο τους
    
    NSString *digit =[sender currentTitle];
 
    //το NSLog ειναι κστι σαν printf και τυπωνει στο console
   // NSLog(@"ο χρηστης πατησε %@",digit);
    // το @ ειναι για να τυπωσει object
    //για την ακριβεια στελνει το μηνυμα description στο object
    //και επιστρεφε NSString και τα τυπωνει σαν string
    
    
    
    //για να εμφανισουμε αυτο που πατησαμε στην οθονη..
    //το self ειναι ΔΕΙΚΤΗΣ στον εαυτο του
    //κληση μεθοδου display @property getter
    //αρα στελνω μηνυμα στο self , το display
    
    //UILabel *myDisplay = self.display ;//[self display]; πηρα τον δεικτη στο diplay μου
    
    //και τωρα ρωταω το τρεχον κειμενο του
   // NSString *currentDisplayText =myDisplay.text; //[myDisplay text]; γιατι ειναι @property (διαφανεια 102)  
    
    //ΚΑΙ ΤΕΛΙΚΑ ΜΠΟΡΟΥΜΕ ΝΑ ΧΡΗΣΗΜΟΠΟΗΣΟΥΜΕ->
    /// NSString *currentDisplayText =self.display.text;//(1) βρησκουμε δεικτη στο τρεχων κειμενο
    
   // NSString *newDisplayText =[currentDisplayText stringByAppendingString:digit];
    
   // self.display.text = newDisplayText; //[self.display setText:newDisplayText];το setText ειναι setter 
    
    // ή ποιο μαζεμενα χωρις την newDisplayText
    /// self.display.text = [currentDisplayText stringByAppendingString:digit];// (2)
    
    // απο γραμμες (1) και (2) προκειπτει ΤΕΛΙΚΑ self.display.text = [self.display.text stringByAppendingString:digit];    
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        //και οσο θα ειμαι στην μεση πληκτρ. εκχωρισε τα νεα νουμερα
        self.display.text = [self.display.text stringByAppendingString:digit]; 
    
    }
    else{
        self.display.text = digit;//αν δεν ειμαι στην μεση της πληκτρ. ΒΑΛΕ οτι πατησα
        self.userIsInTheMiddleOfEnteringANumber =YES;//πλεον ειμαι στην μεση πληκτρ..
    }
}//τελος της digitPressed μεθοδου


- (IBAction)enterPressed { //δεν εχει ορισμα εισοδου(διαφανεια149)
    
    [self.brain pushOperand:[self.display.text doubleValue]];
    //δηλ. του λεω: αυτο που δειχνεις στην οθονη καντο double και στηλτο 
    //στην μεθοδο pushOperand στο model μου..
    
    self.userIsInTheMiddleOfEnteringANumber=NO;
}


- (IBAction)operationPressed:(id)sender{    //(UIButton *)sender{ 
    
    if(self.userIsInTheMiddleOfEnteringANumber){
        [self enterPressed];//αν ειχες πατησει το τελευταιο νουμερο και ξεχασες
        //να πατησεις το Enter,δεν πειραζει.. στο παταμε εμεις για σενα!!!
    }
    
    NSString *operation=[sender currentTitle];//παιρνω σε string το operation
    double result=[self.brain performOperation:operation];//και την στελνω στην
    //καταλληλη μεθοδο στο model μου
    self.display.text=[NSString stringWithFormat:@"%g",result];//και εμφανιζει
    //το αποτελεσμα αφου πρωτα το μετατρεψει σε string
    
}//τελος της operationPressed


@end
