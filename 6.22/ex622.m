clear
clc
lysozyme = fastaread('lysozyme.txt');
nucleo = fastaread('α-lactalbumin.txt');
seq1 = nucleo.Sequence;
seq2 = lysozyme.Sequence;


sm = [1 -1 -1 -1;
      -1 1 -1 -1;
      -1 -1 1 -1;
      -1 -1 -1 1];

% Use the ScoringMatrix and GapOpen properties when returning
% information about the top three local alignments.
struct4 = localalign('GTAGGCTTAAGGTTA', 'TAGATA', 'alpha', 'nt','scoringmatrix', sm, 'gapopen', 20, 'numaln', 3);
[Score, Alignment] = nwalign('GTAGGCTTAAGGTTA','TAGATA','alpha', 'nt','scoringmatrix', sm, 'gapopen', 1)
     
     