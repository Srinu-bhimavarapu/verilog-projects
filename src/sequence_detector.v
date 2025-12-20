module sequence_detector(
    input x,
    input clk,
    input reset,
    output reg z
    );

    parameter s0=0, s1=1, s2=2, s3=3;
    reg [1:0] Ps, Ns;

    // state register
    always @(posedge clk or negedge reset) begin
        if (!reset)
            Ps <= s0;
				        else
            Ps <= Ns;
    end

    // next state & output
    always @(Ps, x) begin
        z = 0;  // default
        case(Ps)
            s0: begin
                if (x==0) Ns = s1;   // got first 0
                else      Ns = s0;
            end
            s1: begin
                if (x==1) Ns = s2;   // got 01
                else      Ns = s1;   // stay if 0
            end     
            s2: begin
                if (x==1) Ns = s3;   // got 011
                else      Ns = s1;   // restart with 0
            end
            s3: begin
                if (x==0) begin      // got 0110
                    z = 1;
                    Ns = s1;         // reuse last 0
                end
                else
                    Ns = s2;         // still in 0111
            end
            default: Ns = s0;
        endcase
    end
endmodule
