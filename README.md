kaigo-records<br>
![sample_image](https://github.com/a-yoshiyuki/kaigo-records/blob/master/FireShot%20Capture%20035%20-%20KaigoRecords%20-%20kaigo-records.online.png?raw=true)

Thank you for visiting my repository!<br>
This repository is a portfolio created by utilizing the knowledge gained from learning Ruby on Rails.<br>
URL:https://kaigo-records.online/

[Explanation of the app]<br>
This app mainly created the function to enter and save records at the nursing care site.<br>
In addition, the administrator and staff are separated by namespace, and the administrator can manage the staff and users and view the records, and the staff can enter and view the records.

The reason I decided to make this app was that my current workplace record was still on paper.<br>
For paper-based records, physical space is required to store the records and the cost of purchasing paper is also high. In addition, it was time-consuming to prepare a new recording sheet for each record by filling in the necessary items after midnight.<br>
I came up with the idea of creating this app because I thought that if I could manage the records in the app, I would be free from those problems.

At the group home where I work, I thought about how to make it easy to use.

[how to use]<br>
〇Administrator side<br>
・ Creating user and staff accounts
After logging in, click each list button, then click the new registration or staff account creation button.
Enter the required information and press the register button to complete.

・ Detailed display of user and staff accounts<br>
Click the name link for the staff account.<br>
Click the details button on the right side of the list for the user account.

・ Logout<br>
Click the logout button at the top right of the screen.<br>
For smartphones, click the logout button in the hamburger menu.

〇 Staff side<br>
・ Browsing personal pages<br>
After logging in, a list of users will be displayed, so click on the user you want to view.

・ Input and edit progress records and vital records<br>
Click each button in the header. Select a user from the drop-down list. Fill in the required items and click the input button.<br>
To edit vital records, click the edit button for each record on the right side of your personal page. Fill in the edits and click the update button.<br>
To edit the progress record, click the button to the progress record on the personal page to display the list, and click the edit button on the right. Fill in the edits and click the update button.

・ Entering and editing food and water records<br>
Click the meal details button on your personal page.<br>
Click the new input button to enter, then enter.<br>
After that, when adding or changing, use the additional input button on the meal amount / water amount record page.

・ Logout<br>
Click the logout button at the top right of the screen.<br>
For smartphones, click the logout button in the hamburger menu.

[Points that were particular about making the app]<br>
〇 Records other than progress records are summarized on the user's personal page.<br>
In my work, there are many situations where I want to see vital records and meal amount records other than progress records immediately, so I decided to meet those needs.

〇 If you go around 0 o'clock, the record will be automatically recorded.<br>
As mentioned above, paper record management was troublesome because it was necessary to fill in the necessary items for each record and prepare a new record sheet around midnight.<br>
In this app, when it goes around 0 o'clock, the records up to that point are saved, and the blank record is prepared on the entry page.

〇 Responsive support<br>
It would be convenient if we could use the smartphone used by the staff to fill in the records, so we made it responsive so that it would be easy to operate even from the smartphone.

[Difficulties in creating the app]<br>
I had a hard time from beginning to end, but the most time-consuming solution was when I used devise to create a staff account on the administrator side.<br>
When the administrator tried to create staff accounts in succession, the creation screen was not displayed and a different screen was displayed.<br>
The cause was that the account logged in was switched from administrator to staff when the first staff account was created.<br>
I used devise's overwrite to solve this.

[specification]<br>
〇Language<br>
   Ruby 2.6.3<br>
   JavaScript<br>
   HTML & CSS<br>
   
〇 Framework<br>
   Ruby on Rails 5.2.4
   
〇 Infrastructure / development environment<br>
   AWS
   
〇DB<br>
   mysql2
   
〇 Used Gem
   devise<br>
   bootstrap 3<br>
   kaminari 1.2.1<br>
   pry-rails
   
[What I want to do from now on]<br>
・ Introduce Vue.js to enable record entry via asynchronous communication<br>
・ Implementation of RSpec test<br>
・ Implementation of a function to send a contact email to the registered staff account<br>
・Implementation of a function that records attendance records at the same time as staff login<br>
