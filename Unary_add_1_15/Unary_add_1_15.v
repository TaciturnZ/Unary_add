module Unary_add_1_15 (
    input wire A,
    input wire B,
    input wire en,
    input wire clk,
    input wire rst_n,
    input wire read_or_write,
    output reg dout,
    output reg C
);

    reg [14:0] count;        

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 15'd0;
            dout <= 1'b0;
            C <= 1'b0;
        end else if (en) begin
            if (read_or_write == 1'b0) begin
                // 读取阶段
                dout <= 1'b0;
                C <= (((count == 15'd32767) && (A || B)) || ((count == 15'd32766) && (A && B)));
                if (A && B) begin
                    count <= count + 2;
                end else if (A || B) begin
                    count <= count + 1;
                end 
            end else begin
                // 写入阶段
                C <= 1'b0;
                if (count) begin
                    dout <= 1'b1;
                    count <= count - 1; 
                end else
                    dout <= 1'b0;
                end 
            end
        end

endmodule