clc;clear;fclose all;

filename1 = 'test_mat_file_a_1000_1.mat';
filename2 = 'test_mat_file_a_2000_1.mat';
outname1 = 'testdump_a_1000_1.txt';
outname2 = 'testdump_a_2000_1.txt';
comparename = 'test_compare.txt';
byteoffset = 0;
comparefile(filename1,filename2,outname1,outname2,comparename,byteoffset)

