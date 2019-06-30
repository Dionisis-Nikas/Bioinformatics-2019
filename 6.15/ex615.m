clear
clc
nucleo = fastaread('a-lactalbumin.txt');
seq = nucleo.Sequence;

player_win = []; %%if sequence is empty player1 wins 
player_win = [player_win 1 1];
player_moves = [1 2];
for i = 3:length(seq)
    if ~player_win(i-2)  %i - 2 nucleotides from the sequence
       player_win = [player_win 1];
       player_moves = [player_moves 2];
       moves = [];
   elseif ~player_win(i-1)  % i - 1 nucleotide from the sequence
       player_win = [player_win 1];
       player_moves = [player_moves 2];
       moves = [];
    else
       player_win = [player_win 0];
      
    end
    
        
end

if player_win(length(seq))
    disp("Player 1 wins!!")
else
    disp("Player 2 wins!!")
    
end

disp("Removig sequence was : ")
for i = 10:20
    disp("For length "+(i)+": ")
    if player_win(i)
    disp("Player 1 wins!! with moves: ")
    else
    disp("Player 2 wins!! with moves: ")
    end
    if i == 1
        disp(player_moves(i))
    elseif i == 2
        disp(player_moves(i:-1:2))
    elseif i == 3
        disp(player_moves(i-1:-1:1))
    elseif mod(i,2)==0
        disp(player_moves(i:-1:((i/2)+1)))
    elseif ~(mod(i,2)==0)
        disp(player_moves((i-(fix(i/2))):-1:1))
    end
    
end
