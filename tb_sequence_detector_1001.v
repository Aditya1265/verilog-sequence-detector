`timescale 1ns/1ps

module tb_sequence_detector_1001;

    reg clk;
    reg in;
    reg reset;
    wire out;

    sequence_detector_1001 uut (
        .clk(clk),
        .in(in),
        .reset(reset),
        .out(out)
    );

    
    always #5 clk = ~clk;

    
    reg [10:0] input_sequence = 11'b10010011001;
    integer i;

    initial begin
       
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_sequence_detector_1001);

        
        clk = 0;
        reset = 1;
        in = 0;

        #10;
        reset = 0;

        
        for (i = 0; i < 11; i = i + 1) begin
            in = input_sequence[i];
            #10;
        end

        #20;
        $finish;
    end

    
    initial begin
        $display("Time\tclk\tin\treset\tout");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, in, reset, out);
    end

endmodule
