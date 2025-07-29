module fpga (
    clk     ,
    rst_n   ,
    seg     ,
	 sel     ,
    an
);

input  clk;
input  [3:0] sel;
input  rst_n;

output  [0:6] seg;
output  [3:0] an;

wire signed  [7:0] y;

wire signed  [3:0] a;
wire signed  [3:0] b;

assign a = 4'b0111;	// 7
assign b = 4'b1000;	// -8

alu4bit alu4bit (
    .clk(clk),
    .a_in(a),
    .b_in(b),
    .sel(sel),
    .y_out(y)
);

digital_tube_decoder digital_tube_decoder (
    .clk(clk),
    .A(y),
    .sel(sel[3]),
    .seg(seg),
    .an(an)
);


endmodule