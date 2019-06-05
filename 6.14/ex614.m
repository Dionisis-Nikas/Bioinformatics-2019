clear
clc
options = ["brain", "liver", "muscle"];
prompt = 'Please select two of the available nucleotides: brain, liver and muscle \n Type 1,2 or 3 accordingly with brackets (ex. [1 2])\n'; 
type = [input(prompt)];
while (type <= 0) | ((type > 3) | (~length(type) == 2)%%if type smaller than 0 or type bigger than 3 or input was 3 numbers
 prompt = 'Please select two of the available nucleotides: brain, liver and muscle\n Type 1,2 or 3 accordingly with coma (ex. [1 2])\n \n'; 
 type = [input(prompt)];
end
nucleo1 = fastaread(options(type(1))+'.txt');
nucleo2 = fastaread(options(type(2))+'.txt');

seq1 = nucleo1.Sequence;
seq2 = nucleo2.Sequence;

win_combos = []

for i=0:length(seq1),
    for j = 0:length(seq2),
        if((i-1 >= 0) && (j-2 >= 0)) | ((i-2 >= 0) && (j-1 >= 0)), %we can remove elements from both sequences as desribed
            
        else, %player won
            win_combos = [win_combos; [i j]]
        end
    end
end
