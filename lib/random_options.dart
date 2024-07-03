class RandomOptions{
  final int number_A;
  final int number_B;
  RandomOptions( this.number_A,this.number_B);
   List<int> randomList(){

     int sum = number_A + number_B;
     List<int> options = [];
     options.add(sum);
     options.add(sum+(sum%4)+2);
     options.add(sum+(sum%4)+4);
     options.add(sum +(sum%4)+3);
     options.shuffle();
     return options;
   }
}