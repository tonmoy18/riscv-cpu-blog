///////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
//
//
//
///////////////////////////////////////////////////////////


module pc(
    rst_n_i,
    clk_i,

    incr_pc_i,
    pc_o
);

  import proc_pkg::*;

  // Input/Output Definitions
  input logic rst_n_i, clk_i;
  input logic incr_pc_i;

  output logic [31:0] pc_o;

  // Local signals
  logic [31:0] next_pc, pc_q;
  logic [31:0] pc_d_q, pc_d2_q;
  logic [31:0] next_pc_d, next_pc_d2;

  // Output assignments
  assign pc_o = pc_q;

  // Module main body

  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if (rst_n_i == 1'b0) begin
      pc_q <= PC_RESET_VAL;
    end else begin
      pc_q <= next_pc;
    end
  end

  always_comb begin
    next_pc_d = pc_q;
    next_pc_d2 = pc_d_q;
  end

  always_comb begin
    if (incr_pc_i == 1'b1) next_pc = pc_q + 'd4;
    else next_pc = pc_q;
  end

endmodule
