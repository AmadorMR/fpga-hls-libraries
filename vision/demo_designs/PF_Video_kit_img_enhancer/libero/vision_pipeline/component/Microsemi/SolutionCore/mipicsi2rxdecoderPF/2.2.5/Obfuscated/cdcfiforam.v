`timescale 1ns/1ps
module cdcfiforam(data,
                  wren,
                  wraddress,
                  rdaddress,
                  wrclock,
                  rdclock,
                  q);
  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 32;
  input[(DATA_WIDTH - 1) : 0] data;
  input wren;
  input[(ADDR_WIDTH - 1) : 0] wraddress;
  input[(ADDR_WIDTH - 1) : 0] rdaddress;
  input wrclock;
  input rdclock;
  output[(DATA_WIDTH - 1) : 0] q;
  wire[(DATA_WIDTH - 1) : 0] q;
  reg[DATA_WIDTH - 1 : 0] Ill[0 : 2 ** ADDR_WIDTH - 1];
  reg[ADDR_WIDTH - 1 : 0] o0I;
  reg[ADDR_WIDTH - 1 : 0] l1I;
  reg lll;
  reg[DATA_WIDTH - 1 : 0] oll;
  always
    @(posedge wrclock)
    begin
      lll <= wren;
      l1I <= wraddress;
      oll <= data;
      if (lll == 1'b1)
        begin
          Ill[l1I] <= oll;
        end
    end
  always
    @(posedge rdclock)
    begin
      o0I <= rdaddress;
    end
  assign q = Ill[o0I];
endmodule
