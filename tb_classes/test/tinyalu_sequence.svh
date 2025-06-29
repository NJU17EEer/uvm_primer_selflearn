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
class tinyalu_sequence extends uvm_sequence #(sequence_item);

   sequence_item command;

   function new(string name = "tinyalu_sequence");
      super.new(name);
   endfunction : new

   task body();
      $fatal(1,"You cannot use tinalu_sequence directly. You must override it");
   endtask : body

endclass : tinyalu_sequence
