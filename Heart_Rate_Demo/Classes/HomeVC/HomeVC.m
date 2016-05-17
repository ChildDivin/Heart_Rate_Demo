//
//  HomeVC.m
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "HomeVC.h"
#import "AlertView.h"
#import "Global.h"
#import "Singleton.h"

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DetectVCObj = [[DetectVC alloc] initWithNibName:@"DetectVC" bundle:nil];
    
    btnSelectAge.layer.borderColor = [UIColor blackColor].CGColor;
    btnSelectAge.layer.borderWidth = 1.0;
    
    tblAge.layer.borderColor = [UIColor blackColor].CGColor;
    tblAge.layer.borderWidth = 1.0;
    
    [btnMale setImage:[UIImage imageNamed:@"unselect_chek_box.png"] forState:UIControlStateNormal];
    [btnMale setImage:[UIImage imageNamed:@"select_chek_box.png"] forState:UIControlStateSelected];
    
    [btnFeMale setImage:[UIImage imageNamed:@"unselect_chek_box.png"] forState:UIControlStateNormal];
    [btnFeMale setImage:[UIImage imageNamed:@"select_chek_box.png"] forState:UIControlStateSelected];
    
    arrAge = [[NSArray alloc] initWithObjects:@"18-25", @"26-35", @"36-45",@"46-55", @"56-65", @"65+", nil];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    intSelectedIndex = -1;
    tblAge.hidden = true;
    [self removeSelectionOfGender];
    [btnSelectAge setTitle:@"Select Age" forState:UIControlStateNormal];
}

-(IBAction)btnStartClick:(id)sender {
    if(btnMale.selected == false && btnFeMale.selected == false) {
        [[AlertView sharedAlertView] showAlertWithOKButton:@"Please select your gender"];
    } else if(intSelectedIndex < 0) {
        [[AlertView sharedAlertView] showAlertWithOKButton:@"Please select your age"];
    } else {
        if(intSelectedIndex <= 0) {
            [self calculateAge];
        }
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        if(btnMale.selected) {
            [dict setValue:@"Male" forKey:g_Key_Gender];
        } else {
            [dict setValue:@"Female" forKey:g_Key_Gender];
        }
        [dict setValue:[arrAge objectAtIndex:intSelectedIndex] forKey:g_Key_Age];
        
        [[Singleton sharedSingleton] setDictUserData:dict];
        
        [self.navigationController pushViewController:DetectVCObj animated:true];
    }
}

-(IBAction)btnGenderClick:(id)sender {
    [self removeSelectionOfGender];
    
    UIButton *btn = (UIButton *)sender;
    if(btn.tag == 0)
        btnMale.selected = true;
    else
        btnFeMale.selected = true;
}

-(IBAction)btnSelectAgeClick:(id)sender {
    if(tblAge.hidden)
        tblAge.hidden = false;
    else
        tblAge.hidden = true;
}

#pragma mark -
#pragma mark Table view datasouce & delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrAge.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    cell.textLabel.text = [arrAge objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [btnSelectAge setTitle:[arrAge objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    intSelectedIndex = indexPath.row;
    tblAge.hidden = true;
}

-(void)calculateAge {
    
}

-(void)removeSelectionOfGender {
    btnMale.selected = false;
    btnFeMale.selected = false;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    tblAge.hidden = true;
}

@end
