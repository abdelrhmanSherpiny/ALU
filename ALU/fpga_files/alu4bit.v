module alu4bit (
    input clk,                            // ساعة للفليب-فلوب
    input signed [3:0] a_in, b_in,        // مدخلات signed
    input [3:0] sel,                      // إشارة اختيار العملية
    output reg signed [7:0] y_out         // ناتج signed
);

// Flip-Flops للمدخلات
reg signed [3:0] a, b;
reg signed [7:0] result;

always @(posedge clk) begin
    // تخزين القيم داخل الفليب-فلوب
    a <= a_in;
    b <= b_in;

    case (sel)
        4'b0000: result <= a + 1;             // Increment a
        4'b0001: result <= b + 1;             // Increment b
        4'b0010: result <= a;                 // Transfer a
        4'b0011: result <= b;                 // Transfer b
        4'b0100: result <= a - 1;             // Decrement a
        4'b0101: result <= a * b;             // Multiply
        4'b0110: result <= a + b;             // Add
        4'b0111: result <= a - b;             // Subtract (a > b assumed)
        4'b1000: result <= ~a;                // 1's Complement a
        4'b1001: result <= ~b;                // 1's Complement b
        4'b1010: result <= a & b;             // AND
        4'b1011: result <= a | b;             // OR
        4'b1100: result <= a ^ b;             // XOR
        4'b1101: result <= ~(a ^ b);          // XNOR
        4'b1110: result <= ~(a & b);          // NAND
        4'b1111: result <= ~(a | b);          // NOR
        default: result <= 8'sb0;
    endcase

    // تخزين الناتج في فليب-فلوب
    y_out <= result;
end
endmodule 
