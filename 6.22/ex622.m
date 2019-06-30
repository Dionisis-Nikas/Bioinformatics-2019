clear
clc
lysozyme = fastaread('lysozyme.txt');
nucleo = fastaread('a-lactalbumin.txt');

%%our sequences
seq1 = lysozyme.Sequence;
seq2 = nucleo.Sequence;
%seq1= 'GTAGGCTTAAGGTTA';
%seq1= 'TATATATGTAAAG';%prefix sequence
%seq2= 'AAATTT';%sufix sequence
if (strlength(seq2)>strlength(seq1)),
    temp = seq2;
    seq2 = seq1;
    seq1 = temp;
end

%%the scoring matrix for each letter in the form of:
%%     A C G T
%%   A 
%%   C
%%   G
%%   T

sm = [1 -1 -1 -1;
      -1 1 -1 -1;
      -1 -1 1 -1;
      -1 -1 -1 1];
  
tic;
count = 0;

%%add 1 to dimensions because we have the first empty block
m = strlength(seq1)+1; 
n = strlength(seq2)+1+(m-1-strlength(seq2));

max_time = ((n-1) * (m-1));

%%initialize our matrix with zeros
F = zeros(m,n);

blocks = [];


for i = 2:m
   for j = 2:n
       try
        F(i,j) = sm(nt2int(seq1(i-1)),nt2int(seq2(j-1)));
        catch
           F(i,j) = -1;
       end
   end
end

scores = [];
seqs1 = [];
seqs2 = [];
k = 2;
p =1;
for i = m:-1:2,
    score = 0;
    l = i; % el einai auto pou fainetai san 1
    letters1 = [];
    letters2 = [];
    for j = 2:k,
        score = score + F(l,j);
        try
            letters1 = [letters1 seq1(l-1)];
            letters2 = [letters2 seq2(j-1)];
        catch
            letters2 = [letters2 '-'];
        end
        l = l+1;
    end
    k = k+1;
    scores = [scores score];
    seqs1 =[seqs1 string(letters1)];
    seqs2 =[seqs2 string(letters2)];
end
toc
disp(newline)
%%end of matrix initialization
maximum = max(scores);
indexes = find(scores ==maximum);
final1 = [];
final2 = [];
for q = 1:length(indexes),
    final1 = [final1 seqs1(indexes(q))];
    final2 = [final2 seqs2(indexes(q))];
end
final = [final1 ; final2];

disp("The best sequences with the highest score of global-alignment are: ");
disp(final);
disp("With maximum score of: "+maximum);


