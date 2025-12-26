`timescale 1ns/1ps
module tb;
logic we;
logic[31:0] din;
logic re;
logic clk;
logic rstn;
logic[31:0] dout;
logic full;
logic empty;
syncfifo dut(.*);
initial clk=0;
always #5 clk=~clk;
int i;
initial begin
    $display("clk\t\twe\t\tre\t\tfull\t\tempty\t\tdin\t\tdout\t\twr_ptr\t\trd_ptr\t\tlooped");
    $monitor("%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b",clk,we,re,full,empty,din[8:0],dout[8:0],dut.wr_ptr[5:0],dut.rd_ptr[5:0],dut.looped);

    rstn=0;
    #10;
    rstn=1;
    for ( i= 0;i<511 ;i++ ) begin
        we = $urandom_range(1,0)[0];
        re = $urandom_range(1,0)[0];
        din =i;
        #10;
    end
    $finish;
end
endmodule