
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
<p style="font-family:courier;"> git clone https://github.com/riscvsi/AsicMethadology.git </p>
<p style="font-family:courier;"> give your username : </p>
<p style="font-family:courier;"> give your password : </p>
<p> if you get "remote: Support for password authentication was removed on August 13, 2021." this message you will have to create a token in github to clone</p>
<p> steps to create token are in this link "https://howchoo.com/github/github-generate-personal-access-tokens" </p>
<p>pn Note: create classic tokens and not fine grained tokens give full permissions while creating the token in the checkbox fields all to be ticked</p>
<p style="font-family:courier;"> give your password: "your PAT (personal access token) " </p>
<br>
<p style="font-family:courier;">cd AsicMethadology</p>
<p> follow the doit flow see the usage section <li><a href="#usage">Usage</a></li></p>

<!-- prerequisites -->
## prerequisites
<h3> requirements </h3>

![screenshot](https://github.com/riscvsi/storeImmage/blob/main/check-for-doit.gif?raw=true)

<h4> check if the following is installed in the system </h4>
<h4> 1. doit </h4>
<h4>doit python task automation is what we use for automating our work and this is the main frame work that we use to develop the automation </h4>
<h4>1. how to check if do it is installed </h4>
<p style="font-family:courier;">doit --version</p>
<p> this will show the version of do it that is installed in the system.</p>
<p> If you get a error contact your system admin to install doit on your system see installation section to install doit </p>
<br>
<h4>2. check if git is installed in your system </h4>
<p style="font-family:courier;">git --version</p>
<br>

<!-- installation -->
## installation
<h3> installation steps </h3>
<h4> How to install doit </h4>
<p style="font-family:courier;">pip install doit</p>
<br>
<h4> How to install doit </h4>
<p style="font-family:courier;">sudo apt install git</p>


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

<!-- license -->
## license
<h3> license </h3>

<!-- contact -->
## contact
<h3> contacts </h3>
