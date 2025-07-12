module sequence_detector_1001(
    input clk,
    input in,
    input reset,
    output reg out
);
reg [1:0] state;
parameter a= 2'b00,
          b= 2'b01,
          c= 2'b10,
          d=2'b11;
always @(posedge clk or posedge reset) begin
    if (reset)
    begin
    state <= a;
    out <= 1'b0;
    end
    else
    begin
        case(state)
        a:
        begin
            if (in)
            state <=b;
            else
            state <= a;
            out <= 1'b0;
        end
        b:
        begin
            if(in)
            state <= b;
            else
            state <= c;
            out <= 1'b0;
        end
        c:
        begin
            if(in)
            state <= b; 
            else
            state <= d;
            out <= 1'b0;
        end
        d:
        begin
            if(in)
            begin
                state<= b;
                out <= 1'b1;
            end
            else
            begin 
                state<= a;
                out <= 1'b0;
            end
        end
        endcase
    end
end
endmodule