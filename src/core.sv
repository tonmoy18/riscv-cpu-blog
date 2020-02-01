
module core(
  rst_n_i,
  clk_i,
  
  dm_dout_i,
  dm_wen_o,
  dm_en_o,
  dm_din_o,
  dm_addr_o,
  dm_busy_i,
  
  im_dout_i,
  im_addr_o,
  im_busy_i
);

  input logic rst_n_i;
  input logic clk_i;

  input logic [31:0] dm_dout_i;
  output logic dm_wen_o;
  output logic dm_en_o;
  output logic [31:0] dm_din_o;
  output logic [31:0] dm_addr_o;
  input logic dm_busy_i;

  input logic [31:0] im_dout_i;
  output logic [31:0] im_addr_o;
  input logic im_busy_i;

endmodule

