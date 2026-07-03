module timer_counter(
    input clk,
    input reset,
    input enable,
    output reg [3:0] timer
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        timer <= 0;
    else if(enable)
        timer <= timer + 1;
    else
        timer <= 0;
end

endmodule