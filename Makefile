## name of your block
block = RISCV

## technology used 130 / 45
#### tool definition
synthTool = genus
pnrTool = innovus 
############

synth: 
	echo "Synthesis completed"
	$(synthTool) -file scripts/genus/synthesis.tcl
	touch synthCompleted

fp : synthCompleted
	echo "placement completed"
	$(pnrTool) -file scripts/floorplan/floorplan.tcl
	touch fpCompleted

place: fpCompleted
	echo "placement completed"
	$(pnrTool) -file SCRIPTS/innovusPlace.tcl
	touch placementCompleted

cts: placementCompleted
	echo "cts completed";
	$(pnrTool) -file SCRIPTS/innovusCts.tcl
	touch ctsCompleted

route: ctsCompleted
	echo "route completed"
	$(pnrTool) -file SCRIPTS/innovusRoute.tcl
	touch routeCompleted

all: synth place cts route

clean:
	rm synthCompleted placementCompleted ctsCompleted routeCompleted


#######################