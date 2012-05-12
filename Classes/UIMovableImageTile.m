//
//  UIMovableImageTile.m
//  TilePoet
//
//  Created by Shriniwas Kulkarni on 9/19/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "UIMovableImageTile.h"
#import "Hand.h"

static CGRect swapWidthAndHeight(CGRect rect)
{
    CGFloat  swap = rect.size.width;
    
    rect.size.width  = rect.size.height;
    rect.size.height = swap;
    
    return rect;
}


@implementation UIMovableImageTile
@synthesize tileText;


- (id)initWithHands:(Hand*) upper lowerHand:(Hand*) lower {
	float xOrig0 = 0;
	float xWidth = 25.0;
	float handsWidth = 125.00;
	float handsHeight = 100.00;
	
	CGRect imageFrame =  CGRectMake(0, 0, handsWidth, handsHeight);
	if (self = [super initWithFrame:imageFrame]) {

		CGColorSpaceRef colorSpace= CGColorSpaceCreateDeviceRGB();

		CGContextRef context = CGBitmapContextCreate(NULL, handsWidth, handsHeight, 8, 4*handsWidth, colorSpace, kCGImageAlphaPremultipliedLast);

		// First show low hand
		Domino* drawnTile = (Domino *) lower.tileOne;
		NSString *tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
		UIImage* image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f];
		
		CGContextDrawImage(context, CGRectMake(xOrig0, xOrig0 + 10 ,image.size.width , image.size.height), image.CGImage);
		
		// Second		
		drawnTile = (Domino *) lower.tileTwo;
		tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
		image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f];		
		CGContextDrawImage(context, CGRectMake(xOrig0 + xWidth, xOrig0 + 10 ,image.size.width , image.size.height), image.CGImage);
		
		
		// Then show high hand
		// Third
		drawnTile = (Domino *) upper.tileOne;
		tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
		image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f];
		UIImage* rotatedImg = [self rotateImg:image orientation:UIImageOrientationLeft];
		CGContextDrawImage(context, CGRectMake(xOrig0 + 2 * xWidth, xOrig0 + 12,image.size.height , image.size.width), rotatedImg.CGImage);
		
		// Last
		drawnTile = (Domino *) upper.tileTwo;
		tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
		image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f];
		rotatedImg = [self rotateImg:image orientation:UIImageOrientationLeft];
		CGContextDrawImage(context, CGRectMake(xOrig0 + 2 * xWidth, xOrig0 + xWidth + 12 ,image.size.height , image.size.width), rotatedImg.CGImage);
		
		CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1);
		NSString* dispString = [NSString stringWithFormat:@"%@ / %@", [upper getHandDisplay],[lower getHandDisplay]];

		char* text = (char *)[dispString cStringUsingEncoding:NSASCIIStringEncoding];
		CGContextSelectFont(context, "Arial", 12, kCGEncodingMacRoman);
		CGContextSetTextDrawingMode(context, kCGTextFill);
		CGContextSetRGBFillColor(context, 0.1,0.1,0.1,1);
		
		CGContextShowTextAtPoint(context, 22,0, text, strlen(text));
		CGImageRef imageMasked = CGBitmapContextCreateImage(context);		
		CGContextRelease(context);
		CGColorSpaceRelease(colorSpace);
		
		UIImage *newImage =  [UIImage imageWithCGImage:imageMasked]  ;
	
		[self initWithImage:newImage];		
	}
    return self;
}

// Quick non proportional scale
// Quick non proportional scale
-(UIImage*) getScaledImage:(UIImage *) sourceImage scaleBy:(float) fraction {
	
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	
	CGRect thumbnailRect = CGRectZero;
	
	thumbnailRect.size.width  = imageSize.width *  0.18f;
	thumbnailRect.size.height = imageSize.height *  0.18f;
	UIGraphicsBeginImageContext(CGSizeMake(thumbnailRect.size.width, thumbnailRect.size.height));
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
	
}

