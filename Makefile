## name of your block
block = RISCV

## technology used 130 / 45
#### tool definition
synthTool = \genus
pnrTool = \innovus -stylus
############

getLibrary: 
	echo "get the libraries into your area"
	git clone https://github.com/riscvsi/technology.git
	echo "libraries copied to main area"

getNetlist: 
	echo "get the netlist into your area"
	git clone https://github.com/riscvsi/riscvCoreSyntaCore1.git
	echo "netlist copied"

synth: 
	echo "Synthesis completed"
	$(synthTool) -file scripts/genus/synthesis.tcl
	touch synthCompleted

fp : synthCompleted
	echo "Synthesis completed"
	$(pnrTool) -file scripts/innovus/floorplan.tcl
	touch fpCompleted

pmesh: fpCompleted
	echo "floorplan completed starting power planning"
	$(pnrTool) -file scripts/innovus/power_stripe.tcl
	touch pmesh

place: pmesh
	echo "power mesh completed starting placement"
	$(pnrTool) -file scripts/innovus/placement.tcl
	touch placementCompleted

cts: placementCompleted
	echo "cts completed";
	$(pnrTool) -file scripts/innovus/cts.tcl
	touch ctsCompleted

route: ctsCompleted
	echo "route completed"
	$(pnrTool) -file scripts/innovus/route.tcl 
	touch routeCompleted

output: routeCompleted 
	echo "dump files"
	$(pnrTool) -file scripts/innovus/outputs.tcl
	touch outputCompleted 


iterminal:
	echo "getting a innovus terminal"
	$(pnrTool)

all: synth place cts route

clean:
	rm pvsUI_ipvs.log fpCompleted synthCompleted placementCompleted ctsCompleted routeCompleted innovus.log* innovus.cmd* genus.log* genus.cmd*


#######################
