module traffic_fsm(

input clk,
input reset,
input sensor,
input [3:0] timer,

output reg enable,
output reg [1:0] main_addr,
output reg [1:0] side_addr

);

parameter MG = 2'd0;
parameter MY = 2'd1;
parameter SG = 2'd2;
parameter SY = 2'd3;

reg [1:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= MG;
    else
    begin
        case(state)

        MG:
            if(sensor && timer==9)
                state <= MY;

        MY:
            if(timer==2)
                state <= SG;

        SG:
            if(timer==7)
                state <= SY;

        SY:
            if(timer==2)
                state <= MG;

        endcase
    end
end

always @(*)
begin

enable = 1;

case(state)

MG:
begin
main_addr = 2'b00;
side_addr = 2'b10;
end

MY:
begin
main_addr = 2'b01;
side_addr = 2'b10;
end

SG:
begin
main_addr = 2'b10;
side_addr = 2'b00;
end

SY:
begin
main_addr = 2'b10;
side_addr = 2'b01;
end

endcase

end

endmodule