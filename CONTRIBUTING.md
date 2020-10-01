# Welcome to the contributing section 🤝

Flutter has given developers a super power to create innovative and creative UIs for Mobile and Desktop both 🦾. 

So why don't we create something awesome and contribute to Flutter community and also show the power or height of feasibility for creating beautiful things🤩 and if you want to contribute. than you are at the right place, here are the steps how you can contribute to this project!!

### 1. READ CODE OF CONDUCT
   Read the [Code of Conduct](https://github.com/clubgamma/code-of-conduct) before starting contributing.
### 2. Fork the repo
   First of all fork the repo to your own GitHub account by clicking the **Fork** button on top-right corner. Still could not find 🙄,check the below image
   ![fork](https://user-images.githubusercontent.com/57007680/94579238-360b6b00-0296-11eb-8dfd-c8ac8f10aa26.png)
   After a sucessful fork, you'll see a copy of this repo in your own account.

### 3. Clone the repo    
   Now it's time to copy this repo to own laptop/PC. 
   To clone the repo you can write the below command in **Git Bash**
    
   > git clone <REPO_LINK_FROM_YOUR_ACCOUNT>
    
   You can get the repo link from the Download section in the **repo copied in your own account**. Still having trouble🙄,see the below image
    
   ![clone](https://user-images.githubusercontent.com/57007680/94578970-efb60c00-0295-11eb-93cc-301e605927bd.png)
   
 ### 4. Set up remote repo
  - When you cloned your fork, that should have automatically set your fork as the "origin" remote. Use git remote -v to show your current remotes. You should see the URL of your fork (which you copied in step 3) next to the word "origin". 
      If you don't see an "origin" remote, you can add it using below git command
    
    > git remote add origin <REPO_LINK_FROM_YOUR_ACCOUNT>
      
  - Now you have to setup **upstream**. For that write the below git command
      
    > git remote add upstream https://github.com/clubgamma/RiddlesWorld
        
  - Now pull the latest changes from original repo to your local changes by firing thee below command
        
    > git pull upstream master
  
 ### 5. Inough BoilerPlates, It's Flutter time now!!
  - Open cloned Project in your favourite IDE. After that go to the lib->categories. In categories choose the folder in which you want to create riddle and in that perticular Category, create
    one folder named **(Categoryname + currentOrderNumber + @yourUserName)** . Boom, that's your playground, create your own riddle in it! Still not got it, don't worry, here is the example.
     
     ![FolderExample](https://user-images.githubusercontent.com/57007680/94863822-afeb5200-0458-11eb-8e37-916d869b0739.png)
     
 - In that playgroung create as many files as you want, here is the [simplest file example](https://github.com/clubgamma/RiddlesWorld/blob/master/lib/categories/Math/math1%40jerry2501/math1HomePage.dart).
 
 **Visual Example:**
 
 <img src="https://user-images.githubusercontent.com/57007680/94865538-66503680-045b-11eb-87ae-200b407077e2.png" width="200" height="400" />

   
 After Player complete the Riddle, You want to print the score of the player right👀, than you can use this [result file](https://github.com/clubgamma/RiddlesWorld/blob/master/lib/universal/result.dart) which is universal. It will take certain parameter, do check before using it!
   
  **Visual Example:**
 
 <img src="https://user-images.githubusercontent.com/57007680/94865607-81bb4180-045b-11eb-8c9e-4d3938b89a56.png" width="200" height="400" />
   
   Use a universal AppBar throughout the application which is [here](https://github.com/clubgamma/RiddlesWorld/blob/master/lib/universal/riddleAppbar.dart).

 - After Creating your riddle, you have to go **MathRiddleLists.dart** file and call the **ActionCard** class which is already created. Pass the required argument like Name, discreption, orderNumber
   etc. In OnPressed, give the className which you have created just now in your playground, I mean in your folder😉 Example below!
   
   ![FileExample](https://user-images.githubusercontent.com/57007680/94866704-76691580-045d-11eb-9859-09d56968ac46.png)
   
    **Visual Example:**
    
   <img src="https://user-images.githubusercontent.com/57007680/94865382-1a9d8d00-045b-11eb-9e48-b1dad34da09a.png" width="200" height="400" />
   
   It is compulsory to keep the same layout for list of categories and list of Riddles in particular categories as sawn above.

   Boom, You have successfully added one Riddle🔥✨
   
   
 ### 6. Now it's time to save the work
      
  - Stage the changes you have made by firing the below command
    > git add -A
  - Commit the changes 
    > git commit -m "Description of changes/your work"
  - Push the changes to your forked repo
    > git push origin master
  
### 7. Let's finish this
  
  - Go to your forked repo on GitHub website and refresh the page, you'll see something like the below image
  ![pr1](https://user-images.githubusercontent.com/57007680/94609340-3fa7c980-02bc-11eb-90dd-269a433b00e0.PNG)
        
  - Click on pull-request and you will be redirected to another page where you will see something like below image
  ![pr2](https://user-images.githubusercontent.com/57007680/94609343-420a2380-02bc-11eb-83f1-c6157417c50d.PNG)
        
  - After that you have to write your GitHub username as the title of your pull-request and describe your work if you want and that's it!!
    Create a pull-request by clicking the button
        
    Mark the pull request as **Ready for Review**
        
    Also add the below 2 lines in the description. It is compulsory for sucessful submission.
        
    - [X] I have read the Code Of Conduct.
        
    - [X] I have followed all the steps of submission properly.
        
    ![pr3](https://user-images.githubusercontent.com/58077762/93779010-1e076c00-fc44-11ea-86f0-7a6d74380624.png)

**Woohoo!! Congratulations on making your open source contribution🎉🎉**                                         
**Wait for some time to get your PR merged by our team**
