`timescale 1ns/1ps
module cdcfifo #(parameter[3 : 0] ADDR_WIDTH = 12,
                 parameter[7 : 0] DATA_WIDTH = 8)
               (k_lim,
                wrrstn,
                wrclk,
                wrreq,
                wrdata,
                wrfull,
                wrusedw,
                rdrstn,
                rdclk,
                rdreq,
                rddata,
                rdempty,
                rdusedw);
  input[ADDR_WIDTH - 1 : 0] k_lim;
  input wrrstn;
  input wrclk;
  input wrreq;
  input[(DATA_WIDTH - 1) : 0] wrdata;
  output reg wrfull;
  output[(ADDR_WIDTH - 1) : 0] wrusedw;
  input rdrstn;
  input rdclk;
  input rdreq;
  output[(DATA_WIDTH - 1) : 0] rddata;
  output rdempty;
  output reg[(ADDR_WIDTH - 1) : 0] rdusedw;
  parameter[31 : 0] olI = 32'h00000001;
  parameter[31 : 0] ilI = 32'h00000003;
  wire O0I;
  wire I0I;
  wire l0I;
  reg[(ADDR_WIDTH - 1) : 0] o0I;
  reg[(ADDR_WIDTH - 1) : 0] i0I;
  reg[(ADDR_WIDTH - 1) : 0] O1I;
  reg[(ADDR_WIDTH - 1) : 0] I1I;
  reg[(ADDR_WIDTH - 1) : 0] l1I;
  reg[(ADDR_WIDTH - 1) : 0] o1I;
  reg[(ADDR_WIDTH - 1) : 0] i1I;
  reg[(ADDR_WIDTH - 1) : 0] OoI;
  reg[(ADDR_WIDTH - 1) : 0] IoI;
  reg[(ADDR_WIDTH - 1) : 0] loI;
  reg[(ADDR_WIDTH - 1) : 0] ooI;
  reg[(ADDR_WIDTH - 1) : 0] ioI;
  wire[(ADDR_WIDTH - 2) : 0] OiI;
  reg IiI,
      liI;
  assign OiI = { ADDR_WIDTH - 1 { 1'b0 } };
  cdcfiforam #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) oiI(.data(wrdata),
                                                                     .wren(I0I),
                                                                     .wraddress(l1I),
                                                                     .rdaddress(o0I),
                                                                     .wrclock(wrclk),
                                                                     .rdclock(rdclk),
                                                                     .q(rddata));
  always
    @(i1I or
      OiI)
    begin: iiI
      reg[(ADDR_WIDTH - 1) : 0] OOl;
      reg IOl;
      integer lOl;
      integer oOl;
      OOl[(ADDR_WIDTH - 1)] = i1I[(ADDR_WIDTH - 1)];
      OOl[(ADDR_WIDTH - 2) : 0] = OiI;
      IOl = 1'b0;
      for (lOl = 0; lOl <= (ADDR_WIDTH - 1); lOl = lOl + 1)
        begin
          for (oOl = lOl; oOl <= (ADDR_WIDTH - 1); oOl = oOl + 1)
            OOl[lOl] = OOl[lOl] ^ i1I[oOl];
          IoI[lOl] <= i1I[lOl] ^ ((~IOl) & (~OOl[lOl]));
          IOl = IOl | (~OOl[lOl]);
        end
    end
  always
    @(negedge wrrstn or
      posedge wrclk)
    begin: iOl
      reg[(ADDR_WIDTH - 1) : 0] OIl;
      reg[(ADDR_WIDTH - 1) : 0] IIl;
      integer lOl;
      if (wrrstn == 1'b0)
        begin
          l1I <= { ADDR_WIDTH { 1'b0 } };
          o1I <= { ADDR_WIDTH { 1'b0 } };
          OoI <= olI[(ADDR_WIDTH - 1) : 0];
          i1I <= ilI[(ADDR_WIDTH - 1) : 0];
          O1I <= { ADDR_WIDTH { 1'b0 } };
          I1I <= { ADDR_WIDTH { 1'b0 } };
          ioI <= { ADDR_WIDTH { 1'b0 } };
          wrfull <= 1'b0;
          IIl = { ADDR_WIDTH { 1'b0 } };
          OIl = { ADDR_WIDTH { 1'b0 } };
        end
      else
        begin
          if (I0I == 1'b1)
            begin
              i1I <= IoI;
              OoI <= i1I;
              l1I <= OoI;
            end
          o1I <= l1I;
          O1I <= o0I;
          I1I <= O1I;
          OIl[(ADDR_WIDTH - 1)] = o1I[(ADDR_WIDTH - 1)];
          for (lOl = (ADDR_WIDTH - 2); lOl >= 0; lOl = lOl - 1)
            OIl[lOl] = OIl[lOl + 1] ^ o1I[lOl];
          IIl[(ADDR_WIDTH - 1)] = I1I[(ADDR_WIDTH - 1)];
          for (lOl = (ADDR_WIDTH - 2); lOl >= 0; lOl = lOl - 1)
            IIl[lOl] = IIl[lOl + 1] ^ I1I[lOl];
          if (ioI >= k_lim)
            wrfull <= 1'b1;
          else
            wrfull <= 1'b0;
          { liI, ioI } <= OIl - IIl;
        end
    end
  assign wrusedw = ioI;
  assign I0I = wrreq;
  always
    @(o0I or
      O0I or
      OiI)
    begin: lIl
      reg[(ADDR_WIDTH - 1) : 0] OOl;
      reg IOl;
      integer lOl;
      integer oOl;
      OOl[(ADDR_WIDTH - 1)] = o0I[(ADDR_WIDTH - 1)];
      OOl[(ADDR_WIDTH - 2) : 0] = OiI;
      IOl = 1'b0;
      for (lOl = 0; lOl <= (ADDR_WIDTH - 1); lOl = lOl + 1)
        begin
          for (oOl = lOl; oOl <= (ADDR_WIDTH - 1); oOl = oOl + 1)
            OOl[lOl] = OOl[lOl] ^ o0I[oOl];
          i0I[lOl] <= o0I[lOl] ^ (O0I & (~IOl) & (~OOl[lOl]));
          IOl = IOl | (~OOl[lOl]);
        end
    end
  always
    @(negedge rdrstn or
      posedge rdclk)
    begin: oIl
      reg[(ADDR_WIDTH - 1) : 0] iIl;
      reg[(ADDR_WIDTH - 1) : 0] Oll;
      integer lOl;
      if (rdrstn == 1'b0)
        begin
          o0I <= { ADDR_WIDTH { 1'b0 } };
          loI <= { ADDR_WIDTH { 1'b0 } };
          ooI <= { ADDR_WIDTH { 1'b0 } };
          rdusedw <= { ADDR_WIDTH { 1'b0 } };
          iIl = { ADDR_WIDTH { 1'b0 } };
          Oll = { ADDR_WIDTH { 1'b0 } };
        end
      else
        begin
          o0I <= i0I;
          loI <= o1I;
          ooI <= loI;
          Oll[(ADDR_WIDTH - 1)] = ooI[(ADDR_WIDTH - 1)];
          for (lOl = (ADDR_WIDTH - 2); lOl >= 0; lOl = lOl - 1)
            Oll[lOl] = Oll[lOl + 1] ^ ooI[lOl];
          iIl[(ADDR_WIDTH - 1)] = o0I[(ADDR_WIDTH - 1)];
          for (lOl = (ADDR_WIDTH - 2); lOl >= 0; lOl = lOl - 1)
            iIl[lOl] = iIl[lOl + 1] ^ o0I[lOl];
          { IiI, rdusedw } <= Oll - iIl;
        end
    end
  assign l0I = (ooI == o0I) ? 1'b1 : 1'b0;
  assign rdempty = l0I;
  assign O0I = rdreq & (~l0I);
endmodule
