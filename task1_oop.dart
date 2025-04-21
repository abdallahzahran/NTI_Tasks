import 'dart:io';

class User {
  String name;
  String phone;

  User(this.name, this.phone);

  @override
  String toString() => '$name - $phone';
}

class Theater {
  final int rows;
  final int cols;
  List<List<String>> _seats;
  Map<String, User> _bookings = {};

  Theater({this.rows = 5, this.cols = 5})
    : _seats = List.generate(5, (_) => List.filled(5, 'E'));

  void displaySeats() {
    print("\nTheater Seats:");
    for (var row in _seats) {
      print(row.join(' '));
    }
  }

  bool isSeatValid(int row, int col) {
    return row >= 1 && row <= rows && col >= 1 && col <= cols;
  }

  bool isSeatBooked(int row, int col) {
    return _seats[row - 1][col - 1] == 'B';
  }

  void bookSeat(int row, int col, User user) {
    _seats[row - 1][col - 1] = 'B';
    _bookings["$row,$col"] = user;
  }

  void showBookings() {
    if (_bookings.isEmpty) {
      print("\nNo bookings yet.");
    } else {
      print("\nUsers Booking Details:");
      _bookings.forEach((seat, user) {
        print("Seat $seat: $user");
      });
    }
  }
}

class TheaterApp {
  final Theater theater;

  TheaterApp(this.theater);

  void options() {
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
          handleBooking();
          break;
        case '2':
          theater.displaySeats();
          break;
        case '3':
          theater.showBookings();
          break;
        case '4':
          print("\nSee You Back");
          return;
        default:
          print("\nInvalid choice! Try again.");
      }
    }
  }

  void handleBooking() {
    while (true) {
      print("\nEnter row (1-${theater.rows}) or 'exit' to quit:");
      String? rowInput = stdin.readLineSync();
      if (rowInput == 'exit') break;

      print("Enter column (1-${theater.cols}):");
      String? colInput = stdin.readLineSync();

      int? row = int.tryParse(rowInput!);
      int? col = int.tryParse(colInput!);

      if (row == null || col == null || !theater.isSeatValid(row, col)) {
        print(
          "\nInvalid input! Please enter numbers between 1 and ${theater.rows}.",
        );
        continue;
      }

      if (theater.isSeatBooked(row, col)) {
        print("\nSorry, this seat is already booked.");
      } else {
        print("Enter your name:");
        String? name = stdin.readLineSync();

        print("Enter your phone number:");
        String? phone = stdin.readLineSync();

        if (name != null &&
            phone != null &&
            name.isNotEmpty &&
            phone.isNotEmpty) {
          User user = User(name, phone);
          theater.bookSeat(row, col, user);
          print("\nSeat booked successfully!");
          break;
        } else {
          print("\nInvalid input! Name and phone number cannot be empty.");
        }
      }
    }
  }
}

void main() {
  Theater theater = Theater();
  TheaterApp app = TheaterApp(theater);
  app.options();
}
