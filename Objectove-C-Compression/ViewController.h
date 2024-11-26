//
//  ViewController.h
//  Objectove-C-Compression
//
//  Created by Angelos Staboulis on 26/11/24.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (unsafe_unretained) IBOutlet NSTextView *phrase;
@property (nonatomic) size_t compressedSize;
- (IBAction)btnCompress:(id)sender;
@property (weak) IBOutlet NSTextField *originalSizeLbl;

@end

