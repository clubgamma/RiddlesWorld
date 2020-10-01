import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
class math1HomeScreen extends StatefulWidget { 
  @override
  _math1HomeScreenState createState() =>  _math1HomeScreenState();
}

class _math1HomeScreenState  extends State<math1HomeScreen> {
  int number;
  bool _isScore=false;
  int totalScore=0;

  void resetHanlder() {
    setState(() {
      totalScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'Funny Subtraction',
      body: _isScore?
      Result(totalScore, 1, resetHanlder,'/mathPage')
      :Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.6),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'HOW MANY TIMES CAN YOU SUBTRACT THE NUMBER 5 FROM 25?',
                              style: TextStyle(fontSize: 15),
                            ))),
                  ),
                          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.6),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                           TextField(
                             decoration: InputDecoration(
                               labelText: 'Answer',
                               hintText: 'Enter answer in numbers!!'
                             ),
                             keyboardType: TextInputType.number,
                             onChanged: (value)=>number=int.parse(value),
                           ),
                              SizedBox(height: 60,),
                              Padding(
            padding: const EdgeInsets.only(top:10.0, right: 10, left: 10),
            child: InkWell(
              onTap: (){
                 if(number == 1){
                                  
                                   setState(() {
                                     totalScore=1;
                                  _isScore=true;
                                });
                                }
                                else{
                                  return;
                                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.6), color: Colors.transparent),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'SUBMIT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
                             
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}