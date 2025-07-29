
module ALU_tb;

reg clk;
reg signed [3:0] a_in, b_in;
reg [3:0] sel;
wire signed [7:0] y_out;


ALU uut (
    .clk(clk),
    .a_in(a_in),
    .b_in(b_in),
    .sel(sel),
    .y_out(y_out)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period = 10ns (5ns high + 5ns low)
end

integer a_idx, b_idx, sel_idx;

initial begin

    a_in = 0;
    b_in = 0;
    sel  = 0;

    #10;
    $display("==== Start Testing ====");

    for (a_idx = -7; a_idx <= 8; a_idx = a_idx + 1) begin
        for (b_idx = -7; b_idx <= 8; b_idx = b_idx + 1) begin
            for (sel_idx = 0; sel_idx < 16; sel_idx = sel_idx + 1) begin
                a_in = a_idx;
                b_in = b_idx;
                sel  = sel_idx;

                @(posedge clk);
                #1;
                $display("%0t ns : sel = %b | a_in = %0d | b_in = %0d | y_out = %0d",
                          $time/10, sel, a_in, b_in, y_out);
                #4;
            end
        end
    end

    $display("==== Testing Done ====");
    #20;
    $finish;
end

endmodule