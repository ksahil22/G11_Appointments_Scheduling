# Group 11 Appointment Scheduling

Appointment scheduling application .

## Project description

The project is a healthcare and donation management application that integrates essential features for users and administrators. It allows users to book appointments with doctors, browse doctor profiles, and contribute to donation campaigns. Administrators can manage appointments, add new doctors, oversee user interactions, and create donation campaigns. The application is designed to streamline healthcare services and encourage donations, making it easier for users to contribute and for administrators to manage medical services and fundraising efforts.
## Tools and Technologies used to build this project 

1. Firebase: Firebase is used to store and process  real-time data and perform the required actions.
2. Flutter and Dart programming language is used to build entire application.
3. VisualStudio IDE is used to write the application.


## Pre-commit Git-hooks for unit-testing
We have initialized git hooks which are basically scripts that run automatically each time a certain event is triggerred. In our case, we have used it for a commit. Every time we commit a change, this script will be executed which has unit-tests execution commands and based on those results, the commit will be accetped or rejected.

The script used is as below:
```
#!/bin/sh
set -e
flutter test
echo "All checks passed"
echo "Commit Successful"
```


## ER Diagram of this application.
![image](https://github.com/user-attachments/assets/fc521c6e-6b0b-4b44-8048-b71b8c360843)

Sprint 1 Completed Items:
- Setup Flutter SDK in vscode and install all dependencies.
- Design database architecture and identify a cloud hosted service.
- Setup firebase Database for the project.
- Setup Github repo and github actions pipelines.
- Create an ER diagram.
- Design UI for Login and Signup.
- Design UI for Home page.
- Design UI for Doctor list and Upcoming appointments.
- Create the logout functionality.
- Design UI for Appointment booking screen.

Sprint 2 Completed Items:

- UI refinement of overall application.
- Design Design Popup UI and integerating it.
- Designing a UI for donation details.
- Designing a UI for donation campaign list.
- Handle backend side for appointments.
- Define backend handlers for admin dashboard.
- Design UI to add doctors.
- Design backend handlers for adding doctors.
- Implement Unit tests for homepage.
- Implement unit tests for add doctor form.
- Design UI to add donations.