- (UIImage*) rotateImage:(UIImage*) sourceImage {
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	CGRect thumbnailRect = CGRectZero;
	
	thumbnailRect.size.width  = imageSize.width ;
	thumbnailRect.size.height = imageSize.height;
	UIGraphicsBeginImageContext(CGSizeMake(thumbnailRect.size.width, thumbnailRect.size.height));

	CGAffineTransform tran = CGAffineTransformIdentity;
	
	//tran = CGAffineTransformMakeTranslation(rect.size.height, 0.0);
	tran = CGAffineTransformRotate(tran, M_PI / 2.0);
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

-(UIImage*)rotateImg:(UIImage*) src orientation:(UIImageOrientation)orient
{
    CGRect             bnds = CGRectZero;
    UIImage*           copy = nil;
    CGContextRef       ctxt = nil;
    CGImageRef         imag = src.CGImage;
    CGRect             rect = CGRectZero;
    CGAffineTransform  tran = CGAffineTransformIdentity;
	
    rect.size.width  = CGImageGetWidth(imag);
    rect.size.height = CGImageGetHeight(imag);
    
    bnds = rect;
    
    switch (orient)
    {
        case UIImageOrientationUp:
			// would get you an exact copy of the original
			assert(false);
			return nil;
			
        case UIImageOrientationUpMirrored:
			tran = CGAffineTransformMakeTranslation(rect.size.width, 0.0);
			tran = CGAffineTransformScale(tran, -1.0, 1.0);
			break;
			
        case UIImageOrientationDown:
			tran = CGAffineTransformMakeTranslation(rect.size.width,
													rect.size.height);
			tran = CGAffineTransformRotate(tran, M_PI);
			break;
			
        case UIImageOrientationDownMirrored:
			tran = CGAffineTransformMakeTranslation(0.0, rect.size.height);
			tran = CGAffineTransformScale(tran, 1.0, -1.0);
			break;
			
        case UIImageOrientationLeft:
			bnds = swapWidthAndHeight(bnds);
			tran = CGAffineTransformMakeTranslation(0.0, rect.size.width);
			tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
			break;
			
        case UIImageOrientationLeftMirrored:
			bnds = swapWidthAndHeight(bnds);
			tran = CGAffineTransformMakeTranslation(rect.size.height,
													rect.size.width);
			tran = CGAffineTransformScale(tran, -1.0, 1.0);
			tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
			break;
			
        case UIImageOrientationRight:
			bnds = swapWidthAndHeight(bnds);
			tran = CGAffineTransformMakeTranslation(rect.size.height, 0.0);
			tran = CGAffineTransformRotate(tran, M_PI / 2.0);
			break;
			
        case UIImageOrientationRightMirrored:
			bnds = swapWidthAndHeight(bnds);
			tran = CGAffineTransformMakeScale(-1.0, 1.0);
			tran = CGAffineTransformRotate(tran, M_PI / 2.0);
			break;
			
        default:
			// orientation value supplied is invalid
			assert(false);
			return nil;
    }
	
    UIGraphicsBeginImageContext(bnds.size);
    ctxt = UIGraphicsGetCurrentContext();
	
    switch (orient)
    {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
			CGContextScaleCTM(ctxt, -1.0, 1.0);
			CGContextTranslateCTM(ctxt, -rect.size.height, 0.0);
			break;
			
        default:
			CGContextScaleCTM(ctxt, 1.0, -1.0);
			CGContextTranslateCTM(ctxt, 0.0, -rect.size.height);
			break;
    }
	
    CGContextConcatCTM(ctxt, tran);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), rect, imag);
    
    copy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return copy;
}



/*
- (id)initWithImg:(UIImage *)tileImage txt:(NSString *)tileTextIn origin:(CGPoint) tileCenter {
	

	 -(NSComparisonResult)compareX:(UIMovableImageTile*) otherObject {
	 return (self.frame.origin.x > otherObject.frame.origin.x)? NSOrderedDescending : NSOrderedAscending ;
	 }
	 
	 - (NSComparisonResult)compareY:(UIMovableImageTile*) otherObject {
	 return (self.frame.origin.y > otherObject.frame.origin.y)? NSOrderedDescending : NSOrderedAscending;
	 }
	 
	 
	
	// TODO make these parameterized

	tileHeight = 40;
	alphabetWidth = 14; // varies with size
	tileTextFontSize = 24;
	
	
	self.tileText = tileTextIn;
	float width = [tileText length];
	CGRect imageFrame =    CGRectMake(20.0, 20.0, 10.0 + width*alphabetWidth, tileHeight);

	
    if (self = [super initWithFrame:imageFrame]) {

		int w = imageFrame.size.width;
		int h = imageFrame.size.height;
		
		CGColorSpaceRef colorSpace= CGColorSpaceCreateDeviceRGB();
		
		CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4*w, colorSpace, kCGImageAlphaPremultipliedFirst);
		
		CGContextDrawTiledImage(context, CGRectMake(0,0, w, h), tileImage.CGImage);
		CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1);
		char* text = (char *)[ tileText cStringUsingEncoding:NSASCIIStringEncoding];
		CGContextSelectFont(context, "Courier-Bold", tileTextFontSize, kCGEncodingMacRoman);
		CGContextSetTextDrawingMode(context, kCGTextFill);
		CGContextSetRGBFillColor(context, 0.1,0.1,0.1,1);
		
		CGContextShowTextAtPoint(context, 4, 9, text, strlen(text));
		CGImageRef imageMasked = CGBitmapContextCreateImage(context);
		CGContextRelease(context);
		CGColorSpaceRelease(colorSpace);
		UIImage *image =  [UIImage imageWithCGImage:imageMasked]  ;
		
		[self.layer setBorderColor: [[UIColor blackColor] CGColor]];
		[self.layer setBorderWidth: 2.0];

		[self initWithImage:image];
		self.alpha = 0.7;
	 
    }

 return self;
 }
 */







/*

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   // NSLog(@"-- I AM TOUCHED in class --");
	CGPoint pt = [[touches anyObject] locationInView:self];
	
	startPoint = pt;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	int laneHeight = (1.5*tileHeight); // depends on tile height so add member var in class later
	CGRect frame = [self frame];
	float laneNumber = 	round((frame.origin.y + tileHeight) / laneHeight);
	
	frame.origin.y = (laneNumber * laneHeight) - tileHeight + 5.0;
	if(frame.origin.y < 0) {
		frame.origin.y = 5.0;
	}


	NSLog(@"-- I AM TOUCHED end in class --");
		[self setFrame:frame];
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event{
	
	// Move relative to the original touch point
	CGPoint pt = [[touches anyObject] locationInView:self];
	CGRect frame = [self frame];

	frame.origin.x += pt.x - startPoint.x;
	frame.origin.y += pt.y - startPoint.y;
	[self setFrame:frame];
}

*/

- (void)dealloc {
    [super dealloc];
}

-(void) printText{
	NSLog(tileText);
}

@end
