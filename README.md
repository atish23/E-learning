Educational Management System

This is an Educational Management System application that allows for the creation and management of schools, courses, batches, and students by various user types including Admin, School Admin, and Student. With different user types and their respective capabilities, the application offers a flexible and secure platform for educational organisations.
User Types and Responsibilities
Admin

    Admins have full control over the system and can create schools and SchoolAdmins.

School Admin

    SchoolAdmins can update information about the school
    SchoolAdmins are responsible for creating courses
    SchoolAdmins are responsible for creating batches
    SchoolAdmins are responsible for adding students to batches
    They can also approve or deny enrolment requests made by students

Student

    Students can raise a request to enrol in a batch.
    Students from the same batch can see their classmates and their progress.

Usage

    Clone the repository: git clone https://github.com/atish23/E-learning.git
    Change into the project directory: cd E-learning
    Install the dependencies: bundle install
    Set up the database: rails db:create && rails db:migrate && rails db:seed
    Start the application: rails s

You can now access the application in your browser at http://localhost:3000.
User Authentication

Once logged in, there are three different types of users based on their role. Each user has a different set of permissions.

    Admin users have access to all features and links.
    School Admin users have access to some features and links.
    Student users have limited access to features and links.

To log in as any of the above users, you can check the seeds.rb file for their email and password.
API

This application also provides an API for user authentication using JWT token. A Sessions Controller has been created for this purpose.
Also Provies Users API for just to show how we can create API as well. Will update this repository continiously.
<img width="994" alt="Screenshot 2023-05-09 at 12 28 36 AM" src="https://user-images.githubusercontent.com/16266389/236932040-0a970b69-6dc1-4f4a-b88f-3d84d597bc1b.png">
<img width="952" alt="Screenshot 2023-05-09 at 12 28 41 AM" src="https://user-images.githubusercontent.com/16266389/236932051-13810e58-ed29-428f-8abb-6774a22e2b36.png">
<img width="647" alt="Screenshot 2023-05-09 at 12 28 47 AM" src="https://user-images.githubusercontent.com/16266389/236932062-7840f43a-9347-4228-8c22-ec54b4a76c89.png">



Improvements To be Done:

    Add more API endpoints for other features.
    Add validation to ensure data integrity and prevent errors.
    Implement pagination for displaying large data sets.
    Improve UI/UX for better user experience.
    Add all tests case for better code quality and reliability.
    
