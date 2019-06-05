clear
clc
amino_acids = struct2cell(fastaread('amino.txt'));
for a = 1:length(amino_acids),
seq = cell2mat(aa2nt(amino_acids(2,a)));
%%seq = ['CCCCCCCCCCTAAAGGGGCCCCCTTTTTTTCC'] book example

newSeq = [];
counts = [0 0 0 0];
current = seq(1);
for i=2:length(seq),
    next = seq(i);
    if next ~= current,
        newSeq = [newSeq current];
        counts = resetCounts(next,counts);
        current = next;
    else,
        [counts,maxed,newSeq] = checkNext(next,counts,newSeq,current);
        if ~maxed && (i == length(seq)),
            newSeq = [newSeq current];
        end
    end
    
end
seq
newSeq
end

function countAGCT = resetCounts(next,counts)
letters = ['A' ,'C', 'G', 'T'];

for k = 1:length(letters),
    if next == letters(k),
       counts(k) = 1;
    else
       counts(k) = 0;
    end
end
countAGCT = [counts(1),counts(2),counts(3),counts(4)];

end

function [countAGCT,maxed,new] = checkNext(next,counts,seq,current)
letters = ['A' ,'C', 'G', 'T'];
for k = 1:length(letters),
    limits = [5, 10, inf, inf];
    if next == letters(k),
       counts(k) = counts(k) + 1;
       if counts(k) == limits(k),
           seq = [seq current];
           counts(k) = 0;
           maxed = true;
       else
           maxed = false;
       end
    end
end
new = seq;
countAGCT = [counts(1),counts(2),counts(3),counts(4)];
end