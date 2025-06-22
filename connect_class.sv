`ifndef _CONNECT_CLASS_SV_
`define _CONNECT_CLASS_SV_

tinyalu_bfm     class_bfm();

initial begin
  uvm_config_db #(virtual interface tinyalu_bfm)::set(null, "*", "class_bfm", class_bfm);
end

initial begin
  force top.class_dut.A       = class_bfm.A;
  force top.class_dut.B       = class_bfm.B;
  force top.class_dut.op      = class_bfm.op;
  force top.class_dut.clk     = class_bfm.clk;
  force top.class_dut.reset_n = class_bfm.reset_n;
  force top.class_dut.start   = class_bfm.start;

  force class_bfm.done   = top.class_dut.done;
  force class_bfm.result = top.class_dut.result;
end

`endif  // _CONNECT_CLASS_SV_
