import time
from doit.action import CmdAction
from doit.tools import run_once

csvFile = "Setup45.csv"
designName = "leon"

synthTool = "genus"
synthMethadology = "./scripts/"

pnrTool = "innovus"

## this is to show the section that is getting executed
def show_cmd(task):
    return "executing... %s>> " % task.actions[0]


#### this is the welcome message
def task_Methadology():
    """Welcome to Cadence methadology"""

    def python_info(targets):
            print("Welcome to Asic Automation done by students for students \n\n")

    return {
        'actions': [python_info],
        'verbosity': 2,
        'doc': "Welcome message",
        }


### this section we generate the setup.tcl file for all the runs

## author: Manohar
def task_generateSetup():
    import pandas as pd
    import numpy as np

    createDirectory = "mkdir generatedInputs"

    def python_generateSetup():
        print ("loading the csvFile :", csvFile , "converting to setup.tcl please wait")
        df = pd.read_csv(csvFile)
        fmt = "set "
        designs = df.columns[1:].values
        print(designs," is the designs ")
        required_col=df[['blockName',designName]]
        print("req col \n",required_col)
        final_df=required_col
        print(final_df.values)
        for i in required_col:
            if i==designName:
                fmt+= " \"%s\" "
            else:
                fmt+=" %s "
        np.savetxt(r'setup.tcl', final_df.values, fmt=fmt)


    generateUpf = "python scripts/python/generateDummyUpf.py -D "+designName
        
    return {
        'actions': [createDirectory, python_generateSetup, generateUpf],
        'targets': ["setup.tcl"],
        'title': show_cmd,
        'verbosity': 2,
        'doc': "generate setup.tcl",
        'uptodate': [run_once],
    }


#### here we check the dependencies for synthesis and execute synthesis
def task_synthesis():
    """perform synthesis on the design"""
    ## read the csv file and determine what rows are needed for synthesis
    
    depFiles = []
    depFiles.append("setup.tcl")
    #"setup.tcl" , " temp.v "
    if synthTool == "yosys":
        invokeTool = synthTool +" -c " + synthMethadology + "/" + synthTool + "/synthesis.tcl"
    if synthTool == "genus":
        invokeTool = "\\"+synthTool + " -f "+ synthMethadology + "/" + synthTool + "/synthesis.tcl"


    def python_preSynthesis():
        print(" place holder for presynthesis checks using python")

    def python_setupSynthesis():
        print("here we need to read the setup.tcl file and check if the files are available in the said location")
        print("if the files are available start the synthesis run")
    
    def python_postSynthesis():
        print ("post synthesis get the data and make all the checks")

        
    return {
        'actions': [python_preSynthesis , python_setupSynthesis, invokeTool, python_postSynthesis],
        'file_dep': depFiles,
        'title': show_cmd,
        'verbosity': 2,
        'doc': "run synthesis",
    }



def task_pnr():
    """perform floorplan on the design"""
    ## read the csv file and determine what rows are needed for synthesis
    
    depFiles = []
    ## we need synthesis output files
    depFiles.append("setup.tcl")

    #"setup.tcl" , " temp.v "
    if pnrTool == "openroad":
        invokeTool = pnrTool +"  " + synthMethadology + "/" + pnrTool + "/floorplan.tcl -log openroad.log"
    if pnrTool == "innovus":
        invokeTool = "\\"+pnrTool + " -stylus -f "+ synthMethadology + "/" + pnrTool + "/floorplan.tcl"

    def python_preFloorplan():
        print(" place holder for prefloorplan checks using python")

    def python_setupFloorplan():
        print("here we need to read the setup.tcl file and check if the files are available in the said location")
        print("if the files are available start the floorplan run")
    
    def python_postFloorplan():
        print ("post floorplan get the data and make all the checks")

        
    return {
        'actions': [python_preFloorplan , python_setupFloorplan, invokeTool, python_postFloorplan],
        'file_dep': depFiles,
        'title': show_cmd,
        'verbosity': 2,
        'doc': "run floorplan",
    }


