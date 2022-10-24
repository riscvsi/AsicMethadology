import time
from doit.action import CmdAction
csvFile = "Setup45.csv"
designName = "riscvCore"

synthTool = "yosys"
synthMethadology = "/home/rcg/work/scripts/tcl/MethadologyScripts/"


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
def task_generateSetup():
    def python_generateSetup():
        print ("loading the csvFile :", csvFile , "converting to setup.tcl please wait")
        df = pd.read_csv(csvFile)
        fmt = "set "
        designs = df.columns[1:].values
        print(designs," is the designs ")
        required_col=df[['DesignName',designName]]
        print("req col \n",required_col)
        final_df=required_col
        print(final_df.values)
        for i in required_col:
            fmt+=" %s "
        np.savetxt(r'setup.tcl', final_df.values, fmt=fmt)
        line1 = "set DesignName \""+designName+"\""
        file1 = open('setup.tcl', 'a+')
        file1.write(line1)
        file1.close()

        
    return {
        'actions': [python_generateSetup,"touch setup.tcl"],
        'targets': ["setup.tcl"],
        'title': show_cmd,
        'verbosity': 2,
        'doc': "generate setup.tcl",
    }


#### here we check the dependencies for synthesis and execute synthesis
def task_synthesis():
    """perform synthesis on the design"""
    ## read the csv file and determine what rows are needed for synthesis
    
    depFiles = []
    depFiles.append("setup.tcl")
    #"setup.tcl" , " temp.v "
    if synthTool == "yosys":
        invokeTool = synthTool +" -s " + synthMethadology + "/" + synthTool + "/synthesis.tcl"
    if synthTool == "genus":
        invokeTool = synthTool + " -f "+ synthMethadology + "/" + synthTool + "/synthesis.tcl"

    def python_preSynthesis():
        print(" place holder for presynthesis checks using python")

    def python_setupSynthesis():
        print("here we need to read the setup.tcl file and check if the files are available in the said location")
        time.sleep(5)
        print("if the files are available start the synthesis run")
    
    def python_postSynthesis():
        print ("post synthesis get the data and make all the checks")
        time.sleep(5)

        
    return {
        'actions': [python_preSynthesis , python_setupSynthesis, invokeTool, python_postSynthesis],
        'file_dep': depFiles,
        'title': show_cmd,
        'verbosity': 2,
        'doc': "run synthesis",
    }

