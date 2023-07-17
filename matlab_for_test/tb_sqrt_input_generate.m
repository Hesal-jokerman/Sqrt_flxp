clc
clear 
close all
warning off
currentFolder = pwd;
addpath(genpath(currentFolder));

data_lenth = 8192-8;

a_min = -10 ;
a_max = 10 - 1/(2^27);

b_min = -10 ;
b_max = 10 - 1/(2^27);

% a_min = -2 ;
% a_max = 2 - 1/(2^14);
% 
% b_min = -2 ;
% b_max = 2 - 1/(2^14);

a_rand = a_min+(a_max - a_min)*rand(1,data_lenth);
b_rand = b_min+(b_max - b_min)*rand(1,data_lenth);

% a_rand = a_rand./64;
% b_rand = b_rand./64;

a_boundary = [a_min a_min a_min a_min a_max a_max a_max a_max];
b_boundary = [b_min b_min b_min b_min b_max b_max b_max b_max];

a = [a_boundary a_rand];
b = [b_boundary b_rand];

quan_37Q27_pattern = quantizer('fixed' , 'round' , 'saturate',[37,27]);


a_37Q27 = quantize(quan_37Q27_pattern,a);
b_37Q27 = quantize(quan_37Q27_pattern,b);

c =abs(a_37Q27+1i*b_37Q27);

c_37Q27 = quantize(quan_37Q27_pattern,c);

a_integer = a_37Q27 *2^27 ;
b_integer = b_37Q27 *2^27 ;
c_integer = c_37Q27 *2^27 ;

a_complement = zeros (1,length(a_integer));
b_complement = zeros (1,length(b_integer));


for i = 1 : length(a_complement)
 if(a_integer(i) <0)
    a_complement(i) = 2^37 + a_integer(i) ;
 else
    a_complement(i) = a_integer(i) ;
 end
end

for i = 1 : length(b_complement)
 if(b_integer(i) <0)
    b_complement(i) = 2^37+ b_integer(i) ;
 else
    b_complement(i) = b_integer(i) ;
 end
end

fid_a = fopen( 'D:\A_job_project\Software\ic_test_bench\x_37Q27.txt' , 'w');
fprintf(fid_a,'%x\n' , a_complement);
fclose(fid_a);


fid_b = fopen( 'D:\A_job_project\Software\ic_test_bench\y_37Q27.txt' , 'w');
fprintf(fid_b,'%x\n' , b_complement);
fclose(fid_b);


fid_c = fopen( 'D:\A_job_project\Software\ic_test_bench\sqrt_xy_37Q27.txt' , 'w');
fprintf(fid_c,'%d\n' , c_integer);
fclose(fid_c);


