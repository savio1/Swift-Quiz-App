//
//  ViewController.swift
//  Quiz_App
//
//  Created by Savio Neyyan on 2017-06-11.
//  Copyright © 2017 Savio Neyyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questLabel: UILabel! //Question
    @IBOutlet weak var Button1: UIButton! //Button1
    @IBOutlet weak var Button2: UIButton! //Button2
    @IBOutlet weak var Button3: UIButton! //Button3
    @IBOutlet weak var Button4: UIButton! //Button4
    @IBOutlet weak var nextQuestionButton: UIButton! //Next Question Button
    @IBOutlet weak var outLabel: UILabel! //Either Congrats or loser
    @IBOutlet weak var allDoneButton: UIButton! //Check Score
    @IBOutlet weak var SecondsLabel: UILabel!
    
    var correctAnswer = String();
    var congrats="Good Job !";
    var loser="Wrong Answer, Better Luck Next Time!";
    var previousNumber=arc4random_uniform(10);
    var count=0;
    var score=0;
    var seconds=15;
    var timer=NSTimer();

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RandomQuestions(randomNumber());
        Hide();
        timer=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        seconds-=1;
        SecondsLabel.text=String(seconds);
        
        if(seconds==0)
        {
           StopTimer()
            nextQuestionButton.sendActionsForControlEvents(.TouchUpInside);
        }
        if(seconds==0 && count==9){
            StopTimer()
            allDoneButton.sendActionsForControlEvents(.TouchUpInside);
        }
    }
    func StopTimer(){
        timer.invalidate();
        seconds=15;
        SecondsLabel.hidden=true;
        SecondsLabel.text=String(seconds);
        
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: ViewTwo=segue.destinationViewController as! ViewTwo;
        let score_text=String(score);
        DestViewController.scoreText=score_text;
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RandomQuestions(randomNum: UInt32)->(){
        
        switch(randomNum){
        
            case 0:
                questLabel.text="How did Spiderman get his powers?";
                Button1.setTitle("Spider Parents", forState: UIControlState.Normal);
                Button2.setTitle("Radioactive Rays", forState: UIControlState.Normal);
                Button3.setTitle("Spider Bite", forState: UIControlState.Normal);
                Button4.setTitle("From Madame Web", forState: UIControlState.Normal);
                correctAnswer="3";

                break;
            case 1:
                questLabel.text="The average person does this thing 13 times a day";
                Button1.setTitle("Laughs", forState: UIControlState.Normal);
                Button2.setTitle("Goes to the Washroom", forState: UIControlState.Normal);
                Button3.setTitle("Drinks Water", forState: UIControlState.Normal);
                Button4.setTitle("Eats Chicken", forState: UIControlState.Normal);
                correctAnswer="1";
                
                break;
            case 2:
                questLabel.text="What is the Capital of Africa?";
                Button1.setTitle("Pretoria", forState: UIControlState.Normal);
                Button2.setTitle("Accra", forState: UIControlState.Normal);
                Button3.setTitle("Cairo", forState: UIControlState.Normal);
                Button4.setTitle("Ukraine", forState: UIControlState.Normal);
                correctAnswer="1";
                
                break;
            case 3:
                questLabel.text="Which one of these is the biggest island on Earth?";
                Button1.setTitle("Borneo", forState: UIControlState.Normal);
                Button2.setTitle("Great Britain", forState: UIControlState.Normal);
                Button3.setTitle("Greenland", forState: UIControlState.Normal);
                Button4.setTitle("Madagascar", forState: UIControlState.Normal);
                correctAnswer="3";
                break;
        case 4:
            questLabel.text="Which one is the largest ocean on earth?";
            Button1.setTitle("Pacific", forState: UIControlState.Normal);
            Button2.setTitle("Arctic", forState: UIControlState.Normal);
            Button3.setTitle("Atlantic", forState: UIControlState.Normal);
            Button4.setTitle("Indian", forState: UIControlState.Normal);
            correctAnswer="1";
            break;
        case 5:
            questLabel.text="Which one is the longest river on Earth? ";
            Button1.setTitle("Yangtze", forState: UIControlState.Normal);
            Button2.setTitle("Nile", forState: UIControlState.Normal);
            Button3.setTitle("Missouri", forState: UIControlState.Normal);
            Button4.setTitle("Amazon", forState: UIControlState.Normal);
            correctAnswer="4";
            break;
        case 6:
            questLabel.text="What kind of government does China have?";
            Button1.setTitle("Republic", forState: UIControlState.Normal);
            Button2.setTitle("Democracy", forState: UIControlState.Normal);
            Button3.setTitle("Dictatorship", forState: UIControlState.Normal);
            Button4.setTitle("Monarchy", forState: UIControlState.Normal);
            correctAnswer="3";
            break;
        case 7:
            questLabel.text="What is Iron Man's best armour";
            Button1.setTitle("Kree Armour", forState: UIControlState.Normal);
            Button2.setTitle("Symbiote Armour", forState: UIControlState.Normal);
            Button3.setTitle("Mark Infinity Armour", forState: UIControlState.Normal);
            Button4.setTitle("Electro Armour", forState: UIControlState.Normal);
            correctAnswer="2";
            break;
        case 8:
            questLabel.text="What is the name of Superior Spiderman?";
            Button1.setTitle("Miles Morales", forState: UIControlState.Normal);
            Button2.setTitle("Flash Thompson", forState: UIControlState.Normal);
            Button3.setTitle("Peter Parker", forState: UIControlState.Normal);
            Button4.setTitle("Dr. Octopus", forState: UIControlState.Normal);
            correctAnswer="4";
            break;
        case 9:
            questLabel.text="What is Captain America's real name?";
            Button1.setTitle("Steve Rogers", forState: UIControlState.Normal);
            Button2.setTitle("Chris Evans", forState: UIControlState.Normal);
            Button3.setTitle("Steve Carter", forState: UIControlState.Normal);
            Button4.setTitle("None of the Above", forState: UIControlState.Normal);
            correctAnswer="1";
            break;
        case 10:
            questLabel.text="Who became the new Captain America after the original died";
            Button1.setTitle("Baron Zemo", forState: UIControlState.Normal);
            Button2.setTitle("Falcon", forState: UIControlState.Normal);
            Button3.setTitle("The Winter Soldier", forState: UIControlState.Normal);
            Button4.setTitle("Spiderman", forState: UIControlState.Normal);
            correctAnswer="2";
            break;
        case 11:
            questLabel.text="Who is Batman's dad?";
            Button1.setTitle("Peter Wayne", forState: UIControlState.Normal);
            Button2.setTitle("Joe Chill", forState: UIControlState.Normal);
            Button3.setTitle("Alfred Pennyworth", forState: UIControlState.Normal);
            Button4.setTitle("Thomas Wayne", forState: UIControlState.Normal);
            correctAnswer="4";
            break;
        case 12:
            questLabel.text="Where does the Flash's power come from?";
            Button1.setTitle("Negative Force", forState: UIControlState.Normal);
            Button2.setTitle("Light Force", forState: UIControlState.Normal);
            Button3.setTitle("Lighting Energy", forState: UIControlState.Normal);
            Button4.setTitle("Speed Force", forState: UIControlState.Normal);
            correctAnswer="4";
            break;
        case 13:
            questLabel.text="Who is the original Flash of the DC Universe?";
            Button1.setTitle("Barry Allen", forState: UIControlState.Normal);
            Button2.setTitle("Jay Garrick", forState: UIControlState.Normal);
            Button3.setTitle("Wally West", forState: UIControlState.Normal);
            Button4.setTitle("Bart Allen", forState: UIControlState.Normal);
            correctAnswer="2";
            break;
        case 14:
            questLabel.text="What is Superman's weakness?";
            Button1.setTitle("Gold Kryptonite", forState: UIControlState.Normal);
            Button2.setTitle("Kryptonite", forState: UIControlState.Normal);
            Button3.setTitle("Magic", forState: UIControlState.Normal);
            Button4.setTitle("All of the Above", forState: UIControlState.Normal);
            correctAnswer="4";
            break;
        case 15:
            questLabel.text="Who is Batman'sreal son";
            Button1.setTitle("Dick Grayson", forState: UIControlState.Normal);
            Button2.setTitle("Damian Wayne", forState: UIControlState.Normal);
            Button3.setTitle("Michael Wayne", forState: UIControlState.Normal);
            Button4.setTitle("Frank Wayne", forState: UIControlState.Normal);
            correctAnswer="4";
            break;

            
            default:
                break;
        }
    }
    
    func Hide(){
        outLabel.alpha=0.0;
        nextQuestionButton.alpha=0.0;
        allDoneButton.alpha=0.0;
    }
    func UnHide(){
        UIView.animateWithDuration(0.3, animations: {
            self.outLabel.alpha=1.0;
            self.nextQuestionButton.alpha=1.0;
        })
    }
    @IBAction func Button1Action(sender: AnyObject) {
        StopTimer();
        if (correctAnswer=="1"){
            outLabel.text=congrats;
            score++;
            }
        else {
            outLabel.text=loser;
        }
        if (count==9){
            UIView.animateWithDuration(0.3, animations: {self.allDoneButton.alpha=1.0});
            }
        else{
            UnHide();
        }
    }
    
    @IBAction func Button2Action(sender: AnyObject) {
    StopTimer();
        if (correctAnswer=="2"){
            outLabel.text=congrats;
            score++;
            }
        else {
            outLabel.text=loser;
        }
        if (count==9){
            UIView.animateWithDuration(0.3, animations: {self.allDoneButton.alpha=1.0});
            }
        else{
        UnHide();
        }
    }
    
    @IBAction func Button3Action(sender: AnyObject) {
  StopTimer();
        if (correctAnswer=="3"){
            outLabel.text=congrats;
            score++;
            }
        else {
            outLabel.text=loser;
            }
        if (count==9){
            UIView.animateWithDuration(0.3, animations: {self.allDoneButton.alpha=1.0});
        }
        else{
        UnHide();
        }
    }
    
    @IBAction func Button4Action(sender: AnyObject) {
        StopTimer();
        if (correctAnswer=="4"){
            outLabel.text=congrats;
            score++;
            }
        else {
            outLabel.text=loser;
        }
        if (count==9){
            UIView.animateWithDuration(0.3, animations: {self.allDoneButton.alpha=1.0});
            }
        else{
        UnHide();
        }
    }
    
    @IBAction func NextQuestionButtonAction(sender: AnyObject){
        RandomQuestions(randomNumber());
        Hide();
        SecondsLabel.hidden=false;
        timer=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        count++;
        }
    
    func randomNumber()->UInt32{
        var randomNumber=arc4random_uniform(15);
        while previousNumber==randomNumber{
            randomNumber=arc4random_uniform(15);
        }
        previousNumber=randomNumber;
        return randomNumber
        }
    }


