import uvm_pkg::*;
`include "uvm_macros.svh"

 //Include all files
`include "design.sv"
`include "interface.sv"
`include "apb_transaction.sv"
`include "apb_sequence.sv"
`include "apb_sequencer.sv"
`include "apb_driver.sv"
`include "apb_monitor.sv"
`include "apb_agent.sv"
`include "apb_scoreboard.sv"
`include "apb_env.sv"
`include "apb_test.sv"

//top module

module top;

bit PCLK;
  
always #5 PCLK=~PCLK;
  
apb_intf a_intf(PCLK);
apb DUT(.PCLK(PCLK),
.PRESETn(a_intf.PRESETn),
.PENABLE(a_intf.PENABLE),
        .PWRITE(a_intf.PWRITE),
.PSELx(a_intf.PSELx),
.PADDR(a_intf.PADDR),
.PWDATA(a_intf.PWDATA),
.PRDATA(a_intf.PRDATA),
.PREADY(a_intf.PREADY),
.PSLVERR(a_intf.PSLVERR)
);
initial
begin
  
  `uvm_info("Top","_______________Top_________________",UVM_NONE);

 uvm_config_db #(virtual apb_intf)::set(null,"*","name",a_intf);
 run_test("test");
end
endmodule
