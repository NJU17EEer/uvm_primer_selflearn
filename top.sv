/*
 Copyright 2013 Ray Salemi

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
module top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import tinyalu_pkg::*;
  `include "tinyalu_macros.svh"

  tinyalu class_dut ();
  tinyalu module_dut ();

  `include "connect_class.sv"
  `include "connect_module.sv"

  initial begin
    run_test();
  end

endmodule : top
