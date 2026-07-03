module clock_divider(
    input clk,
    input reset,
    output reg slow_clk
);

reg [25:0] count;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        count <= 0;
        slow_clk <= 0;
    end
    else
    begin
        if(count == 26'd49999999)
        begin
            count <= 0;
            slow_clk <= ~slow_clk;
        end
        else
            count <= count + 1;
    end
end

endmodule