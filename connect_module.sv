`ifndef _CONNECT_MODULE_SV_
`define _CONNECT_MODULE_SV_

tinyalu_bfm     module_bfm();
tinyalu_tester_module stim_module(module_bfm);

initial begin
  uvm_config_db #(virtual interface tinyalu_bfm)::set(null, "*", "module_bfm", module_bfm);
end

initial begin
  force top.module_dut.A       = module_bfm.A;
  force top.module_dut.B       = module_bfm.B;
  force top.module_dut.op      = module_bfm.op;
  force top.module_dut.clk     = module_bfm.clk;
  force top.module_dut.reset_n = module_bfm.reset_n;
  force top.module_dut.start   = module_bfm.start;

  force module_bfm.done   = top.module_dut.done;
  force module_bfm.result = top.module_dut.result;
end

`endif  // _CONNECT_MODULE_SV_