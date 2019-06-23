function [score,best_path] = viterbi6(prob_init,A,B,x)

    N = size(A,1);
    M = size(B,1);
    T = length(x);
    C = zeros(N,T);
    pred = size(T);
    
    prob_init = log2(prob_init);
    A = log2(A);
    B = log2(B);
    for i=1:N
        C(i,1) = prob_init(i) + B(x(1),i);
    end
    [score,pred(1)] = max(C(:,1));
    for t = 2:T
        for i = 1:N
            v = zeros(1,N);
            for p = 1:N
                v(p)= C(p,t-1)+A(p,i)+B(x(t)+1,i);
            end
            [C(i,t),index] = max(v); 
        end
        [score,pred(t)] = max(C(:,t));
    end
    
    disp(C) 
    %viterbi score
    [score,index] = max((C(:,T)));
    t = T;
    best_path = [];
    while t~=0,
        index = pred(t);
        best_path = [best_path index];
        t = t-1;
    end