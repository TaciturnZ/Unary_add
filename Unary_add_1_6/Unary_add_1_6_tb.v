module Unary_add_1_6_tb;
    reg A, B, en, clk, rst_n, read_or_write;
    wire dout, C;

    Unary_add_1_6 uut (
        .A(A),
        .B(B),
        .en(en),
        .clk(clk),
        .rst_n(rst_n),
        .read_or_write(read_or_write),
        .dout(dout),
        .C(C)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst_n = 0;
        en = 0;
        read_or_write = 0;
        A = 0;
        B = 0;
        #10 rst_n = 1;  

        en = 1;

        repeat(33) begin
            #10 A = 1; B = 1;
            #10 A = 0; B = 0;
        end

        read_or_write = 1;
        #200;

        $stop;
    end

    always @(posedge clk) begin
        $display("Time: %0t | A = %b | B = %b | count = %d | dout = %b | C = %b", 
                  $time, A, B, uut.count, dout, C);
    end
endmodule

