clear 
clc
A = [0.9 0.1; 0.1 0.9];
B = [0.4 0.1 0.4 0.1; 0.2 0.3 0.2 0.3;];
katastaseis = ['a','b'] ;

x = nt2int('GGCT');
prob_init = [0.5; 0.5];
seq = [x];
hmmviterbi(seq,A,B)
[score,best_path,second] = viterbi6(prob_init,A,B,x);
best_path = fliplr(best_path);
disp("Best score was: "+score)
final = '';
for i=1:size(x,2),
    final = [final  katastaseis(best_path(i))];
end
disp("Best path was: "+final)
