import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/Round_Icon.dart';
import '../components/buttom_button.dart';
import 'package:bmi_calculator/calculated_brain.dart';

enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 80;
  int age = 19;
//   replaced by ternary operator
//   Color maleCardColor = inActiveCardColor;
//   Color femaleCardColor = inActiveCardColor;
// void updateColor (Gender selectedGender){
//
//
//
//   if (selectedGender==Gender.male){
//   if(maleCardColor==inActiveCardColor){
//   maleCardColor = activeCardColor;
//   femaleCardColor = inActiveCardColor;
//   }else{
//    maleCardColor = inActiveCardColor;
//   }
//   }
//
//   if (selectedGender==Gender.female){
//   if(femaleCardColor==inActiveCardColor){
//    femaleCardColor=activeCardColor;
//   maleCardColor = inActiveCardColor;
//   }else{
//   femaleCardColor=inActiveCardColor;
//   }
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Center(child: Center(child: Text('BMI CALCULATOR'))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
                children: <Widget>[
                  //male
                  Expanded(child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colours: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,

                    cardChild: IconContent(icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                  ),


                  //female
                  Expanded(child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender =Gender.female;
                      });
                    },
                    colours: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),),
                ]
            ),
            ),



            Expanded(child: ReusableCard(

              colours: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text('Height',
                    style: kLabelText,
                  ),Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Text(height.toString(),

                      style: kNumberTextStyle
                      ),

                      Text('cm',
                      style: kLabelText,

                      ),
                    ],
                  ),
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                  ),
                    child: Slider(
                            value: height.toDouble(),
                      //activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                              setState(() {
                                height= newValue.round();
                              });
                      },
                    ),
                  ),
                ],
              ),
            )),
            Expanded(child: Row(
              children: <Widget>[

                Expanded(child: ReusableCard(
                  colours: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Weight',
                      style: kLabelText,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                        setState(() {
                          weight--;
                        });
                          },

                      ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight ++;
                            });
                          },
                          ),
                    ],
                  ),
                    ],
                  ),
                )),
                Expanded(child: ReusableCard(
                  colours: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age',
                      style: kLabelText,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){

                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          })

                        ],
                      )

                    ],
                  ),
                )),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatedBrain cal = CalculatedBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                bmiResult:cal.calculateBMI(),
                interpretation: cal.getInterpretation(),
                resultText: cal.getResult(),

              )));
            },
            )
          ],
        )
    );
  }
}





