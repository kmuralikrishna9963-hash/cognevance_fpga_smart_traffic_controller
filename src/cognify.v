module cognify(

input clk,
input reset,
input sensor,

output [2:0] main_light,
output [2:0] side_light

);

wire slow_clk;

wire enable;

wire [3:0] timer;

wire [1:0] main_addr;

wire [1:0] side_addr;

clock_divider c1(

.clk(clk),
.reset(reset),
.slow_clk(slow_clk)

);

timer_counter c2(

.clk(slow_clk),
.reset(reset),
.enable(enable),
.timer(timer)

);

traffic_fsm c3(

.clk(slow_clk),
.reset(reset),
.sensor(sensor),
.timer(timer),

.enable(enable),

.main_addr(main_addr),
.side_addr(side_addr)

);

memory m1(

.address(main_addr),
.light(main_light)

);

memory m2(

.address(side_addr),
.light(side_light)

);

endmodule