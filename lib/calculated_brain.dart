import 'dart:math';

class CalculatedBrain {
  CalculatedBrain ({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;
  String calculateBMI (){
    double bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }
  String getResult (){
    if( _bmi >= 25){
      return 'Overweight';
    }else if (_bmi > 18.5){
      return 'Normal';

    }else {
      return 'Underweight';
    }
  }
  String getInterpretation (){

    {
      if( _bmi >= 25){
        return 'You have a higher weight than a normal body weight Try to exercise more.';
      }else if (_bmi > 18.5){
        return 'You have a normal weight. Good Job!';

      }else {
        return 'You have a lower weight than a average normal body. You can eat bit more to gain more wait';
      }
    }
  }
}