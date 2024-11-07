module Unary_add_1_4_6 (
    input wire A,
    input wire B,
    input wire en,
    input wire clk,
    input wire rst_n,
    input wire read_or_write,
    output reg dout,
    output reg C
);

    reg [2:0] count;        

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 3'd0;
            dout <= 1'b0;
            C <= 1'b0;
        end else if (en) begin
            if (read_or_write == 1'b0) begin
                // 读取阶段
                dout <= 1'b0;
                C <= ((count == 3'd6) && (A || B)) || ((count == 3'd5) && (A && B));
                if (A && B) begin
                    if (count == 3'd5) begin
                      count <= 0;
                    end else if (count == 3'd6) begin
                        count <= 1;
                    end else begin
                      count <= count + 2;
                    end
                end else if (A || B) begin
                    if (count == 3'd6) begin
                      count <= 0;
                    end else begin
                        count <= count + 1;
                    end
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
