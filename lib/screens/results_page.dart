import 'package:bmi_calculator/components/constants.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'package:flutter/material.dart';
import '../components/buttom_button.dart';


class ResultsPage  extends StatelessWidget {
  ResultsPage ({ @required this.bmiResult, @required this.interpretation, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
    appBar: AppBar(

    title: Center(child: Text('BMI CALCULATOR '

        ,
    )),

    ),
body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    Expanded(child: Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.bottomCenter,

      child: Text('Your Result',

      style: kTitleStyle,
      ),

    )
    ),
    Expanded(flex: 5,
    child: ReusableCard(colours: kActiveCardColor,
    cardChild: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(resultText.toUpperCase(),
          style: kResultStyle,

        ),
        Text(bmiResult,
        style: kBMIStyle,
        ),
        Text(interpretation,
        style: kBodyTextStyle,
        )
      ],
    ),
    ),
    ),
    BottomButton(buttonTitle: 'RE-CALCULATE',
    onTap: (){
    Navigator.pop(context);
    },
    )
    ],
),


    );
  }
}
