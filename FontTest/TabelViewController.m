//
//  TabelViewController.m
//  FontTest
//
//  Created by Ammar on 12/16/13.
//  Copyright (c) 2013 30Million. All rights reserved.
//

#import "TabelViewController.h"
#import "TabelCell.h"
@interface TabelViewController ()
@property (nonatomic, strong) TabelCell *cellPrototype;
@property NSArray *quotes, *names; //for dummy content
@end

@implementation TabelViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    static NSString *CellIdentifier = @"CustomCell"; [self.tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
self.cellPrototype = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    //fill dummy content
    self.quotes = [NSArray arrayWithObjects:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla hendrerit quam eu nisl pellentesque aliquam.", @"Vestibulum ligula quam, gravida ut convallis semper, bibendum in turpis.", @"Nam quis sapien purus.", @"Donec suscipit lectus in arcu eleifend ac posuere lacus egestas. Nunc gravida quam in urna ultricies at pharetra magna sodales. Nulla placerat mi tincidunt nulla posuere id interdum mi pretium. Aliquam nulla tortor, egestas pharetra sollicitudin a, sagittis ut enim. Vivamus venenatis consectetur commodo.", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla hendrerit quam eu nisl pellentesque aliquam. Vestibulum ligula quam, gravida ut convallis semper, bibendum in turpis. Nam quis sapien purus. Nunc tincidunt eleifend porta. Donec suscipit lectus in arcu eleifend ac posuere lacus egestas. Nunc gravida quam in urna ultricies at pharetra magna sodales.", nil];
    
    self.names = [NSArray arrayWithObjects:@"Sam Rayner", @"Sam Millner", @"Rob White", @"Dom Wroblewski", @"Jack Smith", nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.quotes count];
}
- (NSString *)quotationTextForRow:(int)row {
    return [self.quotes objectAtIndex:row];
}

- (NSString *)attributionTextForRow:(int)row {
    return [@"– " stringByAppendingString:[self.names objectAtIndex:row]];
}

- (CGSize)sizeOfLabel:(UILabel *)label withText:(NSString *)text {
   // return [text sizeWithFont:label.font constrainedToSize:label.frame.size lineBreakMode:label.lineBreakMode];
    return [text boundingRectWithSize:label.frame.size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName: label.font} context:nil].size;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //set width depending on device orientation
    self.cellPrototype.frame = CGRectMake(self.cellPrototype.frame.origin.x, self.cellPrototype.frame.origin.y, tableView.frame.size.width, self.cellPrototype.frame.size.height);
    
    CGFloat quotationLabelHeight = [self sizeOfLabel:self.cellPrototype.quotationLabel withText:[self quotationTextForRow:indexPath.row]].height;
    CGFloat attributionLabelHeight = [self sizeOfLabel:self.cellPrototype.attributionLabel withText:[self attributionTextForRow:indexPath.row]].height;
    CGFloat padding = self.cellPrototype.quotationLabel.frame.origin.y;
    
    CGFloat combinedHeight = padding + quotationLabelHeight + padding/2 + attributionLabelHeight + padding;
   // CGFloat minHeight = padding + self.cellPrototype.avatarButton.frame.size.height + padding;
    
    //return MAX(combinedHeight, minHeight);
    return combinedHeight;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //register cell identifier from custom cell NIB
    static NSString *CellIdentifier = @"CustomCell";
    TabelCell *cell = (TabelCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //set width depending on device orientation
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, tableView.frame.size.width, cell.frame.size.height);
    
    CGFloat quotationLabelHeight = [self sizeOfLabel:cell.quotationLabel withText:[self quotationTextForRow:indexPath.row]].height;
    CGFloat attributionLabelHeight = [self sizeOfLabel:cell.attributionLabel withText:[self attributionTextForRow:indexPath.row]].height;
    
    cell.quotationLabel.frame = CGRectMake(cell.quotationLabel.frame.origin.x, cell.quotationLabel.frame.origin.y, cell.quotationLabel.frame.size.width, quotationLabelHeight);
    cell.quotationLabel.text = [self quotationTextForRow:indexPath.row];
    
    cell.attributionLabel.frame = CGRectMake(cell.attributionLabel.frame.origin.x, cell.attributionLabel.frame.origin.y, cell.attributionLabel.frame.size.width, attributionLabelHeight);
    cell.attributionLabel.text = [self attributionTextForRow:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
