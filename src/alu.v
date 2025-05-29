module alu #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] A, B,
    input [3:0] op,
    input clk, en,
    output reg [WIDTH-1:0] result
);

    wire gated_clk;
    clock_gating cg (
        .clk(clk),
        .en(en),
        .gated_clk(gated_clk)
    );

    // Operand isolation logic for B (B_isolated is zeroed for unary ops)
    wire [WIDTH-1:0] B_isolated;
    assign B_isolated = (op[3:2] == 2'b01 || op >= 4'b1000) ? {WIDTH{1'b0}} : B;

    reg [WIDTH-1:0] temp_result;

    always @(*) begin
        case (op)
            4'b0000: temp_result = A + B_isolated;                 // ADD
            4'b0001: temp_result = A - B_isolated;                 // SUB
            4'b0010: temp_result = A & B_isolated;                 // AND
            4'b0011: temp_result = A | B_isolated;                 // OR
            4'b0100: temp_result = A ^ B_isolated;                 // XOR
            4'b0101: temp_result = ~A;                             // NOT
            4'b0110: temp_result = A + {{(WIDTH-1){1'b0}}, 1'b1};  // INC
            4'b0111: temp_result = A - {{(WIDTH-1){1'b0}}, 1'b1};  // DEC
            4'b1000: temp_result = A << 1;                         // SHL
            4'b1001: temp_result = A >> 1;                         // SHR
            4'b1010: temp_result = {A[WIDTH-2:0], A[WIDTH-1]};     // ROL
            4'b1011: temp_result = {A[0], A[WIDTH-1:1]};           // ROR
            default: temp_result = {WIDTH{1'b0}};
        endcase
    end

    always @(posedge gated_clk) begin
        result <= temp_result;
    end

endmodule
