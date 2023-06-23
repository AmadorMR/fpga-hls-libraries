`timescale 1ns/1ps
module byte2pixel_conversion #(parameter g_DATAWIDTH = 10,
                               parameter g_LANE_WIDTH = 8,
                               parameter g_NUM_OF_PIXELS = 1)
                             (input CAM_CLOCK_I,
                              input READ_CLOCK_I,
                              input RESET_n_I,
                              input wire[g_LANE_WIDTH * 8 - 1 : 0] byte_data_i,
                              input wire byte_en_i,
                              output reg[g_NUM_OF_PIXELS * g_DATAWIDTH - 1 : 0] pixel_data_o,
                              output reg line_valid_o,
                              output wire line_start_o,
                              output wire line_end_o);
  parameter O = 3'b000,
            I = 3'b001,
            l = 3'b010,
            o = 3'b011,
            i = 3'b100,
            OI = 3'b101,
            II = 3'b110,
            lI = 3'b111;
  parameter oI = 3'b001,
            iI = 3'b010,
            Ol = 3'b011,
            Il = 3'b100,
            ll = 3'b101,
            ol = 3'b110,
            il = 3'b111;
  parameter O0 = g_DATAWIDTH * g_LANE_WIDTH;
  reg I0;
  reg l0;
  reg[g_LANE_WIDTH * g_DATAWIDTH - 1 : 0] o0,
                                          i0,
                                          O1,
                                          I1,
                                          l1,
                                          o1,
                                          i1;
  wire[g_LANE_WIDTH * g_DATAWIDTH - 1 : 0] Oo;
  reg[g_LANE_WIDTH * 8 - 1 : 0] Io,
                                lo,
                                oo,
                                io,
                                Oi;
  reg Ii,
      li,
      oi;
  reg[3 : 0] ii;
  reg[3 : 0] OOI;
  reg[2 : 0] IOI;
  reg[8 : 0] lOI;
  wire oOI,
       iOI;
  reg OII,
      III;
  reg[2 : 0] lII,
             oII,
             iII;
  reg OlI,
      IlI;
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    if (!RESET_n_I)
      begin
        Io <= 0;
        oi <= 0;
      end
    else
      begin
        Io <= byte_data_i;
        oi <= byte_en_i;
      end
  generate
    if (g_DATAWIDTH == 8)
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          if (!RESET_n_I)
            begin
              o0 <= 0;
              Ii <= 0;
            end
          else
            begin
              o0 <= Io;
              Ii <= oi;
            end
      end
  endgenerate
  generate
    if ((g_DATAWIDTH == 10) && (g_LANE_WIDTH == 4))
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              IOI <= 0;
            else
              if (oi)
                IOI <= (IOI == 3'b100) ? 3'b000 : IOI + 1;
              else
                IOI <= 0;
          end
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          if (!RESET_n_I)
            begin
              o0 <= 0;
              Ii <= 0;
            end
          else
            begin
              lo <= Io;
              oo <= lo;
              if (IOI > 0)
                begin
                  case (IOI)
                    oI:
                      o0 <= { lo[31 : 24], Io[7 : 6], lo[23 : 16], Io[5 : 4], lo[15 : 8], Io[3 : 2], lo[7 : 0], Io[1 : 0] };
                    iI:
                      o0 <= { Io[7 : 0], Io[15 : 14], lo[31 : 24], Io[13 : 12], lo[23 : 16], Io[11 : 10], lo[15 : 8], Io[9 : 8] };
                    Ol:
                      o0 <= { Io[15 : 8], Io[23 : 22], Io[7 : 0], Io[21 : 20], lo[31 : 24], Io[19 : 18], lo[23 : 16], Io[17 : 16] };
                    Il:
                      o0 <= { Io[23 : 16], Io[31 : 30], Io[15 : 8], Io[29 : 28], Io[7 : 0], Io[27 : 26], lo[31 : 24], Io[25 : 24] };
                    default:
                      o0 <= 0;
                  endcase
                  Ii <= (IOI[0] | IOI[1] | IOI[2]);
                end
              else
                begin
                  Ii <= 0;
                  o0 <= 0;
                end
            end
      end
  endgenerate
  generate
    if ((g_DATAWIDTH == 10) && (g_LANE_WIDTH == 2))
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              IOI <= 0;
            else
              if (oi)
                IOI <= (IOI == 3'b101) ? 3'b001 : IOI + 1;
              else
                IOI <= 0;
          end
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          if (!RESET_n_I)
            begin
              o0 <= 0;
              Ii <= 0;
            end
          else
            begin
              lo <= Io;
              oo <= lo;
              if (IOI > 0)
                begin
                  case (IOI)
                    iI:
                      o0 <= { oo[15 : 8], Io[3 : 2], oo[7 : 0], Io[1 : 0] };
                    Ol:
                      o0 <= { oo[15 : 8], lo[7 : 6], oo[7 : 0], lo[5 : 4] };
                    Il:
                      o0 <= { lo[7 : 0], Io[11 : 10], oo[15 : 8], Io[9 : 8] };
                    ll:
                      o0 <= { lo[7 : 0], lo[15 : 14], oo[15 : 8], lo[13 : 12] };
                    default:
                      o0 <= 0;
                  endcase
                  Ii <= (IOI >= 3'b010);
                end
              else
                begin
                  Ii <= 0;
                  o0 <= 0;
                end
            end
      end
  endgenerate
  generate
    if ((g_DATAWIDTH == 10) && (g_LANE_WIDTH == 1))
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              IOI <= 0;
            else
              if (oi)
                IOI <= (IOI == 3'b111) ? 3'b011 : IOI + 1;
              else
                IOI <= 0;
          end
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          if (!RESET_n_I)
            begin
              o0 <= 0;
              Ii <= 0;
            end
          else
            begin
              lo <= Io;
              oo <= lo;
              io <= oo;
              Oi <= io;
              if (IOI > 0)
                begin
                  case (IOI)
                    Il:
                      o0 <= { Oi[7 : 0], Io[1 : 0] };
                    ll:
                      o0 <= { Oi[7 : 0], lo[3 : 2] };
                    ol:
                      o0 <= { Oi[7 : 0], oo[5 : 4] };
                    il:
                      o0 <= { Oi[7 : 0], io[7 : 6] };
                    default:
                      o0 <= 0;
                  endcase
                  Ii <= (IOI >= 3'b100);
                end
              else
                begin
                  Ii <= 0;
                  o0 <= 0;
                end
            end
      end
  endgenerate
  generate
    if ((g_DATAWIDTH == 12) && (g_LANE_WIDTH == 4))
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              IOI <= 0;
            else
              if (oi)
                IOI <= (IOI == 3'b010) ? 3'b000 : IOI + 1;
              else
                IOI <= 0;
          end
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          if (!RESET_n_I)
            begin
              o0 <= 0;
              Ii <= 0;
            end
          else
            begin
              lo <= Io;
              oo <= lo;
              if (IOI > 0)
                begin
                  case (IOI)
                    oI:
                      o0 <= { Io[7 : 0], Io[15 : 12], lo[31 : 24], Io[11 : 8], lo[15 : 8], lo[23 : 20], lo[7 : 0], lo[19 : 16] };
                    iI:
                      o0 <= { Io[23 : 16], Io[31 : 28], Io[15 : 8], Io[27 : 24], lo[31 : 24], Io[7 : 4], lo[23 : 16], Io[3 : 0] };
                    default:
                      o0 <= 0;
                  endcase
                  Ii <= (IOI[0] | IOI[1] | IOI[2]);
                end
              else
                begin
                  Ii <= 0;
                  o0 <= 0;
                end
            end
      end
    else
      if ((g_DATAWIDTH == 12) && (g_LANE_WIDTH == 2))
        begin
          always
            @(posedge CAM_CLOCK_I or
              negedge RESET_n_I)
            begin
              if (!RESET_n_I)
                IOI <= 0;
              else
                if (oi)
                  IOI <= (IOI == 3'b010) ? 3'b000 : IOI + 1;
                else
                  IOI <= 0;
            end
          always
            @(posedge CAM_CLOCK_I or
              negedge RESET_n_I)
            if (!RESET_n_I)
              begin
                o0 <= 0;
                Ii <= 0;
              end
            else
              begin
                lo <= Io;
                oo <= lo;
                if (IOI > 0)
                  begin
                    case (IOI)
                      oI:
                        o0 <= { lo[15 : 8], Io[7 : 4], lo[7 : 0], Io[3 : 0] };
                      iI:
                        o0 <= { Io[7 : 0], Io[15 : 12], lo[15 : 8], Io[11 : 8] };
                      default:
                        o0 <= 0;
                    endcase
                    Ii <= (IOI[0] | IOI[1] | IOI[2]);
                  end
                else
                  begin
                    Ii <= 0;
                    o0 <= 0;
                  end
              end
        end
      else
        if ((g_DATAWIDTH == 12) && (g_LANE_WIDTH == 1))
          begin
            always
              @(posedge CAM_CLOCK_I or
                negedge RESET_n_I)
              begin
                if (!RESET_n_I)
                  IOI <= 0;
                else
                  if (oi)
                    IOI <= (IOI == 3'b011) ? 3'b001 : IOI + 1;
                  else
                    IOI <= 0;
              end
            always
              @(posedge CAM_CLOCK_I or
                negedge RESET_n_I)
              if (!RESET_n_I)
                begin
                  o0 <= 0;
                  Ii <= 0;
                end
              else
                begin
                  lo <= Io;
                  oo <= lo;
                  io <= oo;
                  Oi <= io;
                  if (IOI > 0)
                    begin
                      case (IOI)
                        iI:
                          o0 <= { oo[7 : 0], Io[3 : 0] };
                        Ol:
                          o0 <= { oo[7 : 0], lo[7 : 4] };
                        default:
                          o0 <= 0;
                      endcase
                      Ii <= (IOI >= 3'b010);
                    end
                  else
                    begin
                      Ii <= 0;
                      o0 <= 0;
                    end
                end
          end
        else
          if ((g_DATAWIDTH == 10) && (g_LANE_WIDTH == 8))
            begin
              always
                @(posedge CAM_CLOCK_I or
                  negedge RESET_n_I)
                begin
                  if (!RESET_n_I)
                    IOI <= 0;
                  else
                    if (oi)
                      IOI <= (IOI == 3'b101) ? 3'b001 : IOI + 1;
                    else
                      IOI <= 0;
                end
              always
                @(posedge CAM_CLOCK_I or
                  negedge RESET_n_I)
                if (!RESET_n_I)
                  begin
                    o0 <= 0;
                    Ii <= 0;
                  end
                else
                  begin
                    lo <= Io;
                    oo <= lo;
                    if (IOI > 0)
                      begin
                        case (IOI)
                          oI:
                            begin
                              o0 <= { Io[39 : 32], Io[47 : 46], Io[31 : 24], Io[45 : 44], Io[23 : 16], Io[43 : 42], Io[15 : 8], Io[41 : 40], lo[63 : 56], Io[7 : 6], lo[55 : 48], Io[5 : 4], lo[47 : 40], Io[3 : 2], lo[39 : 32], Io[1 : 0] };
                              Ii <= 1;
                            end
                          iI:
                            begin
                              o0 <= { Io[55 : 48], Io[63 : 62], Io[47 : 40], Io[61 : 60], Io[39 : 32], Io[59 : 58], Io[31 : 24], Io[57 : 56], Io[15 : 8], Io[23 : 22], Io[7 : 0], Io[21 : 20], lo[63 : 56], Io[19 : 18], lo[55 : 48], Io[17 : 16] };
                              Ii <= 1;
                            end
                          Il:
                            begin
                              o0 <= { Io[7 : 0], Io[15 : 14], lo[63 : 56], Io[13 : 12], lo[55 : 48], Io[11 : 10], lo[47 : 40], Io[9 : 8], lo[31 : 24], lo[39 : 38], lo[23 : 16], lo[37 : 36], lo[15 : 8], lo[35 : 34], lo[7 : 0], lo[33 : 32] };
                              Ii <= 1;
                            end
                          ll:
                            begin
                              o0 <= { Io[23 : 16], Io[31 : 30], Io[15 : 8], Io[29 : 28], Io[7 : 0], Io[27 : 26], lo[63 : 56], Io[25 : 24], lo[47 : 40], lo[55 : 54], lo[39 : 32], lo[53 : 52], lo[31 : 24], lo[51 : 50], lo[23 : 16], lo[49 : 48] };
                              Ii <= 1;
                            end
                          default:
                            begin
                              o0 <= 0;
                              Ii <= 0;
                            end
                        endcase
                      end
                    else
                      begin
                        Ii <= 0;
                        o0 <= 0;
                      end
                  end
            end
          else
            if ((g_DATAWIDTH == 12) && (g_LANE_WIDTH == 8))
              begin
                always
                  @(posedge CAM_CLOCK_I or
                    negedge RESET_n_I)
                  begin
                    if (!RESET_n_I)
                      IOI <= 0;
                    else
                      if (oi)
                        IOI <= (IOI == 3'b011) ? 3'b001 : IOI + 1;
                      else
                        IOI <= 0;
                  end
                always
                  @(posedge CAM_CLOCK_I or
                    negedge RESET_n_I)
                  if (!RESET_n_I)
                    begin
                      o0 <= 0;
                      Ii <= 0;
                    end
                  else
                    begin
                      lo <= Io;
                      oo <= lo;
                      if (IOI > 0)
                        begin
                          case (IOI)
                            oI:
                              begin
                                o0 <= { Io[55 : 48], Io[63 : 60], Io[47 : 40], Io[59 : 56], Io[31 : 24], Io[39 : 36], Io[23 : 16], Io[35 : 32], Io[7 : 0], Io[15 : 12], lo[63 : 56], Io[11 : 8], lo[47 : 40], lo[55 : 52], lo[39 : 32], lo[51 : 48] };
                                Ii <= 1;
                              end
                            Ol:
                              begin
                                o0 <= { Io[23 : 16], Io[31 : 28], Io[15 : 8], Io[27 : 24], lo[63 : 56], Io[7 : 4], lo[55 : 48], Io[3 : 0], lo[39 : 32], lo[47 : 44], lo[31 : 24], lo[43 : 40], lo[15 : 8], lo[23 : 20], lo[7 : 0], lo[19 : 16] };
                                Ii <= 1;
                              end
                            default:
                              begin
                                o0 <= 0;
                                Ii <= 0;
                              end
                          endcase
                        end
                      else
                        begin
                          Ii <= 0;
                          o0 <= 0;
                        end
                    end
              end
  endgenerate
  always
    @(posedge READ_CLOCK_I or
      negedge RESET_n_I)
    if (!RESET_n_I)
      begin
        OlI <= 0;
        IlI <= 0;
      end
    else
      begin
        OlI <= RESET_n_I;
        IlI <= OlI;
      end
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    if (!IlI)
      ii <= 0;
    else
      if (oOI)
        ii <= 0;
      else
        if (ii <= 8)
          ii <= ii + 1;
        else
          ii <= ii;
  generate
    if (g_LANE_WIDTH == 1)
      begin
        always
          @(posedge READ_CLOCK_I or
            negedge IlI)
          if (!IlI)
            li <= 0;
          else
            if (ii > 8)
              li <= ~oOI;
            else
              li <= 0;
      end
    else
      if (g_LANE_WIDTH == 2)
        begin
          always
            @(posedge READ_CLOCK_I or
              negedge IlI)
            if (!IlI)
              begin
                li <= 0;
                III <= 0;
              end
            else
              if ((ii > 8) && ~oOI)
                begin
                  III <= III + 1;
                  li <= ~III;
                end
              else
                begin
                  li <= 0;
                  III <= 0;
                end
        end
      else
        if ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 1))
          begin
            always
              @(posedge READ_CLOCK_I or
                negedge IlI)
              if (!IlI)
                begin
                  li <= 0;
                  oII <= 0;
                end
              else
                if (ii > 8)
                  begin
                    oII <= oII + 1;
                    li <= ~oII[0] & ~oII[1];
                  end
                else
                  begin
                    li <= 0;
                    oII <= 0;
                  end
          end
        else
          if ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 4))
            begin
              always
                @(posedge READ_CLOCK_I or
                  negedge IlI)
                if (!IlI)
                  li <= 0;
                else
                  if (ii > 8)
                    li <= ~oOI;
                  else
                    li <= 0;
            end
          else
            if ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 1))
              begin
                always
                  @(posedge READ_CLOCK_I or
                    negedge IlI)
                  if (!IlI)
                    begin
                      li <= 0;
                      OOI <= 0;
                    end
                  else
                    if (ii > 8)
                      if (OOI == 0)
                        begin
                          li <= ~oOI;
                          OOI <= OOI + 1;
                        end
                      else
                        begin
                          li <= 0;
                          OOI <= OOI + 1;
                          if (OOI == 7)
                            OOI <= 0;
                        end
                    else
                      li <= 0;
              end
            else
              if ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 4))
                begin
                  always
                    @(posedge READ_CLOCK_I or
                      negedge IlI)
                    if (!IlI)
                      begin
                        li <= 0;
                        OOI <= 0;
                      end
                    else
                      if (ii > 8)
                        if (OOI == 0)
                          begin
                            li <= ~oOI;
                            OOI <= OOI + 1;
                          end
                        else
                          begin
                            li <= 0;
                            OOI <= 0;
                          end
                      else
                        li <= 0;
                end
  endgenerate
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    begin
      if (!IlI)
        lOI <= 0;
      else
        lOI <= { lOI[7 : 0], li };
    end
  assign iOI = (g_LANE_WIDTH == 1) ? lOI[0] : (g_LANE_WIDTH == 2) ? (lOI[0] | lOI[1]) : ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 1)) ? (lOI[0] | lOI[1] | lOI[2] | li) : ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 4)) ? (lOI[2] & lOI[1]) : ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 1)) ? (lOI[0] | lOI[1] | lOI[2] | lOI[3] | lOI[4] | lOI[5] | lOI[6] | li) : ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 4)) ? (lOI[1] | lOI[2]) : lOI[0];
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    begin
      if (!IlI)
        line_valid_o <= 0;
      else
        line_valid_o <= (iOI) ? 1'b1 : 1'b0;
    end
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    begin
      if (!IlI)
        begin
          i0 <= 0;
          O1 <= 0;
          I1 <= 0;
          l1 <= 0;
          o1 <= 0;
          i1 <= 0;
        end
      else
        begin
          i0 <= Oo;
          O1 <= i0;
          I1 <= O1;
          l1 <= I1;
          o1 <= l1;
          i1 <= o1;
        end
    end
  generate
    if (g_LANE_WIDTH == 1)
      begin
        always
          @(posedge READ_CLOCK_I or
            negedge IlI)
          if (!IlI)
            begin
              pixel_data_o <= 0;
            end
          else
            if (iOI)
              begin
                pixel_data_o <= i0;
              end
            else
              begin
                pixel_data_o <= 0;
              end
      end
    else
      if (g_LANE_WIDTH == 2)
        begin
          always
            @(posedge READ_CLOCK_I or
              negedge IlI)
            if (!IlI)
              begin
                OII <= 0;
                pixel_data_o <= 0;
              end
            else
              if (iOI)
                begin
                  OII <= OII + 1;
                  pixel_data_o <= (OII) ? i0[g_DATAWIDTH * 2 - 1 : g_DATAWIDTH] : i0[g_DATAWIDTH - 1 : 0];
                end
              else
                begin
                  OII <= 0;
                  pixel_data_o <= 0;
                end
        end
      else
        if ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 1))
          begin
            always
              @(posedge READ_CLOCK_I or
                negedge IlI)
              if (!IlI)
                begin
                  lII <= 0;
                  pixel_data_o <= 0;
                end
              else
                if (iOI)
                  begin
                    case (lII)
                      O:
                        begin
                          pixel_data_o <= O1[g_DATAWIDTH - 1 : 0];
                          lII <= I;
                        end
                      I:
                        begin
                          pixel_data_o <= O1[g_DATAWIDTH * 2 - 1 : g_DATAWIDTH];
                          lII <= l;
                        end
                      l:
                        begin
                          pixel_data_o <= O1[g_DATAWIDTH * 3 - 1 : g_DATAWIDTH * 2];
                          lII <= o;
                        end
                      o:
                        begin
                          pixel_data_o <= O1[g_DATAWIDTH * 4 - 1 : g_DATAWIDTH * 3];
                          lII <= O;
                        end
                      default:
                        pixel_data_o <= 0;
                    endcase
                  end
                else
                  begin
                    lII <= 0;
                    pixel_data_o <= 0;
                  end
          end
        else
          if ((g_LANE_WIDTH == 4) && (g_NUM_OF_PIXELS == 4))
            begin
              always
                @(posedge READ_CLOCK_I or
                  negedge IlI)
                if (!IlI)
                  pixel_data_o <= 0;
                else
                  if (iOI)
                    pixel_data_o <= O1;
                  else
                    pixel_data_o <= 0;
            end
          else
            if ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 4))
              begin
                always
                  @(posedge READ_CLOCK_I or
                    negedge IlI)
                  if (!IlI)
                    begin
                      iII <= 0;
                      pixel_data_o <= 0;
                    end
                  else
                    if (iOI)
                      begin
                        case (iII)
                          O:
                            begin
                              pixel_data_o <= O1[g_DATAWIDTH * 4 - 1 : 0];
                              iII <= I;
                            end
                          I:
                            begin
                              pixel_data_o <= O1[g_DATAWIDTH * 8 - 1 : g_DATAWIDTH * 4];
                              iII <= O;
                            end
                          default:
                            pixel_data_o <= 0;
                        endcase
                      end
              end
            else
              if ((g_LANE_WIDTH == 8) && (g_NUM_OF_PIXELS == 1))
                begin
                  always
                    @(posedge READ_CLOCK_I or
                      negedge IlI)
                    if (!IlI)
                      begin
                        iII <= 0;
                        pixel_data_o <= 0;
                      end
                    else
                      if (iOI)
                        begin
                          case (iII)
                            O:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH - 1 : 0];
                                iII <= I;
                              end
                            I:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 2 - 1 : g_DATAWIDTH];
                                iII <= l;
                              end
                            l:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 3 - 1 : g_DATAWIDTH * 2];
                                iII <= o;
                              end
                            o:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 4 - 1 : g_DATAWIDTH * 3];
                                iII <= i;
                              end
                            i:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 5 - 1 : g_DATAWIDTH * 4];
                                iII <= OI;
                              end
                            OI:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 6 - 1 : g_DATAWIDTH * 5];
                                iII <= II;
                              end
                            II:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 7 - 1 : g_DATAWIDTH * 6];
                                iII <= lI;
                              end
                            lI:
                              begin
                                pixel_data_o <= i1[g_DATAWIDTH * 8 - 1 : g_DATAWIDTH * 7];
                                iII <= O;
                              end
                            default:
                              pixel_data_o <= 0;
                          endcase
                        end
                      else
                        begin
                          iII <= 0;
                          pixel_data_o <= 0;
                        end
                end
  endgenerate
  cdcfifo #(.ADDR_WIDTH(9), .DATA_WIDTH(O0)) llI(.k_lim(9'h1FF),
                                                 .wrrstn(RESET_n_I),
                                                 .wrclk(CAM_CLOCK_I),
                                                 .wrreq(Ii),
                                                 .wrdata(o0),
                                                 .wrfull(),
                                                 .wrusedw(),
                                                 .rdrstn(IlI),
                                                 .rdclk(READ_CLOCK_I),
                                                 .rdreq(li),
                                                 .rddata(Oo),
                                                 .rdempty(oOI),
                                                 .rdusedw());
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    if (!IlI)
      I0 <= 0;
    else
      I0 <= iOI;
  always
    @(posedge READ_CLOCK_I or
      negedge IlI)
    if (!IlI)
      begin
        l0 <= 0;
      end
    else
      begin
        l0 <= I0;
      end
  assign line_start_o = iOI & ~I0;
  assign line_end_o = ~I0 & l0;
endmodule
