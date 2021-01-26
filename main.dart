import 'dart:io';

void main() {
  int num;
  List trip=[];
  int numberOfTrip = 0;
  String w;
  do {
    print("Hallo in programme Travel Agency\n "
        "input :1  to Add Trip\n"
        "input :2  to Edit Trip\n"
        "input :3  to Delete Trip\n"
        "input :4  to View Trip\n"
        "input :5  to Search Trip\n"
        "input :6  to Reserve Trip\n"
        "input :7  to Discount Trip\n"
        "input :8  to Latest 10 Trips\n"
        "input :9  to View Passengers Trip\n");
    num = int.parse(stdin.readLineSync());
    if (num == 1) {
      print("Hallo in Travel Agency\n");
      print('please enter information\n');
      trip.add(Trip());
      print('Enter Your id\n');
      trip[numberOfTrip].id = stdin.readLineSync();
      print('enter Location\n');
      trip[numberOfTrip].location = stdin.readLineSync();
      print('enter PassengerLimit\n');
      trip[numberOfTrip].passengerLimit = int.parse(stdin.readLineSync());
      print('enter time\n');
      trip[numberOfTrip].time = stdin.readLineSync();
      print('enter price\n');
      trip[numberOfTrip].price = double.parse(stdin.readLineSync());
      numberOfTrip++;
    }
    if (num == 2) {
      int modify;
      print('enter the Trip number you want to modify\n ');
      modify = int.parse(stdin.readLineSync()) - 1;

      int d;
      String Q;
      do {
        print("What does change \n"
            "if you want to change the price enter 1\n"
            "if you want to change the passenger limit enter 2\n "
            "if you want to change the location enter 3\n"
            "if you want to change the date enter 4\n "
            "if you want to change the id enter 5\n");
        d = int.parse(stdin.readLineSync());
        if (d == 1) {
          print('enter the new price\n');
          trip[modify].price = double.parse(stdin.readLineSync());
        }
        if (d == 2) {
          print("enter the new passenger limit\n");
          trip[modify].passengerLimit = int.parse(stdin.readLineSync());
        }
        if (d == 3) {
          print("enter the new location\n");
          trip[modify].location = stdin.readLineSync();
        }
        if (d == 4) {
          print("enter the  new date\n");
          trip[modify].time = stdin.readLineSync();
        }
        if (d == 5) {
          print("enter new id\n");
          trip[modify].id = stdin.readLineSync();
        }
        print("Do you have any other modification\n ");
        print("enter yes or no\n");
        Q = stdin.readLineSync();
        while (Q != "yes" && Q != "no") {
          print(' worng! please enter yes or no\n');
          Q = stdin.readLineSync();
        }
      } while (Q == "yes");
    }
    if (num == 3) {
      int delete;
      print('enter the Trip number you want to delete \n');
      delete = int.parse(stdin.readLineSync()) - 1;

      trip.removeAt(delete);
    }
    if (num == 4) {
      trip.sort((a, b) => a.time.compareTo(b.time));
      print('Trip after sort\n ');
      for (int i = 0; i < trip.length; i++) {
        print(
            'id:${trip[i].id},location:${trip[i].location},passengerLimit:${trip[i].passengerLimit}'
                ',time:${trip[i].time},price:${trip[i].price}\n');
      }
      print('finch\n');
    }
    if (num == 5) {
      int price;
      int j = 0;
      print("Enter the  price you want to Search for \n");
      price = int.parse(stdin.readLineSync());
      for (int i = 0; i < trip.length; i++) {
        if (trip[i].price == price) {
          print("the price is found in the id Trip:" + trip[i].id+'\n');
          j++;
          //add count
        }
      }
      print('it exists$j times\n');
    }
    if (num == 6) {
      int b;
      print('enter the Trip number you want to book \n');
      b = int.parse(stdin.readLineSync());
      while (b > trip.length) {
        print('wrong! enter the trip valid number\n ');
      }
      if (trip[b - 1].passengerLimit > 31)
        print('sorry! tickets have expired\n');
      else {
        print('one seat has been reserved\n');
      }
      //حجز رحلة
    }
    if (num == 7) {
      print('enter Trip number\n');
      int n;
      n=int.parse(stdin.readLineSync());
      while (n > trip.length) {
        print('wrong! enter the trip valid number \n');
      }
      if(trip[n-1].price>=10000){
        print('<<OFFER>>\n');
        print('The price before the discount:${trip[n-1].price}\n');
        trip[n-1].price-=  trip[n-1].price*0.2;
        print('The price after the discount:${trip[n-1].price}\n');

      }else{print('No Offer \n');}
    }
    if (num == 8) {
      if(trip.length>10){
        int n=trip.length-10;

        for(int i=trip.length;i>n;i--){
          print(
              'id:${trip[i].id},location:${trip[i].location},passengerLimit:${trip[i].passengerLimit}'
                  ',time:${trip[i].time},price:${trip[i].price}\n');
        }
      }else{
        print('not found 10 Trips\n');
        for(int i=0;i<trip.length;i++){
          print(
              'id:${trip[i].id},location:${trip[i].location},passengerLimit:${trip[i].passengerLimit}'
                  ',time:${trip[i].time},price:${trip[i].price}\n');
        }
      }
    }
    print("Do you want to continue ");
    print("enter yes or no\n");
    w = stdin.readLineSync();
    while (w != "yes" && w != "no") {
      print(' worng! please enter yes or no\n');
      w = stdin.readLineSync();
    }
  } while (w=='yes');
}

class Trip {
  String id;
  String location;
  int passengerLimit;
  String time;
  double price;
}
