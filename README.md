
<br />
<div align="center">
    
  <h3 align="center">Asic Methadology</h3>

  <p align="center">
    Asic Methadolgy for kickstarting your asic journey.
    <br />
    <br />
    <br />
    <a href="http://62.171.150.100:8000/">Report Bug</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- built-with -->
## built-with

<h3> we are using doit automation flow you can get more detail about doit flow in this location "https://pydoit.org/"  </h3>

<!-- getting-started -->
## getting-started
<h3> getting started </h3>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/clone-github-repo.gif?raw=true)


<h4> 1. clone the git repo to your local path </h4>

```bash
git clone https://github.com/riscvsi/AsicMethadology.git
#give your username :
#give your password : 
```
<p>if you get "remote: Support for password authentication was removed on August 13, 2021." this message you will have to create a token in github to clone </p>
<p> steps to create token are in this link "https://howchoo.com/github/github-generate-personal-access-tokens" </p>
<p>pn Note: create classic tokens and not fine grained tokens give full permissions while creating the token in the checkbox fields all to be ticked</p>
<p style="font-family:courier;"> give your password: "your PAT (personal access token) " </p>
<br>

```bash
cd AsicMethadology
```

<p> follow the doit flow see the usage section <li><a href="#usage">Usage</a></li></p>
```



<!-- prerequisites -->
## prerequisites
<h3> requirements </h3>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/check-for-doit.gif?raw=true)

<h4> check if the following is installed in the system </h4>
<h4> 1. doit </h4>
<h4>doit python task automation is what we use for automating our work and this is the main frame work that we use to develop the automation </h4>
<h4>1. how to check if do it is installed </h4>

```bash
doit --version
```

<p> this will show the version of do it that is installed in the system.</p>
<p> If you get a error contact your system admin to install doit on your system see installation section to install doit </p>
<br>
<h4>2. check if git is installed in your system </h4>

```bash
git --version
```

<br>

<!-- installation -->
## installation
<h3> installation steps </h3>
<h4> How to install doit </h4>

```bash
pip install doit
```

<br>
<h4> How to install git </h4>

```bash
sudo apt install git
```


<!-- usage -->
## usage
<h3> usage </h3>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/doit-execute-part1.gif?raw=true)

<h4> using the doit framework to work on the flow</h4>
<br>
<p style="font-family:courier;"> doit list </p>
<p> this will give the list of tasks that are available in the methadology </p>
<p> the list of tasks that are available are "Methadology" "generateSetup" "synthesis" </p>
<p> execute any of the above step based on the dependencies the steps will execute in a sequence some tasks might execute in parallel</p> 
<br>
<p style="font-family:courier;"> doit </p>
<p> only typing doit will run the entire automation until there is a error or till the flow completes </p>
<p> in our case it will run till synthesis </p> 
<br> 
<p style="font-family:courier;"> doit synthesis </p>
<p> this step will run synthesis for the block that is defined </p>
<br> 
<br>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/doit-execute-part2.gif?raw=true)

<p> modifying the design and inputs </p> 
<p> open the dodo.py this is the main file that doit executes in the first section you can find the name of the design and the csv file that is being read </p> 
<p> open the csv file that is given in the dodo.py file using libreoffice or generic </p>
<p style="font-family:courier;"> libreoffice Setup45.csv </p>
<p> this will show you the design and the corresponding inputs that is required </p> 
<p> add new column in the the csv file according to your requirement give a new design name</p> 
<p> modify the dodo.py file to pick the correct design name </p>
<p> modify the dodo.py file and give the tool to use default is yosys you can use "genus" or "dc" scripts will be picked up based on the tool given here </p>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/doit-execute-part3.gif?raw=true)

<p style="font-family:courier;"> doit synthesis </p>
<p> this will trigger the flow to pick up the user inputs </p>

<p> the methadology scripts are present in the scripts directory and are explained in the file itself you can edit the methadology based on your requirement</p>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/doit-execute-part4.gif?raw=true)

<!-- contributing -->
## contributing
<h3> contributing </h3>

<p> in this section we will check how students can contribute to the project </p>

<p> remote: files stored in main github</p>
<p> main: this is the name of the main production version of files that are in github</p>
<p> local: files that are stored in your location (your computer)</p>

```bash
git branch -a # this command will show all the branches available in remote
git branch # this command will show all the local branches
# create a new branch to add your individual contacts in README.md file name of the branch is "yourNameAddContact"
git branch rcgAddContact main # this will create a new branch in your local area (say directory)
git switch rcgAddContact
git branch # observe the "*" right next to your branch that you created
git push --set-upstream origin rcgAddContacg # this will create a branch in github project remote
# now you are in your branch make changes to README.md file that is present in the directory and add your name and mail id
git add README.md # as this is the only file you modified you will only stage this one single file rest of them are untouched
# if you have modified any other file you will add git add FileName 
# use git status to check what files are modified
git commit -m "add my contact name and mail ID :Author rcg" # do not forget to add your name as author
git push origin # this will push the changes to github and will retain the branch in your local if you need to make any other changes
git push origin --delete rcgAddContact # this will push the changes to github and will remove the branch if all your changes are done
# its always good to delte the branch and recreate the same branch again when you are working on a different problem.
git switch main # now you switch to your main branch all changes are done in your branch open README.md and see if your changes are present
git switch rcgAddContact # now you switch to your local branch all changes done in your branch should be available here.

### now to check if your changes are merged to main or not
git switch main ; # switch to the main branch
git pull ; # pull the contents of the main branch to your local area
git diff main rcgAddContact # check for the changes in main and your area and whether the changes are merged or not
# not all the time your changes can be merged to main. you will have to recreate the branch and make the changes again 
# in this case lets say 4 people added their contacts in 4 different branches git will not be able to merge only the 1st change will be merged rest of the changes will not be mergeble. 


### how to merge the branch to main (dont try these steps)
git pull origin main 
git checkout main
git merge origin/rcgAddContact
git push -u origin main

```



<!-- license -->
## license
<h3> license </h3>

<!-- contact -->
## contact
<h3> contacts </h3>

<p> Ramapriya - ramapriyacg@outlook.com </p>
<p> students - students@outlook.com </p>
<p> Manohar - manoharprakashreddy2001@gmail.com</p>
