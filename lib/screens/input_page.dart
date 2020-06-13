import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_content.dart';
import '../components/reusable_card.dart';
import '../components/round_iconbtn.dart';
import 'results_page.dart';
import '../components/botton_button.dart';
import '../constants.dart'; 
import 'package:bmi_calculator/calculator_brain.dart';



enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 19;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      
      body: Column(
       
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                  Expanded(
                     child: ReusableCard(
                       onPress: (){
                         setState(() {
                           selectedGender = Gender.male;
                         });
                       },
                     colour: selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                     cardChild: CardContent(icons: FontAwesomeIcons.mars, textContent: 'MALE'),
                      ),
                ),
                Expanded(
                  child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColor: kInactiveCardColor,
                  cardChild: CardContent(icons: FontAwesomeIcons.venus, textContent: 'FEMALE'),
                     ),
                  ),
            ]
           ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kTextContentStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                       Text('cm', style: kTextContentStyle)
                    ], 
                  ),
                  SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     inactiveTrackColor: Color(0xFF8D8E98),
                     activeTrackColor: Colors.white,
                     thumbColor: Color(0xFFEB1555),
                     overlayColor: Color(0xFFEB1555),
                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
                     overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                   ),
                   child: Slider(
                       value: height.toDouble(),
                       min: 120.0,
                       max: 220.0,
                       onChanged: (double newValue){
                         setState(() {
                           height = newValue.round();
                         });
                       },
                    ),
                  ),
              ],
              ),
              ),
            ),
             Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                  Expanded(
                  child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kTextContentStyle),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  weight++;
                                });
                              }
                              )
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Text('AGE', style: kTextContentStyle),
                       Text(age.toString(), style: kNumberTextStyle),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  age++;
                                });
                              }
                              )
                        ],
                      )
                      ],
                    ),
                    
                    ),
                  ),
            ]
           ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(
               context, 
               MaterialPageRoute(builder: (context) => ResultsPage(
                 bmiResult: calc.calculateBMI(),
                 resultText: calc.getResults(),
                 interpretation: calc.getInterpretation(),
               )),
         );
      }),
        ],
      ),
    );
  }
}


