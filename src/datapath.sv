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

module datapath(
    rst_n_i,
    clk_i,

    reg1_data_i,
    reg2_data_i,

    arith_out_i,

    x_arith_op1_o,
    x_arith_op2_o,

    w_mux_o
);
  import proc_pkg::*;
  // Input/Output Definitions
  input logic rst_n_i, clk_i;

  input logic [31:0] reg1_data_i;
  input logic [31:0] reg2_data_i;

  input logic [31:0] arith_out_i;

  output logic [31:0] x_arith_op1_o;
  output logic [31:0] x_arith_op2_o;
  output logic [31:0] w_mux_o;

  // Local signals
  logic [31:0] x_arith_op1_next, x_arith_op1_q;
  logic [31:0] x_arith_op2_next, x_arith_op2_q;
  logic [31:0] m_alu_data_q, m_alu_data_next;
  logic [31:0] w_mux_q, w_mux_next;
  logic load_signed;
  logic load_sign_bit;

  assign x_arith_op1_o = x_arith_op1_q;
  assign x_arith_op2_o = x_arith_op2_q;
  assign w_mux_o = w_mux_q;

  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if (rst_n_i == 1'b0) begin
      m_alu_data_q <= '0;
      x_arith_op1_q <= '0;
      x_arith_op2_q <= '0;
      w_mux_q <= '0;
  end else begin
      m_alu_data_q <= m_alu_data_next;
      x_arith_op1_q <= x_arith_op1_next;
      x_arith_op2_q <= x_arith_op2_next;
      w_mux_q <= w_mux_next;
    end
  end

  always_comb begin
    m_alu_data_next = arith_out_i;
  end

  always_comb begin
    x_arith_op1_next = reg1_data_i;
  end

  always_comb begin
    x_arith_op2_next = reg2_data_i;
  end

  always_comb begin
    w_mux_next = m_alu_data_q;
  end

endmodule