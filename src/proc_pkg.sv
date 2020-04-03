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

package proc_pkg;

  localparam logic [31:0] PC_RESET_VAL = 32'h00000000;

  localparam logic [6:0] LUI_OPCODE        = 7'b0110111;
  localparam logic [6:0] AUIPC_OPCODE      = 7'b0010111;
  localparam logic [6:0] RTYPE_OPCODE      = 7'b0110011;
  localparam logic [6:0] ITYPE_ALU_OPCODE  = 7'b0010011;
  localparam logic [6:0] BRANCH_OPCODE     = 7'b1100011;
  localparam logic [6:0] JAL_OPCODE        = 7'b1101111;
  localparam logic [6:0] JALR_OPCODE       = 7'b1100111;
  localparam logic [6:0] LOAD_OPCODE       = 7'b0000011;
  localparam logic [6:0] STORE_OPCODE      = 7'b0100011;
 
  localparam logic [4:0] FUNCT3_ADD  = 3'b000;
  localparam logic [4:0] FUNCT3_SUB  = 3'b000;
  localparam logic [4:0] FUNCT3_SLL  = 3'b001;
  localparam logic [4:0] FUNCT3_SLT  = 3'b010;
  localparam logic [4:0] FUNCT3_SLTU = 3'b011;
  localparam logic [4:0] FUNCT3_XOR  = 3'b100;
  localparam logic [4:0] FUNCT3_SRL  = 3'b101;
  localparam logic [4:0] FUNCT3_SRA  = 3'b101;
  localparam logic [4:0] FUNCT3_OR   = 3'b110;
  localparam logic [4:0] FUNCT3_AND  = 3'b111;
 
  localparam logic [4:0] FUNCT3_EQ   = 3'b000;
  localparam logic [4:0] FUNCT3_NE   = 3'b001;
  localparam logic [4:0] FUNCT3_LT   = 3'b100;
  localparam logic [4:0] FUNCT3_GE   = 3'b101;
  localparam logic [4:0] FUNCT3_LTU  = 3'b110;
  localparam logic [4:0] FUNCT3_GEU  = 3'b111;
 
 
  localparam logic [4:0] LOAD_B      = 3'b000;
  localparam logic [4:0] LOAD_H      = 3'b001;
  localparam logic [4:0] LOAD_W      = 3'b010;
  localparam logic [4:0] LOAD_BU     = 3'b100;
  localparam logic [4:0] LOAD_HU     = 3'b101;


endpackage
