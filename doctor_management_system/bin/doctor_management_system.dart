import 'dart:io';

void main() {
  List<String> doctorNames = [];
  List<double> salaries = [];

  while (true) {
    print("Enter doctor name: ");
    String name = stdin.readLineSync()!;

    if (name != null && name.trim().isNotEmpty) {
      doctorNames.add(name.trim());
    } else {
      print("error please Try again");
      continue;
    }

    print("Do you want to add another name? (yes/no) ");
    String answer = stdin.readLineSync()!;

    if (answer != null) {
      String answerShape = answer.toLowerCase().trim();
      if (answerShape == 'yes') {
        continue;
      } else if (answerShape == 'no') {

        print('''
        Moving to salary input..
          ''');


        for (int i = 0; i < doctorNames.length; i++) {
          while (true) {
            print("Enter salary for ${doctorNames[i]}: ");
            String salaryFromUser = stdin.readLineSync()!;
            double salary = double.parse (salaryFromUser ?? '')!;

            if (salary != null && salary > 0) {
              salaries.add(salary);
              break;
            } else {
              print("Please enter a valid positive number.");
            }
          }
        }


        print('''
        Doctor Names and Salaries
        ''');
        for (int i = 0; i < doctorNames.length; i++) {
          print("${doctorNames[i]} - \$${salaries[i]}");
        }

        break;
      }
    }
  }

  int totalDoctors = doctorNames.length;
  double totalSalaries = 0;
  double highestSalary = salaries[0];
  double lowestSalary = salaries[0];

  for (double salary in salaries) {
    totalSalaries += salary;

    if (salary > highestSalary) {
      highestSalary = salary;
    }

    if (salary < lowestSalary) {
      lowestSalary = salary;
    }
  }

  double averageSalary = totalSalaries / totalDoctors;

  print("\nDoctors' Statistics");
  print("Total number of doctors: $totalDoctors");
  print("Total of all salaries: \$${totalSalaries}");
  print("Average salary: \$${averageSalary}");
  print("Highest salary: \$${highestSalary}");
  print("Lowest salary: \$${lowestSalary}");

}
