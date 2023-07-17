`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/05 19:31:37
// Design Name: 
// Module Name: Sqrt_fixp
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


module Sqrt_fixp
    #(
      parameter  m = 37 ,  // m should >27
      parameter  n = 27)
    (
            input   clk,
            input   rst_n,
            input   [m-1:0] x,
            input   [m-1:0] y,
            output reg [m-1:0] c
    );
    
    
        //全部定义为有符号型数据
    reg signed  [m-1:0]      x0=0,y0=0;
    reg signed  [m-1:0]      x1=0,y1=0;
    reg signed  [m-1:0]      x2=0,y2=0;
    reg signed  [m-1:0]      x3=0,y3=0;
    reg signed  [m-1:0]      x4=0,y4=0;
    reg signed  [m-1:0]      x5=0,y5=0;
    reg signed  [m-1:0]      x6=0,y6=0;
    reg signed  [m-1:0]      x7=0,y7=0;
    reg signed  [m-1:0]      x8=0,y8=0;
    reg signed  [m-1:0]      x9=0,y9=0;
    reg signed  [m-1:0]      x10=0,y10=0;
    reg signed  [m-1:0]      x11=0,y11=0;
    reg signed  [m-1:0]      x12=0,y12=0;
    reg signed  [m-1:0]      x13=0,y13=0;
    reg signed  [m-1:0]      x14=0,y14=0;
    reg signed  [m-1:0]      x15=0;

    always @ (posedge clk or negedge rst_n)
    begin
        if( !rst_n )  begin
            x0 <= 1'b0;                         
            y0 <= 1'b0;
        end
        else  begin  
            x0 <= x[m-1]? ~(x-1):x;    //x0赋初值
            y0 <= y;                //y0赋初值0
        end
    end


    always @ (posedge clk or negedge rst_n)
    begin
        if( !rst_n )  begin
            x1 <= 1'b0;                         
            y1 <= 1'b0;     //
            x2 <= 1'b0;                         
            y2 <= 1'b0;     //
            x3 <= 1'b0;                         
            y3 <= 1'b0;     //
            x4 <= 1'b0;                         
            y4 <= 1'b0;     //
            x5 <= 1'b0;                         
            y5 <= 1'b0;     //
            x6 <= 1'b0;                         
            y6 <= 1'b0;     //
            x7 <= 1'b0;                         
            y7 <= 1'b0;     //
            x8 <= 1'b0;                         
            y8 <= 1'b0;     //
            x9 <= 1'b0;                         
            y9 <= 1'b0;     //
            x10 <= 1'b0;                         
            y10 <= 1'b0;    //
            x11 <= 1'b0;                         
            y11 <= 1'b0;    //
            x12 <= 1'b0;                         
            y12 <= 1'b0;    //
            x13 <= 1'b0;                         
            y13 <= 1'b0;    //
            x14 <= 1'b0;                         
            y14 <= 1'b0;    //
            x15 <= 1'b0;      
        end
        else begin
        x1 <= y0[m-1]? x0 - y0:x0 + y0; //有符号数，最高位为符号位，是1表示<0
        y1 <= y0[m-1]? y0 + x0:y0 - x0; //有符号数，最高位为符号位，是0表示>0

        x2 <= y1[m-1]? x1 - (y1>>>1):x1 + (y1>>>1); 
        y2 <= y1[m-1]? y1 + (x1>>>1):y1 - (x1>>>1); 
    
       		x3 <= y2[m-1]? x2 - (y2>>>2):x2 + (y2>>>2); 
        y3 <= y2[m-1]? y2 + (x2>>>2):y2 - (x2>>>2); 
						
        x4 <= y3[m-1]? x3 - (y3>>>3):x3 + (y3>>>3); 
        y4 <= y3[m-1]? y3 + (x3>>>3):y3 - (x3>>>3); 
					
        x5 <= y4[m-1]? x4 - (y4>>>4):x4 + (y4>>>4); 
        y5 <= y4[m-1]? y4 + (x4>>>4):y4 - (x4>>>4);
						
        x6 <= y5[m-1]? x5 - (y5>>>5):x5 + (y5>>>5); 
        y6 <= y5[m-1]? y5 + (x5>>>5):y5 - (x5>>>5);
				
        x7 <= y6[m-1]? x6 - (y6>>>6):x6 + (y6>>>6); 
        y7 <= y6[m-1]? y6 + (x6>>>6):y6 - (x6>>>6); 
			
        x8 <= y7[m-1]? x7 - (y7>>>7):x7 + (y7>>>7); 
        y8 <= y7[m-1]? y7 + (x7>>>7):y7 - (x7>>>7); 
		
        x9 <= y8[m-1]? x8 - (y8>>>8):x8 + (y8>>>8); 
        y9 <= y8[m-1]? y8 + (x8>>>8):y8 - (x8>>>8); 

        x10 <= y9[m-1]? x9 - (y9>>>9):x9 + (y9>>>9); 
        y10 <= y9[m-1]? y9 + (x9>>>9):y9 - (x9>>>9);

        x11 <= y10[m-1]? x10 - (y10>>>10):x10 + (y10>>>10); 
        y11 <= y10[m-1]? y10 + (x10>>>10):y10 - (x10>>>10); 
			
        x12 <= y11[m-1]? x11 - (y11>>>11):x11 + (y11>>>11); 
        y12 <= y11[m-1]? y11 + (x11>>>11):y11 - (x11>>>11); 
					
        x13 <= y12[m-1]? x12 - (y12>>>12):x12 + (y12>>>12); 
        y13 <= y12[m-1]? y12 + (x12>>>12):y12 - (x12>>>12); 
						
        x14 <= y13[m-1]? x13 - (y13>>>13):x13 + (y13>>>13); 
        y14 <= y13[m-1]? y13 + (x13>>>13):y13 - (x13>>>13);   
			
        x15 <= y14[m-1]? x14 - (y14>>>14):x14 + (y14>>>14); 
        end
    end
        

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            c<= 0;
        else
        begin
            // c<= x15+(x15>>>1)+(x15>>>13)+(x15>>>6)+(x15>>>8)+(x15>>>9)+(x15>>>12)+(x15>>>15)+(x15>>>20)+(x15>>>22)+(x15>>>25);
            c <= (x15>>>1) + (x15>>>4) + (x15>>>5) + (x15>>>7) + (x15>>>8) + (x15>>>10) 
             +(x15>>>11) + (x15>>>12) + (x15>>>14) + (x15>>>17) + (x15>>>18) + (x15>>>19) 
             + (x15>>>21) + (x15>>>22) + (x15>>>24) + (x15>>>25) + (x15>>>27);
        end
    end
endmodule


