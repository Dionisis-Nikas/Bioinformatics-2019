clear 
clc
A = [0.9 0.1; 0.9 0.1];
B = [0.4, 0.4, 0.1, 0.1; 0.2, 0.2, 0.3, 0.3;];
x = nt2int('GGCT');
prob_init = [0.5; 0.5];
[score,bect_path] = viterbi(prob_init,A,B,x)