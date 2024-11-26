//
//  ViewController.m
//  Objectove-C-Compression
//
//  Created by Angelos Staboulis on 26/11/24.
//

#import "ViewController.h"
#import "compression.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_phrase setEditable:FALSE];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)btnCompress:(id)sender {
    NSString *phrase =@"Lorem ipsum dolor sit amet consectetur adipiscing elit mi\n"
    "nibh ornare proin blandit diam ridiculus, faucibus mus\n"
    "dui eu vehicula nam donec dictumst sed vivamus bibendum\n"
    "aliquet efficitur. Felis imperdiet sodales dictum morbi\n"
    "vivamus augue dis duis aliquet velit ullamcorper porttitor,\n"
    "lobortis dapibus hac purus aliquam natoque iaculis blandit\n"
    "montes nunc pretium.";
    compression_algorithm algorithm = COMPRESSION_LZFSE;
    NSData *sourceData = [phrase dataUsingEncoding:NSUTF8StringEncoding];
    const uint8_t *sourceBuffer = sourceData.bytes;
    size_t sourceLength = sourceData.length;

    uint8_t *destinationBuffer = (uint8_t *)malloc(sourceLength);
    size_t compressedSize = compression_encode_buffer(destinationBuffer, sourceLength, sourceBuffer, sourceLength, NULL, algorithm);
        
    if (compressedSize == 0) {
            NSLog(@"Encoding failed.");
    }
    NSString *originalSize = [NSString stringWithFormat:@"Original size: %zu | Compressed size: %zu",sourceLength, compressedSize];
    [_originalSizeLbl setStringValue:originalSize];
    free(destinationBuffer);
}
@end
