clear 
clc

A = [ 0.5 0.25 0.25; 0.25 0.5 0.25];
B = [ 0.5 0.25 0.25; 0.25 0.5 0.25]';



katastaseis = ["start ","D1 ","D2 ","end"] ;
x = [1 1 2 1 2 2];
prob_init = [0.5;0.5];
seq = x;
[maximum,best_path,second_path] = viterbi6(prob_init,A,B,x); %function
best_path = fliplr(best_path);
second_path = fliplr(second_path);
disp("Best score was: "+maximum)
final = [];
for i=1:size(x,2),
    final = strcat(final, katastaseis(best_path(i)+1));
end
disp("Best path was: "+final)

final = [];
for i=1:size(x,2),
    final = strcat(final, katastaseis(second_path(i)+1));
end
disp("Best second path was: "+final)