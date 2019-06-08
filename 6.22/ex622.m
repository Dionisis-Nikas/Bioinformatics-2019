clear
clc
lysozyme = fastaread('lysozyme.txt');
nucleo = fastaread('α-lactalbumin.txt');

seq1 = lysozyme.Sequence;
seq2 = nucleo.Sequence;
%seq1= 'TAGGCTTA'


sm = [1 -1 -1 -1;
      -1 1 -1 -1;
      -1 -1 1 -1;
      -1 -1 -1 1];
tic
count = 0
sub_sequences = [];
max_time = strlength(seq1) * strlength(seq2)
for i = 1:strlength(seq1),
    try
        for j = 0:strlength(seq2)-1
            sub.seq = seq1(i:i+strlength(seq2)+j);
            [Score, Alignment] = nwalign(sub.seq,seq2,'alpha', 'nt','scoringmatrix', sm, 'gapopen', 1);
            sub.score = Score;
            sub.Alignment = Alignment;
            sub_sequences = [sub_sequences sub];
            count = count +1;
            disp("Completed: "+count+"/"+max_time)
        end
    catch
        
    end
    
end
toc
scores = [sub_sequences.score];
[val,index] = max(scores);

count
sub_sequences(index).Alignment
sub_sequences(index).score

  
  

%[Score, Alignment] = nwalign('TAGGCTTA','TAGATA','alpha', 'nt','scoringmatrix', sm, 'gapopen', 1);
     