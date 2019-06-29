clear
clc
nucleo1 = fastaread('brain.txt');
nucleo2 = fastaread('liver.txt');

seq1 = nucleo1.Sequence;
seq2 = nucleo2.Sequence;

n = strlength(seq1);
m = strlength(seq2);

disp("Game has started with Player 1 (random play) and Player 2 (tactic play)");
prompt = "Please select who plays first, please type the player number (1/2): ";

choice = input(prompt);

while (choice ~= 1 ) && (choice ~= 2),
    choice = input(prompt);
end
disp("Initial sequences : " +newline+ seq1 +newline+ seq2+newline);


while (m~=0) && (n~=0),
    if choice == 1,
        disp("Player 1 made a move");
        [seq1,seq2] = Player1(seq1,seq2,m,n);
        disp("New sequences: "+newline+ seq1 +newline+ seq2 +newline);
        choice = 2;
    else,
        disp("Player 2 made a move");
        [seq1,seq2] = Player2(seq1,seq2,m,n);
        disp("New sequences: "+newline+ seq1 +newline+ seq2+newline);
        choice = 1;
    end
    m = strlength(seq1);
    n = strlength(seq2);
end

if choice == 1,
    disp("Player 2 made the last move and won");
else,
    disp("Player 1 made the last move and won");
end


function [new_seq1,new_seq2] = Player1(seq1,seq2,m,n)
    if m == n,
        for i = 1:m,
            seq1 = seq1(2:end);
            seq2 = seq2(2:end);
        end
    elseif n == 0,
        for i = 1 :n,
            seq2 = seq2(2:end);
        end
    elseif m == 0,
        for i = 1 :m,
            seq1 = seq1(2:end);
        end
    else,
        c = randi([1 3],1);
        if c == 1,
            num = randi([1 min(m,n)],1);
            for i = 1:num,
                seq1 = seq1(2:end);
                seq2 = seq2(2:end);
            end
        elseif c == 2,
            num = randi([1 m],1);
            for i = 1:num,
                seq1 = seq1(2:end);
            end
        else
            num = randi([1 n],1);
            for i = 1:num,
                seq1 = seq2(2:end);
            end
        end
    end
new_seq1 = seq1;
new_seq2 = seq2;

end

function [new_seq1,new_seq2] = Player2(seq1,seq2,m,n)
    if m == n,
        for i = 1:m,
            seq1 = seq1(2:end);
            seq2 = seq2(2:end);
        end
    elseif n == 0,
        for i = 1 :n,
            seq2 = seq2(2:end);
        end
    elseif m == 0,
        for i = 1 :m,
            seq1 = seq1(2:end);
        end
    else,
        c = randi([1 3],1);
        if c == 1,
            num = randi([1 min(m,n)],1);
            for i = 1:num,
                seq1 = seq1(2:end);
                seq2 = seq2(2:end);
            end
        elseif c == 2,
            num = randi([1 m],1);
            for i = 1:num,
                seq1 = seq1(2:end);
            end
        else
            if(loseProb(m-1,n)),
                seq1 = seq1(2:end);
            elseif(loseProb(m,n-1)),
                seq2 = seq2(2:end);
            else
                seq1 = seq1(2:end);
                seq2 = seq2(2:end);
            end
        end
    end
new_seq1 = seq1;
new_seq2 = seq2;

end

function loser = loseProb(m,n)
    if m == n,
        loser = 0;
    elseif m ==0 && n>0,
        loser = 0;
    elseif n == 0 && m >0
        loser = 0;
    else
        loser = 1;
    end
end