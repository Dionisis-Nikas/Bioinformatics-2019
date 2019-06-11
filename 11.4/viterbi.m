function [score,best_path] = viterbi(prob_init,A,B,x)

    N = size(A,1);
    M = size(B,1);
    T = length(x);
    C = zeros(N,T);
    pred = size(N,T);
    
    
    for i=1:N
        B(3,1)
        C(i,1) = log10(prob_init(i))+log10(B(x(1),i));
    end
    for t = 2:T
        for i = 1:N
            v = zeros(1,N);
            for p = 1:N
                v(p)= log10(C(p,t-1))+log10(A(p,i))+log10(B(x(t),i));
            end
            [index,C(i,t)] = max(v);
            pred(i,t) = index;
        end
    end
    
    %viterbi score
    [index,score] = max(C(:,T));
    t = T;
    best_path = [];
    while pred(index,t)~= 0,
        best_path = [best_path index];
        index = pred(index,t);
        t = t-1;
    end