`timescale 1ns/1ps
module mipi_csi2_rxdecoder #(parameter g_DATAWIDTH = 10,
                             parameter g_INPUT_DATA_INVERT = 0,
                             parameter g_LANE_WIDTH = 8,
                             parameter g_NUM_OF_PIXELS = 1,
                             parameter g_BUFF_DEPTH = 1920)
                           (input CAM_CLOCK_I,
                            input READ_CLOCK_I,
                            input RESET_n_I,
                            input wire[7 : 0] ChannelA_i,
                            input wire[7 : 0] ChannelB_i,
                            input wire[7 : 0] ChannelC_i,
                            input wire[7 : 0] ChannelD_i,
                            input wire[7 : 0] ChannelE_i,
                            input wire[7 : 0] ChannelF_i,
                            input wire[7 : 0] ChannelG_i,
                            input wire[7 : 0] ChannelH_i,
                            output wire[g_DATAWIDTH * g_NUM_OF_PIXELS - 1 : 0] data_out_o,
                            output reg[15 : 0] word_count_o,
                            output wire pixel_valid_o,
                            output reg frame_start_o,
                            output reg frame_end_o,
                            output reg frame_valid_o,
                            output reg line_start_o,
                            output reg line_end_o,
                            output reg[15 : 0] frame_number_o);
  parameter OoOI = 16;
  parameter IoOI = 16'hb800;
  parameter loOI = 16'hb801;
  parameter ooOI = (g_DATAWIDTH == 10) ? 16'hb82b : (g_DATAWIDTH == 12) ? 16'hb82c : 16'hb82a;
  parameter ioOI = 0,
            OiOI = 1,
            IiOI = 2,
            liOI = 3,
            oiOI = 4,
            iiOI = 5,
            OOII = 6,
            IOII = 7,
            lOII = 8,
            oOII = 9,
            iOII = 10,
            OIII = 11,
            IIII = 12,
            lIII = 13,
            oIII = 14,
            iIII = 15;
  parameter OlII = 0,
            IlII = 1,
            llII = 2,
            olII = 3,
            ilII = 4,
            O0II = 5,
            I0II = 6,
            l0II = 7;
  parameter o0II = 0,
            i0II = 1,
            O1II = 2,
            I1II = 3,
            l1II = 4,
            o1II = 5;
  parameter i1II = 0,
            OoII = 1,
            IoII = 2,
            loII = 3,
            ooII = 4,
            ioII = 5;
  reg[7 : 0] OiII,
             IiII;
  reg liII;
  reg oiII;
  reg iiII;
  reg OOlI;
  reg IOlI;
  reg[7 : 0] lOlI,
             oOlI,
             iOlI,
             OIlI,
             IIlI,
             lIlI,
             oIlI,
             iIlI;
  reg[15 : 0] OllI;
  reg[7 : 0] IllI;
  reg[7 : 0] lllI;
  reg[g_LANE_WIDTH * 8 - 1 : 0] ollI,
                                illI,
                                O0lI;
  reg[3 : 0] I0lI;
  reg[OoOI - 1 : 0] l0lI;
  wire o0lI;
  wire i0lI,
       O1lI;
  reg I1lI,
      l1lI,
      o1lI;
  reg OlI,
      IlI;
  assign o0lI = 1'b0;
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          lOlI <= 8'd0;
        end
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              lOlI <= { ChannelA_i[0], ChannelA_i[1], ChannelA_i[2], ChannelA_i[3], ChannelA_i[4], ChannelA_i[5], ChannelA_i[6], ChannelA_i[7] };
            else
              lOlI <= ChannelA_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        oOlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              oOlI <= { ChannelB_i[0], ChannelB_i[1], ChannelB_i[2], ChannelB_i[3], ChannelB_i[4], ChannelB_i[5], ChannelB_i[6], ChannelB_i[7] };
            else
              oOlI <= ChannelB_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          iOlI <= 8'd0;
        end
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              iOlI <= { ChannelC_i[0], ChannelC_i[1], ChannelC_i[2], ChannelC_i[3], ChannelC_i[4], ChannelC_i[5], ChannelC_i[6], ChannelC_i[7] };
            else
              iOlI <= ChannelC_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        OIlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              OIlI <= { ChannelD_i[0], ChannelD_i[1], ChannelD_i[2], ChannelD_i[3], ChannelD_i[4], ChannelD_i[5], ChannelD_i[6], ChannelD_i[7] };
            else
              OIlI <= ChannelD_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        IIlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              IIlI <= { ChannelE_i[0], ChannelE_i[1], ChannelE_i[2], ChannelE_i[3], ChannelE_i[4], ChannelE_i[5], ChannelE_i[6], ChannelE_i[7] };
            else
              IIlI <= ChannelE_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        lIlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              lIlI <= { ChannelF_i[0], ChannelF_i[1], ChannelF_i[2], ChannelF_i[3], ChannelF_i[4], ChannelF_i[5], ChannelF_i[6], ChannelF_i[7] };
            else
              lIlI <= ChannelF_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        oIlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              oIlI <= { ChannelG_i[0], ChannelG_i[1], ChannelG_i[2], ChannelG_i[3], ChannelG_i[4], ChannelG_i[5], ChannelG_i[6], ChannelG_i[7] };
            else
              oIlI <= ChannelG_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        iIlI <= 8'd0;
      else
        if (!o0lI)
          begin
            if (g_INPUT_DATA_INVERT)
              iIlI <= { ChannelH_i[0], ChannelH_i[1], ChannelH_i[2], ChannelH_i[3], ChannelH_i[4], ChannelH_i[5], ChannelH_i[6], ChannelH_i[7] };
            else
              iIlI <= ChannelH_i;
          end
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          ollI[7 : 0] <= 8'b0;
        end
      else
        if (g_LANE_WIDTH >= 1)
          begin
            ollI[7 : 0] <= lOlI;
          end
        else
          ollI[7 : 0] <= 8'b0;
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          ollI[15 : 8] <= 8'b0;
        end
      else
        if (g_LANE_WIDTH >= 2)
          begin
            ollI[15 : 8] <= { oOlI };
          end
        else
          ollI[15 : 8] <= 8'b0;
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          ollI[31 : 16] <= 16'b0;
        end
      else
        if (g_LANE_WIDTH >= 4)
          begin
            ollI[31 : 16] <= { OIlI, iOlI };
          end
        else
          ollI[31 : 16] <= 16'b0;
    end
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          ollI[63 : 32] <= 32'b0;
        end
      else
        if (g_LANE_WIDTH == 8)
          begin
            ollI[63 : 32] <= { iIlI, oIlI, lIlI, IIlI };
          end
        else
          ollI[63 : 32] <= 32'b0;
    end
  generate
    if (g_LANE_WIDTH == 8)
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              begin
                O0lI <= 64'b0;
              end
            else
              O0lI <= ollI;
          end
      end
  endgenerate
  always
    @(posedge CAM_CLOCK_I or
      negedge RESET_n_I)
    begin
      if (!RESET_n_I)
        begin
          l0lI <= 16'b0;
        end
      else
        if (!o0lI)
          begin
            l0lI <= { l0lI[OoOI - 9 : 0], ollI[7 : 0] };
          end
    end
  generate
    if (g_LANE_WIDTH == 1)
      begin
        always
          @(posedge CAM_CLOCK_I or
            negedge RESET_n_I)
          begin
            if (!RESET_n_I)
              begin
                I0lI <= 4'b0;
                liII <= 1'b0;
                oiII <= 1'b0;
                iiII <= 1'b0;
                frame_valid_o <= 1'b0;
                IOlI <= 1'b0;
                OllI <= 16'b0;
                IiII <= 8'd0;
                OiII <= 8'd0;
                frame_number_o <= 16'd0;
                IllI <= 8'd0;
                lllI <= 8'd0;
                word_count_o <= 16'hFFFF;
                illI <= 8'd0;
              end
            else
              if (!o0lI)
                begin
                  case (I0lI)
                    ioOI:
                      begin
                        if (l0lI == IoOI)
                          begin
                            liII <= 1;
                            frame_valid_o <= 1'b1;
                            I0lI <= OiOI;
                          end
                        else
                          I0lI <= ioOI;
                      end
                    OiOI:
                      begin
                        I0lI <= IiOI;
                        liII <= 0;
                        OiII <= l0lI[7 : 0];
                      end
                    IiOI:
                      begin
                        I0lI <= liOI;
                        liII <= 0;
                        IiII <= l0lI[7 : 0];
                      end
                    liOI:
                      begin
                        I0lI <= oiOI;
                        liII <= 0;
                        frame_number_o <= { IiII, OiII };
                      end
                    oiOI:
                      begin
                        if (l0lI == loOI)
                          begin
                            oiII <= 1;
                            I0lI <= IIII;
                            iiII <= 0;
                            liII <= 0;
                          end
                        else
                          if (l0lI == ooOI)
                            begin
                              IOlI <= 0;
                              I0lI <= iiOI;
                              iiII <= 1'b1;
                            end
                          else
                            begin
                              IOlI <= 0;
                              I0lI <= oiOI;
                              iiII <= 0;
                            end
                      end
                    iiOI:
                      begin
                        iiII <= 0;
                        IllI <= l0lI[7 : 0];
                        I0lI <= OOII;
                      end
                    OOII:
                      begin
                        iiII <= 0;
                        lllI <= l0lI[7 : 0];
                        I0lI <= IOII;
                      end
                    IOII:
                      begin
                        word_count_o <= { lllI, IllI };
                        I0lI <= lOII;
                      end
                    lOII:
                      begin
                        if (OllI < word_count_o)
                          begin
                            OllI <= OllI + 1;
                            IOlI <= 1;
                            illI <= l0lI[7 : 0];
                            I0lI <= lOII;
                          end
                        else
                          begin
                            OllI <= 0;
                            IOlI <= 0;
                            illI <= 0;
                            I0lI <= oOII;
                          end
                      end
                    oOII:
                      begin
                        I0lI <= iOII;
                      end
                    iOII:
                      begin
                        I0lI <= OIII;
                      end
                    OIII:
                      begin
                        I0lI <= oiOI;
                      end
                    IIII:
                      begin
                        oiII <= 0;
                        I0lI <= lIII;
                        liII <= 1'b0;
                      end
                    lIII:
                      begin
                        I0lI <= oIII;
                      end
                    oIII:
                      begin
                        I0lI <= iIII;
                        frame_valid_o <= 1'b0;
                      end
                    iIII:
                      begin
                        I0lI <= ioOI;
                      end
                    default:
                      I0lI <= ioOI;
                  endcase
                end
          end
      end
    else
      if (g_LANE_WIDTH == 2)
        begin
          always
            @(posedge CAM_CLOCK_I or
              negedge RESET_n_I)
            begin
              if (!RESET_n_I)
                begin
                  I0lI <= OlII;
                  liII <= 1'b0;
                  oiII <= 1'b0;
                  iiII <= 1'b0;
                  OOlI <= 1'b0;
                  frame_valid_o <= 1'b0;
                  IOlI <= 1'b0;
                  OllI <= 16'b0;
                  IiII <= 8'd0;
                  OiII <= 8'd0;
                  frame_number_o <= 16'd0;
                  IllI <= 8'd0;
                  lllI <= 8'd0;
                  word_count_o <= 16'hFFFF;
                  illI <= 0;
                end
              else
                case (I0lI)
                  OlII:
                    begin
                      oiII <= 0;
                      if (ollI == 16'hB8B8)
                        I0lI <= IlII;
                      else
                        I0lI <= OlII;
                    end
                  IlII:
                    if (ollI[5 : 0] == 6'h00)
                      begin
                        liII <= 1'b1;
                        frame_valid_o <= 1'b1;
                        OiII <= ollI[15 : 8];
                        I0lI <= llII;
                      end
                    else
                      I0lI <= OlII;
                  llII:
                    begin
                      I0lI <= olII;
                      liII <= 1'b1;
                      frame_number_o <= { ollI[7 : 0], OiII };
                    end
                  olII:
                    begin
                      OOlI <= 1'b0;
                      liII <= 0;
                      if (ollI == 16'hB8B8)
                        I0lI <= ilII;
                      else
                        I0lI <= olII;
                      OllI <= 0;
                    end
                  ilII:
                    if (ollI[5 : 0] == 6'h01)
                      begin
                        I0lI <= OlII;
                        oiII <= 1'b1;
                        frame_valid_o <= 1'b0;
                      end
                    else
                      begin
                        IllI <= ollI[15 : 8];
                        I0lI <= O0II;
                        iiII <= 1'b1;
                      end
                  O0II:
                    begin
                      word_count_o <= { ollI[7 : 0], IllI };
                      I0lI <= I0II;
                      iiII <= 1'b0;
                    end
                  I0II:
                    begin
                      iiII <= 1'b0;
                      OllI <= OllI + 2;
                      illI <= ollI;
                      if (OllI < (word_count_o - 1))
                        begin
                          I0lI <= I0II;
                          IOlI <= 1;
                        end
                      else
                        begin
                          I0lI <= l0II;
                          IOlI <= 0;
                        end
                    end
                  l0II:
                    begin
                      I0lI <= olII;
                      IOlI <= 0;
                      OOlI <= 1'b1;
                      illI <= 0;
                    end
                  default:
                    begin
                      I0lI <= OlII;
                      liII <= 1'b0;
                      oiII <= 1'b0;
                      iiII <= 1'b0;
                      OOlI <= 1'b0;
                      IOlI <= 1'b0;
                      OllI <= 16'b0;
                      IiII <= 8'd0;
                      OiII <= 8'd0;
                      frame_number_o <= 16'd0;
                      IllI <= 8'd0;
                      lllI <= 8'd0;
                      word_count_o <= 16'hFFFF;
                      illI <= 0;
                    end
                endcase
            end
        end
      else
        if (g_LANE_WIDTH == 4)
          begin
            always
              @(posedge CAM_CLOCK_I or
                negedge RESET_n_I)
              begin
                if (!RESET_n_I)
                  begin
                    I0lI <= o0II;
                    liII <= 1'b0;
                    oiII <= 1'b0;
                    frame_valid_o <= 1'b0;
                    iiII <= 1'b0;
                    iiII <= 1'b0;
                    IOlI <= 1'b0;
                    OllI <= 16'b0;
                    IiII <= 8'd0;
                    OiII <= 8'd0;
                    frame_number_o <= 16'd0;
                    IllI <= 8'd0;
                    lllI <= 8'd0;
                    word_count_o <= 16'hFFFF;
                    illI <= 0;
                  end
                else
                  case (I0lI)
                    o0II:
                      begin
                        oiII <= 0;
                        if (ollI == 32'hB8B8B8B8)
                          I0lI <= i0II;
                        else
                          begin
                            I0lI <= o0II;
                            frame_valid_o <= 1'b0;
                          end
                      end
                    i0II:
                      if (ollI[5 : 0] == 6'h00)
                        begin
                          liII <= 1'b1;
                          frame_valid_o <= 1'b1;
                          frame_number_o <= ollI[23 : 8];
                          I0lI <= O1II;
                        end
                      else
                        I0lI <= o0II;
                    O1II:
                      begin
                        OOlI <= 1'b0;
                        liII <= 0;
                        if (ollI == 32'hB8B8B8B8)
                          I0lI <= I1II;
                        else
                          I0lI <= O1II;
                        OllI <= 0;
                      end
                    I1II:
                      if (ollI[5 : 0] == 6'h01)
                        begin
                          I0lI <= o0II;
                          oiII <= 1'b1;
                        end
                      else
                        begin
                          word_count_o <= ollI[23 : 8];
                          I0lI <= l1II;
                          iiII <= 1'b1;
                        end
                    l1II:
                      begin
                        iiII <= 1'b0;
                        OllI <= OllI + 4;
                        illI <= ollI;
                        if (OllI < (word_count_o - 1))
                          begin
                            I0lI <= l1II;
                            IOlI <= 1;
                          end
                        else
                          begin
                            I0lI <= o1II;
                            IOlI <= 0;
                          end
                      end
                    o1II:
                      begin
                        I0lI <= O1II;
                        IOlI <= 0;
                        OOlI <= 1'b1;
                        illI <= 0;
                      end
                    default:
                      begin
                        I0lI <= o0II;
                        liII <= 1'b0;
                        oiII <= 1'b0;
                        iiII <= 1'b0;
                        OOlI <= 1'b0;
                        IOlI <= 1'b0;
                        OllI <= 16'b0;
                        IiII <= 8'd0;
                        OiII <= 8'd0;
                        frame_number_o <= 16'd0;
                        IllI <= 8'd0;
                        lllI <= 8'd0;
                        word_count_o <= 16'hFFFF;
                        illI <= 0;
                      end
                  endcase
              end
          end
        else
          if (g_LANE_WIDTH == 8)
            begin
              always
                @(posedge CAM_CLOCK_I or
                  negedge RESET_n_I)
                begin
                  if (!RESET_n_I)
                    begin
                      I0lI <= i1II;
                      liII <= 1'b0;
                      oiII <= 1'b0;
                      frame_valid_o <= 1'b0;
                      iiII <= 1'b0;
                      IOlI <= 1'b0;
                      OllI <= 16'b0;
                      IiII <= 8'd0;
                      OiII <= 8'd0;
                      frame_number_o <= 16'd0;
                      IllI <= 8'd0;
                      lllI <= 8'd0;
                      word_count_o <= 16'hFFFF;
                      illI <= 0;
                    end
                  else
                    case (I0lI)
                      i1II:
                        begin
                          oiII <= 0;
                          if (ollI == 64'h00000000B8B8B8B8)
                            I0lI <= OoII;
                          else
                            begin
                              I0lI <= i1II;
                              frame_valid_o <= 1'b0;
                            end
                        end
                      OoII:
                        if (ollI[5 : 0] == 6'h00)
                          begin
                            liII <= 1'b1;
                            frame_valid_o <= 1'b1;
                            frame_number_o <= ollI[23 : 8];
                            I0lI <= IoII;
                          end
                        else
                          I0lI <= OoII;
                      IoII:
                        begin
                          OOlI <= 1'b0;
                          liII <= 0;
                          if (ollI[31 : 0] == 32'hB8B8B8B8)
                            I0lI <= loII;
                          else
                            I0lI <= IoII;
                          OllI <= 0;
                        end
                      loII:
                        if (ollI[5 : 0] == 6'h01)
                          begin
                            I0lI <= o0II;
                            oiII <= 1'b1;
                          end
                        else
                          begin
                            word_count_o <= ollI[23 : 8];
                            I0lI <= l1II;
                            iiII <= 1'b1;
                          end
                      ooII:
                        begin
                          iiII <= 1'b0;
                          OllI <= OllI + 8;
                          illI <= O0lI;
                          if (OllI < (word_count_o - 1))
                            begin
                              I0lI <= ooII;
                              IOlI <= 1;
                            end
                          else
                            begin
                              I0lI <= ioII;
                              IOlI <= 0;
                            end
                        end
                      ioII:
                        begin
                          I0lI <= IoII;
                          IOlI <= 0;
                          OOlI <= 1'b1;
                          illI <= 0;
                        end
                      default:
                        begin
                          I0lI <= i1II;
                          liII <= 1'b0;
                          oiII <= 1'b0;
                          iiII <= 1'b0;
                          OOlI <= 1'b0;
                          IOlI <= 1'b0;
                          OllI <= 16'b0;
                          IiII <= 8'd0;
                          OiII <= 8'd0;
                          frame_number_o <= 16'd0;
                          IllI <= 8'd0;
                          lllI <= 8'd0;
                          word_count_o <= 16'hFFFF;
                          illI <= 0;
                        end
                    endcase
                end
            end
  endgenerate
  byte2pixel_conversion #(.g_DATAWIDTH(g_DATAWIDTH), .g_LANE_WIDTH(g_LANE_WIDTH), .g_NUM_OF_PIXELS(g_NUM_OF_PIXELS)) i1lI(.CAM_CLOCK_I(CAM_CLOCK_I),
                                                                                                                          .READ_CLOCK_I(READ_CLOCK_I),
                                                                                                                          .RESET_n_I(RESET_n_I),
                                                                                                                          .byte_data_i(illI),
                                                                                                                          .byte_en_i(IOlI),
                                                                                                                          .pixel_data_o(data_out_o),
                                                                                                                          .line_valid_o(pixel_valid_o),
                                                                                                                          .line_start_o(OolI),
                                                                                                                          .line_end_o(IolI));
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
      begin
        I1lI <= 0;
        l1lI <= 0;
        o1lI <= 0;
      end
    else
      begin
        I1lI <= frame_valid_o;
        l1lI <= I1lI;
        o1lI <= l1lI;
      end
  assign i0lI = l1lI & ~o1lI;
  assign O1lI = ~l1lI & o1lI;
  always
    @(posedge (READ_CLOCK_I) or
      negedge (IlI))
    begin
      if (!IlI)
        begin
          frame_start_o <= 1'd0;
        end
      else
        begin
          frame_start_o <= i0lI;
        end
    end
  always
    @(posedge (READ_CLOCK_I) or
      negedge (IlI))
    begin
      if (!IlI)
        begin
          frame_end_o <= 1'd0;
        end
      else
        begin
          frame_end_o <= O1lI;
        end
    end
  always
    @(posedge (READ_CLOCK_I) or
      negedge (IlI))
    begin
      if (!IlI)
        begin
          line_start_o <= 1'd0;
        end
      else
        begin
          line_start_o <= OolI;
        end
    end
  always
    @(posedge (READ_CLOCK_I) or
      negedge (IlI))
    begin
      if (!IlI)
        begin
          line_end_o <= 1'd0;
        end
      else
        begin
          line_end_o <= IolI;
        end
    end
endmodule
