**Educational Management System
**

<img width="824" alt="Screenshot 2023-05-09 at 6 01 18 PM" src="https://github.com/atish23/E-learning/assets/16266389/38866c6f-bcb1-47c5-88fc-68eda0884a18">


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

Screenshots
        <img width="1201" alt="Screenshot 2023-05-09 at 2 28 19 AM" src="https://user-images.githubusercontent.com/16266389/236934902-142e1fc2-f8aa-4b2d-84b2-385b8341cf3e.png">
<img width="1220" alt="Screenshot 2023-05-09 at 2 28 29 AM" src="https://user-images.githubusercontent.com/16266389/236934929-d882fab7-c1b6-4bfd-9c87-792a198b9287.png">
<img width="1229" alt="Screenshot 2023-05-09 at 2 28 40 AM" src="https://user-images.githubusercontent.com/16266389/236934931-852a2959-f8b0-43e0-aee7-558f653b5e11.png">
<img width="1129" alt="Screenshot 2023-05-09 at 2 29 16 AM" src="https://user-images.githubusercontent.com/16266389/236934940-e5b1d51e-9739-4be2-bccb-1379f11dc76b.png">
<img width="1250" alt="Screenshot 2023-05-09 at 2 29 45 AM" src="https://user-images.githubusercontent.com/16266389/236934948-d76790b4-9caa-48cf-b18c-0f66b93cb5d5.png">
<img width="1191" alt="Screenshot 2023-05-09 at 2 29 51 AM" src="https://user-images.githubusercontent.com/16266389/236934951-fefdcafa-e780-4ed0-9557-baf7e6ed8994.png">
<img width="1659" alt="Screenshot 2023-05-09 at 2 32 27 AM" src="https://user-images.githubusercontent.com/16266389/236934955-2281bd3c-0ded-4ee0-9ecf-0caa4ed11180.png">
