module clock_gating (
    input clk,
    input en,
    output gated_clk
);
    assign gated_clk = clk & en;
endmodule
