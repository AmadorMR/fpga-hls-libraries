module embsync_detect #(parameter g_LANE_WIDTH = 8)
                      (input RESET_N_I,
                       input CLOCK_I,
                       input[7 : 0] L0_DATA_I,
                       input[7 : 0] L1_DATA_I,
                       input[7 : 0] L2_DATA_I,
                       input[7 : 0] L3_DATA_I,
                       input[7 : 0] L4_DATA_I,
                       input[7 : 0] L5_DATA_I,
                       input[7 : 0] L6_DATA_I,
                       input[7 : 0] L7_DATA_I,
                       input L0_LP_DATA_N_I,
                       input L1_LP_DATA_N_I,
                       input L2_LP_DATA_N_I,
                       input L3_LP_DATA_N_I,
                       input L4_LP_DATA_N_I,
                       input L5_LP_DATA_N_I,
                       input L6_LP_DATA_N_I,
                       input L7_LP_DATA_N_I,
                       output[7 : 0] L0_DATA_O,
                       output[7 : 0] L1_DATA_O,
                       output[7 : 0] L2_DATA_O,
                       output[7 : 0] L3_DATA_O,
                       output[7 : 0] L4_DATA_O,
                       output[7 : 0] L5_DATA_O,
                       output[7 : 0] L6_DATA_O,
                       output[7 : 0] L7_DATA_O);
  reg[7 : 0] ill,
             O0l,
             I0l,
             l0l,
             o0l,
             i0l,
             O1l,
             I1l;
  reg[7 : 0] l1l,
             o1l,
             i1l,
             Ool,
             Iol,
             lol,
             ool,
             iol;
  reg[7 : 0] Oil,
             Iil,
             lil,
             oil,
             iil,
             OO0,
             IO0,
             lO0;
  reg[7 : 0] oO0,
             iO0,
             OI0,
             II0,
             lI0,
             oI0,
             iI0,
             Ol0;
  reg[7 : 0] Il0,
             ll0,
             ol0,
             il0,
             O00,
             I00,
             l00,
             o00;
  reg[7 : 0] i00,
             O10,
             I10,
             l10,
             o10,
             i10,
             Oo0,
             Io0;
  reg[7 : 0] lo0,
             oo0,
             io0,
             Oi0,
             Ii0,
             li0,
             oi0,
             ii0;
  reg[2 : 0] OO1,
             IO1,
             lO1,
             oO1,
             iO1,
             OI1,
             II1,
             lI1;
  reg[7 : 0] oI1,
             iI1,
             Ol1,
             Il1,
             ll1,
             ol1,
             il1,
             O01;
  wire[7 : 0] I01,
              l01,
              o01,
              i01,
              O11,
              I11,
              l11,
              o11;
  reg i11,
      Oo1,
      Io1,
      lo1,
      oo1,
      io1,
      Oi1,
      Ii1;
  reg[7 : 0] li1,
             oi1,
             ii1,
             OOo,
             IOo,
             lOo,
             oOo,
             iOo,
             OIo,
             IIo,
             lIo,
             oIo,
             iIo,
             Olo,
             Ilo,
             llo,
             olo,
             ilo,
             O0o,
             I0o,
             l0o,
             o0o,
             i0o,
             O1o,
             I1o,
             l1o,
             o1o,
             i1o,
             Ooo,
             Ioo,
             loo,
             ooo,
             ioo,
             Oio,
             Iio,
             lio,
             oio,
             iio,
             OOi,
             IOi,
             lOi,
             oOi,
             iOi,
             OIi,
             IIi,
             lIi,
             oIi,
             iIi,
				 Oli,
				 Ili,
				 lli,
				 oli,
				 ili,
				 O0i,
				 I0i,
				 l0i,
             o0i,
             i0i,
             O1i,
             I1i,
             l1i,
             o1i,
             i1i,
             Ooi;
  reg Ioi,
      loi,
      ooi,
      ioi,
      Oii,
      Iii,
      lii,
      oii;
  reg iii;
  reg[10 : 0] OOOI;
  wire IOOI;
  wire lOOI;
  wire oOOI;
  wire iOOI;
  wire OIOI;
  wire IIOI;
  wire lIOI;
  wire oIOI;
  reg[3 : 0] iIOI;
  reg[3 : 0] OlOI;
  reg[3 : 0] IlOI;
  reg[3 : 0] llOI;
  reg[3 : 0] olOI;
  reg[3 : 0] ilOI;
  reg[3 : 0] O0OI;
  reg[3 : 0] I0OI;
  assign IOOI = ~(iIOI[3] & iIOI[2] & iIOI[1] & iIOI[0] & L0_LP_DATA_N_I);
  assign lOOI = ~(OlOI[3] & OlOI[2] & OlOI[1] & OlOI[0] & L1_LP_DATA_N_I);
  assign oOOI = ~(IlOI[3] & IlOI[2] & IlOI[1] & IlOI[0] & L2_LP_DATA_N_I);
  assign iOOI = ~(llOI[3] & llOI[2] & llOI[1] & llOI[0] & L3_LP_DATA_N_I);
  assign OIOI = ~(olOI[3] & olOI[2] & olOI[1] & olOI[0] & L4_LP_DATA_N_I);
  assign IIOI = ~(ilOI[3] & ilOI[2] & ilOI[1] & ilOI[0] & L5_LP_DATA_N_I);
  assign lIOI = ~(O0OI[3] & O0OI[2] & O0OI[1] & O0OI[0] & L6_LP_DATA_N_I);
  assign oIOI = ~(I0OI[3] & I0OI[2] & I0OI[1] & I0OI[0] & L7_LP_DATA_N_I);
  always
    @(posedge CLOCK_I or
      negedge RESET_N_I)
    if (!RESET_N_I)
      begin
        iIOI <= 4'hF;
        OlOI <= 4'hF;
        IlOI <= 4'hF;
        llOI <= 4'hF;
        olOI <= 4'hF;
        ilOI <= 4'hF;
        O0OI <= 4'hF;
        I0OI <= 4'hF;
      end
    else
      begin
        iIOI <= { iIOI[2 : 0], L0_LP_DATA_N_I };
        OlOI <= { OlOI[2 : 0], L1_LP_DATA_N_I };
        IlOI <= { IlOI[2 : 0], L2_LP_DATA_N_I };
        llOI <= { llOI[2 : 0], L3_LP_DATA_N_I };
        olOI <= { olOI[2 : 0], L4_LP_DATA_N_I };
        ilOI <= { ilOI[2 : 0], L5_LP_DATA_N_I };
        O0OI <= { O0OI[2 : 0], L6_LP_DATA_N_I };
        I0OI <= { I0OI[2 : 0], L7_LP_DATA_N_I };
      end
  generate
    if (g_LANE_WIDTH > 0)
      begin
        always
          @(posedge CLOCK_I or
            negedge IOOI)
          begin
            if (!IOOI)
              begin
                ill <= 0;
                l1l <= 0;
                Oil <= 0;
                oO0 <= 0;
                Il0 <= 0;
                i00 <= 0;
                lo0 <= 0;
              end
            else
              begin
                ill <= { L0_DATA_I[0], L0_DATA_I[1], L0_DATA_I[2], L0_DATA_I[3], L0_DATA_I[4], L0_DATA_I[5], L0_DATA_I[6], L0_DATA_I[7] };
                l1l <= ill[7 : 0];
                Oil <= l1l;
                oO0 <= Oil;
                Il0 <= oO0;
                i00 <= Il0;
                lo0 <= i00;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge IOOI)
          begin
            if (!IOOI)
              begin
                OO1 <= 0;
                i11 <= 0;
              end
            else
              if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000000) && (ill[7 : 0] == 8'b00011101))
                begin
                  OO1 <= 0;
                  i11 <= 1;
                end
              else
                if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000000) && (ill[7 : 1] == 7'b0011101))
                  begin
                    OO1 <= 1;
                    i11 <= 1;
                  end
                else
                  if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000000) && (ill[7 : 2] == 6'b011101))
                    begin
                      OO1 <= 2;
                      i11 <= 1;
                    end
                  else
                    if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000000) && (ill[7 : 3] == 5'b11101))
                      begin
                        OO1 <= 3;
                        i11 <= 1;
                      end
                    else
                      if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000001) && (ill[7 : 4] == 4'b1101))
                        begin
                          OO1 <= 4;
                          i11 <= 1;
                        end
                      else
                        if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000011) && (ill[7 : 5] == 3'b101))
                          begin
                            OO1 <= 5;
                            i11 <= 1;
                          end
                        else
                          if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00000111) && (ill[7 : 6] == 2'b01))
                            begin
                              OO1 <= 6;
                              i11 <= 1;
                            end
                          else
                            if ((Il0 == 8'h00) && (oO0 == 8'h00) && (Oil == 8'h00) && (l1l == 8'b00001110) && (ill[7 : 7] == 1'b1))
                              begin
                                OO1 <= 7;
                                i11 <= 1;
                              end
                            else
                              begin
                                OO1 <= OO1;
                                i11 <= i11;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge IOOI)
          begin
            if (!IOOI)
              oI1 <= 0;
            else
              if (i11)
                case (OO1)
                  0:
                    oI1 <= lo0;
                  1:
                    oI1 <= { lo0[0], i00[7 : 1] };
                  2:
                    oI1 <= { lo0[1 : 0], i00[7 : 2] };
                  3:
                    oI1 <= { lo0[2 : 0], i00[7 : 3] };
                  4:
                    oI1 <= { lo0[3 : 0], i00[7 : 4] };
                  5:
                    oI1 <= { lo0[4 : 0], i00[7 : 5] };
                  6:
                    oI1 <= { lo0[5 : 0], i00[7 : 6] };
                  7:
                    oI1 <= { lo0[6 : 0], i00[7 : 7] };
                  default:
                    oI1 <= 0;
                endcase
              else
                oI1 <= 0;
          end
        assign I01 = { oI1[0], oI1[1], oI1[2], oI1[3], oI1[4], oI1[5], oI1[6], oI1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 1)
      begin
        always
          @(posedge CLOCK_I or
            negedge lOOI)
          begin
            if (!lOOI)
              begin
                O0l <= 0;
                o1l <= 0;
                Iil <= 0;
                iO0 <= 0;
                ll0 <= 0;
                O10 <= 0;
                oo0 <= 0;
              end
            else
              begin
                O0l <= { L1_DATA_I[0], L1_DATA_I[1], L1_DATA_I[2], L1_DATA_I[3], L1_DATA_I[4], L1_DATA_I[5], L1_DATA_I[6], L1_DATA_I[7] };
                o1l <= O0l[7 : 0];
                Iil <= o1l;
                iO0 <= Iil;
                ll0 <= iO0;
                O10 <= ll0;
                oo0 <= O10;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge lOOI)
          begin
            if (!lOOI)
              begin
                IO1 <= 0;
                Oo1 <= 0;
              end
            else
              if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000000) && (O0l[7 : 0] == 8'b00011101))
                begin
                  IO1 <= 0;
                  Oo1 <= 1;
                end
              else
                if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000000) && (O0l[7 : 1] == 7'b0011101))
                  begin
                    IO1 <= 1;
                    Oo1 <= 1;
                  end
                else
                  if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000000) && (O0l[7 : 2] == 6'b011101))
                    begin
                      IO1 <= 2;
                      Oo1 <= 1;
                    end
                  else
                    if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000000) && (O0l[7 : 3] == 5'b11101))
                      begin
                        IO1 <= 3;
                        Oo1 <= 1;
                      end
                    else
                      if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000001) && (O0l[7 : 4] == 4'b1101))
                        begin
                          IO1 <= 4;
                          Oo1 <= 1;
                        end
                      else
                        if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000011) && (O0l[7 : 5] == 3'b101))
                          begin
                            IO1 <= 5;
                            Oo1 <= 1;
                          end
                        else
                          if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00000111) && (O0l[7 : 6] == 2'b01))
                            begin
                              IO1 <= 6;
                              Oo1 <= 1;
                            end
                          else
                            if ((ll0 == 8'h00) && (iO0 == 8'h00) && (Iil == 8'h00) && (o1l == 8'b00001110) && (O0l[7 : 7] == 1'b1))
                              begin
                                IO1 <= 7;
                                Oo1 <= 1;
                              end
                            else
                              begin
                                IO1 <= IO1;
                                Oo1 <= Oo1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge lOOI)
          begin
            if (!lOOI)
              iI1 <= 0;
            else
              if (Oo1)
                case (IO1)
                  0:
                    iI1 <= oo0;
                  1:
                    iI1 <= { oo0[0], O10[7 : 1] };
                  2:
                    iI1 <= { oo0[1 : 0], O10[7 : 2] };
                  3:
                    iI1 <= { oo0[2 : 0], O10[7 : 3] };
                  4:
                    iI1 <= { oo0[3 : 0], O10[7 : 4] };
                  5:
                    iI1 <= { oo0[4 : 0], O10[7 : 5] };
                  6:
                    iI1 <= { oo0[5 : 0], O10[7 : 6] };
                  7:
                    iI1 <= { oo0[6 : 0], O10[7 : 7] };
                  default:
                    iI1 <= 0;
                endcase
              else
                iI1 <= 0;
          end
        assign l01 = { iI1[0], iI1[1], iI1[2], iI1[3], iI1[4], iI1[5], iI1[6], iI1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 2)
      begin
        always
          @(posedge CLOCK_I or
            negedge oOOI)
          begin
            if (!oOOI)
              begin
                I0l <= 0;
                i1l <= 0;
                lil <= 0;
                OI0 <= 0;
                ol0 <= 0;
                I10 <= 0;
                io0 <= 0;
              end
            else
              begin
                I0l <= { L2_DATA_I[0], L2_DATA_I[1], L2_DATA_I[2], L2_DATA_I[3], L2_DATA_I[4], L2_DATA_I[5], L2_DATA_I[6], L2_DATA_I[7] };
                i1l <= I0l[7 : 0];
                lil <= i1l;
                OI0 <= lil;
                ol0 <= OI0;
                I10 <= ol0;
                io0 <= I10;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge oOOI)
          begin
            if (!oOOI)
              begin
                lO1 <= 0;
                Io1 <= 0;
              end
            else
              if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000000) && (I0l[7 : 0] == 8'b00011101))
                begin
                  lO1 <= 0;
                  Io1 <= 1;
                end
              else
                if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000000) && (I0l[7 : 1] == 7'b0011101))
                  begin
                    lO1 <= 1;
                    Io1 <= 1;
                  end
                else
                  if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000000) && (I0l[7 : 2] == 6'b011101))
                    begin
                      lO1 <= 2;
                      Io1 <= 1;
                    end
                  else
                    if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000000) && (I0l[7 : 3] == 5'b11101))
                      begin
                        lO1 <= 3;
                        Io1 <= 1;
                      end
                    else
                      if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000001) && (I0l[7 : 4] == 4'b1101))
                        begin
                          lO1 <= 4;
                          Io1 <= 1;
                        end
                      else
                        if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000011) && (I0l[7 : 5] == 3'b101))
                          begin
                            lO1 <= 5;
                            Io1 <= 1;
                          end
                        else
                          if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00000111) && (I0l[7 : 6] == 2'b01))
                            begin
                              lO1 <= 6;
                              Io1 <= 1;
                            end
                          else
                            if ((ol0 == 8'h00) && (OI0 == 8'h00) && (lil == 8'h00) && (i1l == 8'b00001110) && (I0l[7 : 7] == 1'b1))
                              begin
                                lO1 <= 7;
                                Io1 <= 1;
                              end
                            else
                              begin
                                lO1 <= lO1;
                                Io1 <= Io1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge oOOI)
          begin
            if (!oOOI)
              Ol1 <= 0;
            else
              if (Io1)
                case (lO1)
                  0:
                    Ol1 <= io0;
                  1:
                    Ol1 <= { io0[0], I10[7 : 1] };
                  2:
                    Ol1 <= { io0[1 : 0], I10[7 : 2] };
                  3:
                    Ol1 <= { io0[2 : 0], I10[7 : 3] };
                  4:
                    Ol1 <= { io0[3 : 0], I10[7 : 4] };
                  5:
                    Ol1 <= { io0[4 : 0], I10[7 : 5] };
                  6:
                    Ol1 <= { io0[5 : 0], I10[7 : 6] };
                  7:
                    Ol1 <= { io0[6 : 0], I10[7 : 7] };
                  default:
                    Ol1 <= 0;
                endcase
              else
                Ol1 <= 0;
          end
        assign o01 = { Ol1[0], Ol1[1], Ol1[2], Ol1[3], Ol1[4], Ol1[5], Ol1[6], Ol1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 3)
      begin
        always
          @(posedge CLOCK_I or
            negedge iOOI)
          begin
            if (!iOOI)
              begin
                l0l <= 0;
                Ool <= 0;
                oil <= 0;
                II0 <= 0;
                il0 <= 0;
                l10 <= 0;
                Oi0 <= 0;
              end
            else
              begin
                l0l <= { L3_DATA_I[0], L3_DATA_I[1], L3_DATA_I[2], L3_DATA_I[3], L3_DATA_I[4], L3_DATA_I[5], L3_DATA_I[6], L3_DATA_I[7] };
                Ool <= l0l[7 : 0];
                oil <= Ool;
                II0 <= oil;
                il0 <= II0;
                l10 <= il0;
                Oi0 <= l10;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge iOOI)
          begin
            if (!iOOI)
              begin
                oO1 <= 0;
                lo1 <= 0;
              end
            else
              if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000000) && (l0l[7 : 0] == 8'b00011101))
                begin
                  oO1 <= 0;
                  lo1 <= 1;
                end
              else
                if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000000) && (l0l[7 : 1] == 7'b0011101))
                  begin
                    oO1 <= 1;
                    lo1 <= 1;
                  end
                else
                  if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000000) && (l0l[7 : 2] == 6'b011101))
                    begin
                      oO1 <= 2;
                      lo1 <= 1;
                    end
                  else
                    if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000000) && (l0l[7 : 3] == 5'b11101))
                      begin
                        oO1 <= 3;
                        lo1 <= 1;
                      end
                    else
                      if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000001) && (l0l[7 : 4] == 4'b1101))
                        begin
                          oO1 <= 4;
                          lo1 <= 1;
                        end
                      else
                        if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000011) && (l0l[7 : 5] == 3'b101))
                          begin
                            oO1 <= 5;
                            lo1 <= 1;
                          end
                        else
                          if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00000111) && (l0l[7 : 6] == 2'b01))
                            begin
                              oO1 <= 6;
                              lo1 <= 1;
                            end
                          else
                            if ((il0 == 8'h00) && (II0 == 8'h00) && (oil == 8'h00) && (Ool == 8'b00001110) && (l0l[7 : 7] == 1'b1))
                              begin
                                oO1 <= 7;
                                lo1 <= 1;
                              end
                            else
                              begin
                                oO1 <= oO1;
                                lo1 <= lo1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge iOOI)
          begin
            if (!iOOI)
              Il1 <= 0;
            else
              if (lo1)
                case (oO1)
                  0:
                    Il1 <= Oi0;
                  1:
                    Il1 <= { Oi0[0], l10[7 : 1] };
                  2:
                    Il1 <= { Oi0[1 : 0], l10[7 : 2] };
                  3:
                    Il1 <= { Oi0[2 : 0], l10[7 : 3] };
                  4:
                    Il1 <= { Oi0[3 : 0], l10[7 : 4] };
                  5:
                    Il1 <= { Oi0[4 : 0], l10[7 : 5] };
                  6:
                    Il1 <= { Oi0[5 : 0], l10[7 : 6] };
                  7:
                    Il1 <= { Oi0[6 : 0], l10[7 : 7] };
                  default:
                    Il1 <= 0;
                endcase
              else
                Il1 <= 0;
          end
        assign i01 = { Il1[0], Il1[1], Il1[2], Il1[3], Il1[4], Il1[5], Il1[6], Il1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 4)
      begin
        always
          @(posedge CLOCK_I or
            negedge OIOI)
          begin
            if (!OIOI)
              begin
                o0l <= 0;
                Iol <= 0;
                iil <= 0;
                lI0 <= 0;
                O00 <= 0;
                o10 <= 0;
                Ii0 <= 0;
              end
            else
              begin
                o0l <= { L4_DATA_I[0], L4_DATA_I[1], L4_DATA_I[2], L4_DATA_I[3], L4_DATA_I[4], L4_DATA_I[5], L4_DATA_I[6], L4_DATA_I[7] };
                Iol <= o0l[7 : 0];
                iil <= Iol;
                lI0 <= iil;
                O00 <= lI0;
                o10 <= O00;
                Ii0 <= o10;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge OIOI)
          begin
            if (!OIOI)
              begin
                iO1 <= 0;
                oo1 <= 0;
              end
            else
              if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000000) && (o0l[7 : 0] == 8'b00011101))
                begin
                  iO1 <= 0;
                  oo1 <= 1;
                end
              else
                if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000000) && (o0l[7 : 1] == 7'b0011101))
                  begin
                    iO1 <= 1;
                    oo1 <= 1;
                  end
                else
                  if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000000) && (o0l[7 : 2] == 6'b011101))
                    begin
                      iO1 <= 2;
                      oo1 <= 1;
                    end
                  else
                    if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000000) && (o0l[7 : 3] == 5'b11101))
                      begin
                        iO1 <= 3;
                        oo1 <= 1;
                      end
                    else
                      if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000001) && (o0l[7 : 4] == 4'b1101))
                        begin
                          iO1 <= 4;
                          oo1 <= 1;
                        end
                      else
                        if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000011) && (o0l[7 : 5] == 3'b101))
                          begin
                            iO1 <= 5;
                            oo1 <= 1;
                          end
                        else
                          if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00000111) && (o0l[7 : 6] == 2'b01))
                            begin
                              iO1 <= 6;
                              oo1 <= 1;
                            end
                          else
                            if ((O00 == 8'h00) && (lI0 == 8'h00) && (iil == 8'h00) && (Iol == 8'b00001110) && (o0l[7 : 7] == 1'b1))
                              begin
                                iO1 <= 7;
                                oo1 <= 1;
                              end
                            else
                              begin
                                iO1 <= iO1;
                                oo1 <= oo1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge OIOI)
          begin
            if (!OIOI)
              ll1 <= 0;
            else
              if (oo1)
                case (iO1)
                  0:
                    ll1 <= Ii0;
                  1:
                    ll1 <= { Ii0[0], o10[7 : 1] };
                  2:
                    ll1 <= { Ii0[1 : 0], o10[7 : 2] };
                  3:
                    ll1 <= { Ii0[2 : 0], o10[7 : 3] };
                  4:
                    ll1 <= { Ii0[3 : 0], o10[7 : 4] };
                  5:
                    ll1 <= { Ii0[4 : 0], o10[7 : 5] };
                  6:
                    ll1 <= { Ii0[5 : 0], o10[7 : 6] };
                  7:
                    ll1 <= { Ii0[6 : 0], o10[7 : 7] };
                  default:
                    ll1 <= 0;
                endcase
              else
                ll1 <= 0;
          end
        assign O11 = { ll1[0], ll1[1], ll1[2], ll1[3], ll1[4], ll1[5], ll1[6], ll1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 5)
      begin
        always
          @(posedge CLOCK_I or
            negedge IIOI)
          begin
            if (!IIOI)
              begin
                i0l <= 0;
                lol <= 0;
                OO0 <= 0;
                oI0 <= 0;
                I00 <= 0;
                i10 <= 0;
                li0 <= 0;
              end
            else
              begin
                i0l <= { L5_DATA_I[0], L5_DATA_I[1], L5_DATA_I[2], L5_DATA_I[3], L5_DATA_I[4], L5_DATA_I[5], L5_DATA_I[6], L5_DATA_I[7] };
                lol <= i0l[7 : 0];
                OO0 <= lol;
                oI0 <= OO0;
                I00 <= oI0;
                i10 <= I00;
                li0 <= i10;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge IIOI)
          begin
            if (!IIOI)
              begin
                OI1 <= 0;
                io1 <= 0;
              end
            else
              if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000000) && (i0l[7 : 0] == 8'b00011101))
                begin
                  OI1 <= 0;
                  io1 <= 1;
                end
              else
                if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000000) && (i0l[7 : 1] == 7'b0011101))
                  begin
                    OI1 <= 1;
                    io1 <= 1;
                  end
                else
                  if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000000) && (i0l[7 : 2] == 6'b011101))
                    begin
                      OI1 <= 2;
                      io1 <= 1;
                    end
                  else
                    if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000000) && (i0l[7 : 3] == 5'b11101))
                      begin
                        OI1 <= 3;
                        io1 <= 1;
                      end
                    else
                      if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000001) && (i0l[7 : 4] == 4'b1101))
                        begin
                          OI1 <= 4;
                          io1 <= 1;
                        end
                      else
                        if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000011) && (i0l[7 : 5] == 3'b101))
                          begin
                            OI1 <= 5;
                            io1 <= 1;
                          end
                        else
                          if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00000111) && (i0l[7 : 6] == 2'b01))
                            begin
                              OI1 <= 6;
                              io1 <= 1;
                            end
                          else
                            if ((I00 == 8'h00) && (oI0 == 8'h00) && (OO0 == 8'h00) && (lol == 8'b00001110) && (i0l[7 : 7] == 1'b1))
                              begin
                                OI1 <= 7;
                                io1 <= 1;
                              end
                            else
                              begin
                                OI1 <= OI1;
                                io1 <= io1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge IIOI)
          begin
            if (!IIOI)
              ol1 <= 0;
            else
              if (io1)
                case (OI1)
                  0:
                    ol1 <= li0;
                  1:
                    ol1 <= { li0[0], i10[7 : 1] };
                  2:
                    ol1 <= { li0[1 : 0], i10[7 : 2] };
                  3:
                    ol1 <= { li0[2 : 0], i10[7 : 3] };
                  4:
                    ol1 <= { li0[3 : 0], i10[7 : 4] };
                  5:
                    ol1 <= { li0[4 : 0], i10[7 : 5] };
                  6:
                    ol1 <= { li0[5 : 0], i10[7 : 6] };
                  7:
                    ol1 <= { li0[6 : 0], i10[7 : 7] };
                  default:
                    ol1 <= 0;
                endcase
              else
                ol1 <= 0;
          end
        assign I11 = { ol1[0], ol1[1], ol1[2], ol1[3], ol1[4], ol1[5], ol1[6], ol1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 6)
      begin
        always
          @(posedge CLOCK_I or
            negedge lIOI)
          begin
            if (!lIOI)
              begin
                O1l <= 0;
                ool <= 0;
                IO0 <= 0;
                iI0 <= 0;
                l00 <= 0;
                Oo0 <= 0;
                oi0 <= 0;
              end
            else
              begin
                O1l <= { L6_DATA_I[0], L6_DATA_I[1], L6_DATA_I[2], L6_DATA_I[3], L6_DATA_I[4], L6_DATA_I[5], L6_DATA_I[6], L6_DATA_I[7] };
                ool <= O1l[7 : 0];
                IO0 <= ool;
                iI0 <= IO0;
                l00 <= iI0;
                Oo0 <= l00;
                oi0 <= Oo0;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge lIOI)
          begin
            if (!lIOI)
              begin
                II1 <= 0;
                Oi1 <= 0;
              end
            else
              if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000000) && (O1l[7 : 0] == 8'b00011101))
                begin
                  II1 <= 0;
                  Oi1 <= 1;
                end
              else
                if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000000) && (O1l[7 : 1] == 7'b0011101))
                  begin
                    II1 <= 1;
                    Oi1 <= 1;
                  end
                else
                  if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000000) && (O1l[7 : 2] == 6'b011101))
                    begin
                      II1 <= 2;
                      Oi1 <= 1;
                    end
                  else
                    if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000000) && (O1l[7 : 3] == 5'b11101))
                      begin
                        II1 <= 3;
                        Oi1 <= 1;
                      end
                    else
                      if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000001) && (O1l[7 : 4] == 4'b1101))
                        begin
                          II1 <= 4;
                          Oi1 <= 1;
                        end
                      else
                        if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000011) && (O1l[7 : 5] == 3'b101))
                          begin
                            II1 <= 5;
                            Oi1 <= 1;
                          end
                        else
                          if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00000111) && (O1l[7 : 6] == 2'b01))
                            begin
                              II1 <= 6;
                              Oi1 <= 1;
                            end
                          else
                            if ((l00 == 8'h00) && (iI0 == 8'h00) && (IO0 == 8'h00) && (ool == 8'b00001110) && (O1l[7 : 7] == 1'b1))
                              begin
                                II1 <= 7;
                                Oi1 <= 1;
                              end
                            else
                              begin
                                II1 <= II1;
                                Oi1 <= Oi1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge lIOI)
          begin
            if (!lIOI)
              il1 <= 0;
            else
              if (Oi1)
                case (II1)
                  0:
                    il1 <= oi0;
                  1:
                    il1 <= { oi0[0], Oo0[7 : 1] };
                  2:
                    il1 <= { oi0[1 : 0], Oo0[7 : 2] };
                  3:
                    il1 <= { oi0[2 : 0], Oo0[7 : 3] };
                  4:
                    il1 <= { oi0[3 : 0], Oo0[7 : 4] };
                  5:
                    il1 <= { oi0[4 : 0], Oo0[7 : 5] };
                  6:
                    il1 <= { oi0[5 : 0], Oo0[7 : 6] };
                  7:
                    il1 <= { oi0[6 : 0], Oo0[7 : 7] };
                  default:
                    il1 <= 0;
                endcase
              else
                il1 <= 0;
          end
        assign l11 = { il1[0], il1[1], il1[2], il1[3], il1[4], il1[5], il1[6], il1[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH > 7)
      begin
        always
          @(posedge CLOCK_I or
            negedge oIOI)
          begin
            if (!oIOI)
              begin
                I1l <= 0;
                iol <= 0;
                lO0 <= 0;
                Ol0 <= 0;
                o00 <= 0;
                Io0 <= 0;
                ii0 <= 0;
              end
            else
              begin
                I1l <= { L7_DATA_I[0], L7_DATA_I[1], L7_DATA_I[2], L7_DATA_I[3], L7_DATA_I[4], L7_DATA_I[5], L7_DATA_I[6], L7_DATA_I[7] };
                iol <= I1l[7 : 0];
                lO0 <= iol;
                Ol0 <= lO0;
                o00 <= Ol0;
                Io0 <= o00;
                ii0 <= Io0;
              end
          end
        always
          @(posedge CLOCK_I or
            negedge oIOI)
          begin
            if (!oIOI)
              begin
                lI1 <= 0;
                Ii1 <= 0;
              end
            else
              if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000000) && (I1l[7 : 0] == 8'b00011101))
                begin
                  lI1 <= 0;
                  Ii1 <= 1;
                end
              else
                if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000000) && (I1l[7 : 1] == 7'b0011101))
                  begin
                    lI1 <= 1;
                    Ii1 <= 1;
                  end
                else
                  if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000000) && (I1l[7 : 2] == 6'b011101))
                    begin
                      lI1 <= 2;
                      Ii1 <= 1;
                    end
                  else
                    if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000000) && (I1l[7 : 3] == 5'b11101))
                      begin
                        lI1 <= 3;
                        Ii1 <= 1;
                      end
                    else
                      if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000001) && (I1l[7 : 4] == 4'b1101))
                        begin
                          lI1 <= 4;
                          Ii1 <= 1;
                        end
                      else
                        if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000011) && (I1l[7 : 5] == 3'b101))
                          begin
                            lI1 <= 5;
                            Ii1 <= 1;
                          end
                        else
                          if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00000111) && (I1l[7 : 6] == 2'b01))
                            begin
                              lI1 <= 6;
                              Ii1 <= 1;
                            end
                          else
                            if ((o00 == 8'h00) && (Ol0 == 8'h00) && (lO0 == 8'h00) && (iol == 8'b00001110) && (I1l[7 : 7] == 1'b1))
                              begin
                                lI1 <= 7;
                                Ii1 <= 1;
                              end
                            else
                              begin
                                lI1 <= lI1;
                                Ii1 <= Ii1;
                              end
          end
        always
          @(posedge CLOCK_I or
            negedge oIOI)
          begin
            if (!oIOI)
              O01 <= 0;
            else
              if (Ii1)
                case (lI1)
                  0:
                    O01 <= ii0;
                  1:
                    O01 <= { ii0[0], Io0[7 : 1] };
                  2:
                    O01 <= { ii0[1 : 0], Io0[7 : 2] };
                  3:
                    O01 <= { ii0[2 : 0], Io0[7 : 3] };
                  4:
                    O01 <= { ii0[3 : 0], Io0[7 : 4] };
                  5:
                    O01 <= { ii0[4 : 0], Io0[7 : 5] };
                  6:
                    O01 <= { ii0[5 : 0], Io0[7 : 6] };
                  7:
                    O01 <= { ii0[6 : 0], Io0[7 : 7] };
                  default:
                    O01 <= 0;
                endcase
              else
                O01 <= 0;
          end
        assign o11 = { O01[0], O01[1], O01[2], O01[3], O01[4], O01[5], O01[6], O01[7] };
      end
  endgenerate
  generate
    if (g_LANE_WIDTH >= 1)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                li1 <= 0;
                oi1 <= 0;
                ii1 <= 0;
                OOo <= 0;
                IOo <= 0;
                lOo <= 0;
                oOo <= 0;
                iOo <= 0;
                Ioi <= 0;
              end
            else
              begin
                li1 <= I01;
                oi1 <= li1;
                ii1 <= oi1;
                OOo <= ii1;
                IOo <= OOo;
                lOo <= IOo;
                oOo <= lOo;
                iOo <= oOo;
                Ioi <= (!(|oOo) && !(|lOo) && !(|IOo) && !(|OOo) && !(|ii1) && !(|oi1) && (li1 == 8'hB8)) ? 0 : (!(|oOo) && !(|lOo) && !(|IOo) && !(|OOo) && !(|ii1) && (oi1 == 8'hB8)) ? 1 : Ioi;
              end
          end
      end
    if (g_LANE_WIDTH >= 2)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                OIo <= 0;
                IIo <= 0;
                lIo <= 0;
                oIo <= 0;
                iIo <= 0;
                Olo <= 0;
                Ilo <= 0;
                llo <= 0;
                loi <= 0;
              end
            else
              begin
                OIo <= l01;
                IIo <= OIo;
                lIo <= IIo;
                oIo <= lIo;
                iIo <= oIo;
                Olo <= iIo;
                Ilo <= Olo;
                llo <= Ilo;
                loi <= (!(|Ilo) && !(|Olo) && !(|iIo) && !(|oIo) && !(|lIo) && !(|IIo) && (OIo == 8'hB8)) ? 0 : (!(|Ilo) && !(|Olo) && !(|iIo) && !(|oIo) && !(|lIo) && (IIo == 8'hB8)) ? 1 : loi;
              end
          end
      end
    if (g_LANE_WIDTH >= 3)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                olo <= 0;
                ilo <= 0;
                O0o <= 0;
                I0o <= 0;
                l0o <= 0;
                o0o <= 0;
                i0o <= 0;
                O1o <= 0;
                ooi <= 0;
              end
            else
              begin
                olo <= o01;
                ilo <= olo;
                O0o <= ilo;
                I0o <= O0o;
                l0o <= I0o;
                o0o <= l0o;
                i0o <= o0o;
                O1o <= i0o;
                ooi <= (!(|i0o) && !(|o0o) && !(|l0o) && !(|I0o) && !(|O0o) && !(|ilo) && (olo == 8'hB8)) ? 0 : (!(|i0o) && !(|o0o) && !(|l0o) && !(|I0o) && !(|O0o) && (ilo == 8'hB8)) ? 1 : ooi;
              end
          end
      end
    if (g_LANE_WIDTH >= 4)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                I1o <= 0;
                l1o <= 0;
                o1o <= 0;
                i1o <= 0;
                Ooo <= 0;
                Ioo <= 0;
                loo <= 0;
                ooo <= 0;
                ioi <= 0;
              end
            else
              begin
                I1o <= i01;
                l1o <= I1o;
                o1o <= l1o;
                i1o <= o1o;
                Ooo <= i1o;
                Ioo <= Ooo;
                loo <= Ioo;
                ooo <= loo;
                ioi <= (!(|loo) && !(|Ioo) && !(|Ooo) && !(|i1o) && !(|o1o) && !(|l1o) && (I1o == 8'hB8)) ? 0 : (!(|loo) && !(|Ioo) && !(|Ooo) && !(|i1o) && !(|o1o) && (l1o == 8'hB8)) ? 1 : ioi;
              end
          end
      end
    if (g_LANE_WIDTH >= 5)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                ioo <= 0;
                Oio <= 0;
                Iio <= 0;
                lio <= 0;
                oio <= 0;
                iio <= 0;
                OOi <= 0;
                IOi <= 0;
                Oii <= 0;
              end
            else
              begin
                ioo <= O11;
                Oio <= ioo;
                Iio <= Oio;
                lio <= Iio;
                oio <= lio;
                iio <= oio;
                OOi <= iio;
                IOi <= OOi;
                Oii <= (!(|OOi) && !(|iio) && !(|oio) && !(|lio) && !(|Iio) && !(|Oio) && (ioo == 8'hB8)) ? 0 : (!(|OOi) && !(|iio) && !(|oio) && !(|lio) && !(|Iio) && (Oio == 8'hB8)) ? 1 : Oii;
              end
          end
      end
    if (g_LANE_WIDTH >= 6)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                lOi <= 0;
                oOi <= 0;
                iOi <= 0;
                OIi <= 0;
                IIi <= 0;
                lIi <= 0;
                oIi <= 0;
                iIi <= 0;
                Iii <= 0;
              end
            else
              begin
                lOi <= I11;
                oOi <= lOi;
                iOi <= oOi;
                OIi <= iOi;
                IIi <= OIi;
                lIi <= IIi;
                oIi <= lIi;
                iIi <= oIi;
                Iii <= (!(|oIi) && !(|lIi) && !(|IIi) && !(|OIi) && !(|iOi) && !(|oOi) && (lOi == 8'hB8)) ? 0 : (!(|oIi) && !(|lIi) && !(|IIi) && !(|OIi) && !(|iOi) && (oOi == 8'hB8)) ? 1 : Iii;
              end
          end
      end
    if (g_LANE_WIDTH >= 7)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                Oli <= 0;
                Ili <= 0;
                lli <= 0;
                oli <= 0;
                ili <= 0;
                O0i <= 0;
                I0i <= 0;
                l0i <= 0;
                lii <= 0;
              end
            else
              begin
                Oli <= l11;
                Ili <= Oli;
                lli <= Ili;
                oli <= lli;
                ili <= oli;
                O0i <= ili;
                I0i <= O0i;
                l0i <= I0i;
                lii <= (!(|I0i) && !(|O0i) && !(|ili) && !(|oli) && !(|lli) && !(|Ili) && (Oli == 8'hB8)) ? 0 : (!(|I0i) && !(|O0i) && !(|ili) && !(|oli) && !(|lli) && (Ili == 8'hB8)) ? 1 : lii;
              end
          end
      end
    if (g_LANE_WIDTH >= 8)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              begin
                o0i <= 0;
                i0i <= 0;
                O1i <= 0;
                I1i <= 0;
                l1i <= 0;
                o1i <= 0;
                i1i <= 0;
                Ooi <= 0;
                oii <= 0;
              end
            else
              begin
                o0i <= o11;
                i0i <= o0i;
                O1i <= i0i;
                I1i <= O1i;
                l1i <= I1i;
                o1i <= l1i;
                i1i <= o1i;
                Ooi <= i1i;
                oii <= (!(|i1i) && !(|o1i) && !(|l1i) && !(|I1i) && !(|O1i) && !(|i0i) && (o0i == 8'hB8)) ? 0 : (!(|i1i) && !(|o1i) && !(|l1i) && !(|I1i) && !(|O1i) && (i0i == 8'hB8)) ? 1 : oii;
              end
          end
      end
  endgenerate
  generate
    if (g_LANE_WIDTH == 1)
      begin
        always
          @(posedge CLOCK_I or
            negedge RESET_N_I)
          begin
            if (!RESET_N_I)
              iii <= 0;
            else
              iii <= (Ioi) ? 1 : 0;
          end
      end
    else
      if (g_LANE_WIDTH == 2)
        begin
          always
            @(posedge CLOCK_I or
              negedge RESET_N_I)
            begin
              if (!RESET_N_I)
                iii <= 0;
              else
                iii <= (Ioi && loi) ? 1 : 0;
            end
        end
      else
        if (g_LANE_WIDTH == 4)
          begin
            always
              @(posedge CLOCK_I or
                negedge RESET_N_I)
              begin
                if (!RESET_N_I)
                  iii <= 0;
                else
                  iii <= (Ioi && loi && ooi && ioi) ? 1 : 0;
              end
          end
        else
          if (g_LANE_WIDTH == 8)
            begin
              always
                @(posedge CLOCK_I or
                  negedge RESET_N_I)
                begin
                  if (!RESET_N_I)
                    iii <= 0;
                  else
                    iii <= (Ioi && loi && ooi && ioi && Oii && Iii && lii && oii) ? 1 : 0;
                end
            end
  endgenerate
  always
    @(posedge CLOCK_I or
      negedge RESET_N_I)
    begin
      if (!RESET_N_I)
        begin
          OOOI <= 0;
        end
      else
        begin
          OOOI[10 : 0] <= { OOOI[9 : 0], iii };
        end
    end
  generate
    if (g_LANE_WIDTH >= 1)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) l0OI(.k_lim(12'h064),
                                                        .wrrstn(Ioi),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(Ioi),
                                                        .wrdata(OOo),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(Ioi),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L0_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 2)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) o0OI(.k_lim(12'h064),
                                                        .wrrstn(loi),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(loi),
                                                        .wrdata(oIo),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(loi),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L1_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 3)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) i0OI(.k_lim(12'h064),
                                                        .wrrstn(ooi),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(ooi),
                                                        .wrdata(I0o),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(ooi),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L2_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 4)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) O1OI(.k_lim(12'h064),
                                                        .wrrstn(ioi),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(ioi),
                                                        .wrdata(i1o),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(ioi),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L3_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 5)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) I1OI(.k_lim(12'h064),
                                                        .wrrstn(Oii),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(Oii),
                                                        .wrdata(lio),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(Oii),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L4_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 6)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) l1OI(.k_lim(12'h064),
                                                        .wrrstn(Iii),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(Iii),
                                                        .wrdata(oIi),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(Iii),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L5_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 7)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) o1OI(.k_lim(12'h064),
                                                        .wrrstn(lii),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(lii),
                                                        .wrdata(oli),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(lii),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L6_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
    if (g_LANE_WIDTH >= 8)
      begin
        cdcfifo #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) i1OI(.k_lim(12'h064),
                                                        .wrrstn(oii),
                                                        .wrclk(CLOCK_I),
                                                        .wrreq(oii),
                                                        .wrdata(I1i),
                                                        .wrfull(),
                                                        .wrusedw(),
                                                        .rdrstn(oii),
                                                        .rdclk(CLOCK_I),
                                                        .rdreq(OOOI[3]),
                                                        .rddata(L7_DATA_O),
                                                        .rdempty(),
                                                        .rdusedw());
      end
  endgenerate
endmodule
