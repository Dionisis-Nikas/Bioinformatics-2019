clear 
clc
A = [ 0.5 0.5 0; 0.5 0.25 0.25; 0.25 0.5 0.25];
B = [ 1 0 0 0; 0 0.5 0.25 0.25; 0 0.25 0.5 0.25]';

A = [ 0.5 0.25 0.25; 0.25 0.5 0.25];
B = [  0.5 0.25 0.25; 0.25 0.5 0.25]';
katastaseis = ["start ","D1 ","D2 ","end"] ;
alphabet =['s','1','2','3'];
x = [1 1 2 1 2 2];
prob_init = [0.5;0.5];
seq = x;
[score,best_path] = viterbi6(prob_init,A,B,x);
best_path = fliplr(best_path);
disp("Best score was: "+score)
final = [];
for i=1:size(x,2),
    final = strcat(final, katastaseis(best_path(i)));
end
disp("Best path was: "+final)