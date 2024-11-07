module Unary_add_1_4_9_tb;

    // Inputs
    reg A;
    reg B;
    reg en;
    reg clk;
    reg rst_n;
    reg read_or_write;

    // Outputs
    wire dout;
    wire C;

    // Instantiate the Unit Under Test (UUT)
    Unary_add_1_4_9 uut (
        .A(A), 
        .B(B), 
        .en(en), 
        .clk(clk), 
        .rst_n(rst_n), 
        .read_or_write(read_or_write), 
        .dout(dout), 
        .C(C)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period clock
    end

    // Test procedure
    initial begin

        $dumpfile("wave.vcd");  // 指定波形文件的名称
        $dumpvars(0, Unary_add_1_4_9_tb); // Dump所有信号
        // Initialize inputs
        en = 0;
        rst_n = 0;
        read_or_write = 0; // Read mode

        // Reset the module
        #10 rst_n = 1;
        
        // Test Case: A=111111100000000, B=111000000000000
        // Enable and set read mode
        #10 en = 1;
        
        // Apply A and B sequences with a clock period of 10ns
        A = 1; B = 1; #10;   // Clock 0
        A = 1; B = 1; #10;   // Clock 1
        A = 1; B = 1; #10;   // Clock 2
        A = 1; B = 1; #10;   // Clock 3
        A = 1; B = 1; #10;   // Clock 4
        A = 1; B = 1; #10;   // Clock 5
        A = 1; B = 1; #10;   // Clock 6
        A = 1; B = 1; #10;   // Clock 7
        A = 1; B = 1; #10;   // Clock 8
        A = 1; B = 1; #10;   // Clock 9
        A = 1; B = 1; #10;   // Clock 10
        A = 1; B = 1; #10;   // Clock 11
        A = 1; B = 1; #10;   // Clock 12
        A = 1; B = 1; #10;   // Clock 13
        A = 1; B = 1; #10;   // Clock 14
        A = 1; B = 1; #10;   // Clock 15
        A = 1; B = 1; #10;   // Clock 16
        A = 1; B = 1; #10;   // Clock 17
        A = 1; B = 1; #10;   // Clock 18

        // Switch to write mode to output count values
        read_or_write = 1; 

        // Observe dout output as count is written out
        #200 $finish;
    end

endmodule
