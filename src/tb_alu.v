`timescale 1ns/1ps
module tb_alu;

    parameter WIDTH = 16;

    reg [WIDTH-1:0] A, B;
    reg [3:0] op;
    reg clk, en;
    wire [WIDTH-1:0] result;

    alu #(WIDTH) uut (
        .A(A), .B(B), .op(op), .clk(clk), .en(en), .result(result)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu);

        A = 8'b10110011; B = 8'b01010101; en = 1;

        op = 4'b0000; #10; // ADD
        op = 4'b0001; #10; // SUB
        op = 4'b0010; #10; // AND
        op = 4'b0011; #10; // OR
        op = 4'b0100; #10; // XOR
        op = 4'b0101; #10; // NOT
        op = 4'b0110; #10; // INC
        op = 4'b0111; #10; // DEC
        op = 4'b1000; #10; // SHL
        op = 4'b1001; #10; // SHR
        op = 4'b1010; #10; // ROL
        op = 4'b1011; #10; // ROR

        // Clock gating test
        en = 0; op = 4'b0000; A = 8'd99; B = 8'd55; #10;

        en = 1; op = 4'b0000; A = 8'd120; B = 8'd10; #10;

        $finish;
    end

endmodule
