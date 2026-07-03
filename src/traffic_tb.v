`timescale 1ns/1ps

module traffic_tb;

reg clk;
reg reset;
reg sensor;

wire [2:0] main_light;
wire [2:0] side_light;

top_module uut(

.clk(clk),
.reset(reset),
.sensor(sensor),

.main_light(main_light),
.side_light(side_light)

);

always #5 clk = ~clk;

initial
begin

clk=0;
reset=1;
sensor=0;

#20;

reset=0;

#100;

sensor=1;

#500;

sensor=0;

#500;

$stop;

end

endmodule