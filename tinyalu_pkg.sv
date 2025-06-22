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
package tinyalu_pkg;
   import uvm_pkg::*;
`include "uvm_macros.svh"

   typedef enum bit[2:0] {no_op  = 3'b000,
      add_op = 3'b001,
      and_op = 3'b010,
      xor_op = 3'b011,
      mul_op = 3'b100,
      rst_op = 3'b111} operation_t;

   `include "utils/tinyalu_agent_config.svh"
   `include "env/env_config.svh"

   `include "utils/sequence_item.svh"
   typedef uvm_sequencer #(sequence_item) sequencer;

   `include "utils/add_sequence_item.svh"
   `include "test/tinyalu_sequence.svh"
   `include "test/random_sequence.svh"
   `include "test/maxmult_sequence.svh"
   `include "test/reset_sequence.svh"
   `include "test/runall_sequence.svh"
   `include "test/tinyalu_runall_sequence.svh"
   `include "test/add_sequence.svh"
   `include "test/fibonacci_sequence.svh"
   `include "test/short_random_sequence.svh"


   `include "utils/result_transaction.svh"
   `include "utils/coverage.svh"
   `include "utils/scoreboard.svh"
   `include "utils/driver.svh"
   `include "utils/command_monitor.svh"
   `include "utils/result_monitor.svh"
   `include "utils/tinyalu_agent.svh"
   `include "env/env.svh"
   `include "test/parallel_sequence.svh"

   `include "test/tinyalu_base_test.svh"
   `include "test/full_test.svh"
   `include "test/fibonacci_test.svh"
   `include "test/parallel_test.svh"

endpackage : tinyalu_pkg
