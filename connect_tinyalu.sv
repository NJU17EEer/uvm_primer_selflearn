`ifndef _CONNECT_TINYALU_SV_
`define _CONNECT_TINYALU_SV_

tinyalu_bfm     bfm();

initial begin
  uvm_config_db #(virtual interface tinyalu_bfm)::set(null, "*", "bfm", bfm);
end

initial begin
  force top.DUT.A       = bfm.A;
  force top.DUT.B       = bfm.B;
  force top.DUT.op      = bfm.op;
  force top.DUT.clk     = bfm.clk;
  force top.DUT.reset_n = bfm.reset_n;
  force top.DUT.start   = bfm.start;

  force bfm.done   = top.DUT.done;
  force bfm.result = top.DUT.result;
end

`endif  // _CONNECT_TINYALU_SV_