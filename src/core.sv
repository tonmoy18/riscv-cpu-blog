
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

  logic incr_pc;
  logic [31:0] pc_val;

  logic [31:0] d_inst;

  logic [4:0] reg2_addr;
  logic [4:0] reg1_addr;
  logic [31:0] reg_d1out;
  logic [31:0] reg_d2out;

  logic [5:0] reg_w_addr;

  logic [31:0] w_mux;

  logic [31:0] x_arith_op1, x_arith_op2;
  logic [31:0] arith_out;
  logic x_funct7_30;
  logic conflict;

  pc u_pc (
    .rst_n_i        (rst_n_i),
    .clk_i          (clk_i),

    .incr_pc_i      (incr_pc),
     
    .pc_o           (pc_val)
  );
  
  fetch u_fetch (
    .rst_n_i        (rst_n_i),
    .clk_i          (clk_i),
    
    .pc_i           (pc_val),

    .conflict_i     (conflict),

    .im_dout_i      (im_dout_i),

    .im_addr_o      (im_addr_o),

    .inst_o         (d_inst)
  );

  regfile u_regfile (
    .rst_n_i        (rst_n_i),
    .clk_i          (clk_i),

    .w_addr_i       (reg_w_addr),
    .din_i          (w_mux),
    
    .r1_addr_i      (reg1_addr),
    .d1out_o        (reg_d1out),

    .r2_addr_i      (reg2_addr),
    .d2out_o        (reg_d2out)
  );

  control u_control (
    .rst_n_i                (rst_n_i),
    .clk_i                  (clk_i),
    
    .d_inst_i               (d_inst),

    .reg1_addr_o            (reg1_addr),
    .reg2_addr_o            (reg2_addr),

    .x_funct3_o             (x_funct3),
    .x_funct7_30_o          (x_funct7_30),
    .reg_w_addr_o           (reg_w_addr),

    .w_funct3_o             (w_funct3),

    .incr_pc_o              (incr_pc),
    .conflict_o             (conflict)
  );

  datapath u_datapath (
    .rst_n_i                (rst_n_i),
    .clk_i                  (clk_i),

    .reg1_data_i            (reg_d1out),
    .reg2_data_i            (reg_d2out),

    .arith_out_i            (arith_out),

    .x_arith_op1_o          (x_arith_op1),
    .x_arith_op2_o          (x_arith_op2),

    .w_mux_o                (w_mux)
  );

  arith u_arith (
    .rst_n_i        (rst_n_i),
    .clk_i          (clk_i),

    .funct_i        (x_funct7_30),

    .op1_i          (x_arith_op1),
    .op2_i          (x_arith_op2),

    .res_o          (arith_out)
  );

endmodule

