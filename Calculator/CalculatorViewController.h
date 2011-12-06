//
//  CalculatorViewController.h
//  Calculator
//
//  Created by spiros kalimeris on 01/12/2011.
//  Copyright (c) 2011 ntua. All rights reserved.
//

#import <UIKit/UIKit.h>

//          ονομα κλασης            : υπερκλαση
@interface CalculatorViewController : UIViewController

//                           δεικτης σε object  ονομα
@property (weak, nonatomic) IBOutlet UILabel *display;
// με κλικ στην τελεια εμφανιζονται τα story boards
// ( για i phone i pad κτλ)

@end
