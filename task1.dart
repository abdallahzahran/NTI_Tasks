import 'dart:io';

void main() {
  List<List<String>> theaterSeats = List.generate(5,(_) => List.filled(5, 'E'),);
  Map<String, String> bookings = {};

  print("Welcome To Our Theater");

  while (true) {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");
    stdout.write("Input => ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        while (true) {
          print("\nEnter row (1-5) or 'exit' to quit:");
          String? rowInput = stdin.readLineSync();
          if (rowInput == 'exit') break;

          print("Enter column (1-5):");
          String? colInput = stdin.readLineSync();

          int? row = int.parse(rowInput!);
          int? col = int.parse(colInput!);

          if (row == null ||col == null ||row < 1 ||row > 5 ||col < 1 ||col > 5) {
            print("\nInvalid input! Please enter numbers between 1 and 5.");
            continue;
          }

          if (theaterSeats[row - 1][col - 1] == 'B') {
            print("\nSorry, this seat is already booked.");
          } else {
            print("Enter your name:");
            String? name = stdin.readLineSync();

            print("Enter your phone number:");
            String? phone = stdin.readLineSync();

            if (name != null && phone != null) {
              theaterSeats[row - 1][col - 1] = 'B';
              bookings["$row,$col"] = "$name - $phone";

              print("\nSeat booked successfully!");
              break;
            } else {
              print("\nInvalid input! Name and phone number cannot be empty.");
            }
          }
        }
        break;

      case '2':
        print("\nTheater Seats:");
        for (var row in theaterSeats) {
          print(row.join(' '));
        }
        break;

      case '3':
        if (bookings.isEmpty) {
          print("\nNo bookings yet.");
        } else {
          print("\nUsers Booking Details:");
          bookings.forEach((seat, user) {
            print("Seat $seat: $user");
          });
        }
        break;

      case '4':
        print("\nSee You Back");
        return;

      default:
        print("\nInvalid choice! Try again.");
    }
  }
}
