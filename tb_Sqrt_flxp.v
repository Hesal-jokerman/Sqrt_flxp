`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/06 22:33:48
// Design Name: 
// Module Name: tb_Sqrt_flxp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Sqrt_flxp;
    reg clk;
    reg rst_n;
    reg [36:0] a;
    reg [36:0] b;
    wire [36:0] c;

parameter data_lenth = 8192;
reg [36:0] mem_a[0:data_lenth-1];
reg [36:0] mem_b[0:data_lenth-1];
reg [14:0] mem_addr;
reg data_valid;
reg data_valid_t;

Sqrt_fixp u_mutl(
    .clk(clk),
    .rst_n(rst_n),
    .x(a),
    .y(b),
    .c(c)
);

initial begin
    clk = 0;
    rst_n = 0;
    #50 rst_n = 1;
end
    
initial begin
    
    $readmemh("D:/A_job_project/Software/ic_test_bench/x_37Q27.txt",mem_a);
    $readmemh("D:/A_job_project/Software/ic_test_bench/y_37Q27.txt",mem_b);
end

always #5 clk = ~clk;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        begin
            a <= 37'd0;
            b <= 37'd0;
            mem_addr <= 15'd0;
            data_valid <= 1'b0;
        end
    else if (mem_addr==data_lenth) 
        begin
            mem_addr=data_lenth;
            data_valid <= 1'b0;
        end
    else 
        begin
            a <= mem_a[mem_addr];
            b <= mem_b[mem_addr];
            mem_addr <= mem_addr+1'b1;
            data_valid <=1'b1;
        end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        data_valid_t <= 1'b0;
    else
        data_valid_t <= data_valid;
end

integer fid;

initial begin
    fid = $fopen("D:/A_job_project/Software/ic_test_bench/sqrt_xy_out_37Q27.txt","w");
    if (!fid) 
        begin
            $display("*******can not open file**********");
            $finish;
        end
    else 
        begin
            $display("*******open file success**********");
            $finish;
        end
end

always @(posedge clk) begin
    if(data_valid_t)
        $fdisplay(fid,"%d",$signed(c));
    else if(mem_addr==data_lenth)
        begin
            $fclose(fid);
            $finish;
        end
end
endmodule


