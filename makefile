PRJ_HOME ?= $(PWD)
SIM_PATH ?= $(PRJ_HOME)
WORK_PATH ?= $(PRJ_HOME)/work

export PRJ_HOME

VCS_VDB = design.vdb
SIM_VDB = sim.vdb

CM_FLAG += -cm line+cond+fsm+tgl+branch+assert

VERDI_FLAG ?= -managercFile ~/Workspace/common/verdi/manage.rc

VCS_FLAG := -full64 \
			-top top \
			-debug_acc+all -debug_region+cell+encrypt \
			-timescale=1ns/1ps \
			-kdb
VCS_FLAG += $(CM_FLAG) -cm_dir $(VCS_VDB)

SIM_FLAG := +ntb_random_seed=12345678 \
			-ucli -do $(PRJ_HOME)/wave_dump.ucli
SIM_FLAG += $(CM_FLAG) -cm_dir $(SIM_VDB)

.PHONY: all analyse elab sim wave cov

all: analyse elab sim

analyse: $(WORK_PATH)
	@cd $(WORK_PATH) && vlogan -F $(PRJ_HOME)/top.f -full64 -l top.log -sverilog -kdb

mix_analyse: $(WORK_PATH)
	@cd $(WORK_PATH) && vlogan -f $(PRJ_HOME)/tb.f  -full64 -l tb.log  -sverilog -kdb
	@cd $(WORK_PATH) && vhdlan -f $(PRJ_HOME)/dut.f -full64 -l dut.log -kdb

elab: $(WORK_PATH)
	@cd $(WORK_PATH) && vcs $(VCS_FLAG) -l elab.log

sim: $(WORK_PATH)
	@cd $(WORK_PATH) && ./simv $(SIM_FLAG) -l sim.log

wave: $(WORK_PATH)
	@cd $(WORK_PATH) && verdi $(VERDI_FLAG) &

cov: $(WORK_PATH)
	@cd $(WORK_PATH) && urg -dir $(VCS_VDB) $(SIM_VDB) -dbname merge.vdb -format both
	@cd $(WORK_PATH) && verdi -cov -covdir merge.vdb &

$(WORK_PATH):
	@mkdir -p $(WORK_PATH)

clr:
	@rm -rf $(WORK_PATH)
