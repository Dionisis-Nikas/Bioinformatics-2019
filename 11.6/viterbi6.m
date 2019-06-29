function [maximum,best_path,second_path] = viterbi6(prob_init,A,B,x)

    N = size(A,1);
    M = size(B,1);
    T = length(x);
    C = zeros(N,T);
    pred = size(N,T);
    L = size(A,2);
    prob_init = log2(prob_init);
    A = log2(A);
    B = log2(B);
    
    for i=1:N
        C(i,1) = prob_init(i);
        
    end
    vp = zeros(T,N,2);
    endscore=zeros(1,N);
    for t = 1:T
        
        for i = 1:N
            v = zeros(1,N);
            for p = 1:N
                v(p)= C(p,t)+A(p,i)+B(x(t),p);
                vp(t,p,i) = v(p);
                if t == T,
                v(p)= C(p,t)+A(p,L)+B(x(t),p);
                endscore(p) = v(p);
                end
            end
            if t~=T,
            [C(i,t+1),index] = max(v);
           
            pred(i,t) = index;
            end
        end
        
    end
    
    for i= 1:N,
        C(i,T+1)= endscore(i);
    end

    %viterbi score
    [maxscore,index] = max((C(:,T+1)));
    maximum = maxscore;
    pred(N,T) = index;
    t = T-1;
    t = T;
    best_path = [index];
    second_path = [index];
    second_index = index;
    while t~=0,
        [score,index] = max(vp(t,:,index));
        best_path = [best_path index];
        
        if (vp(t,1,second_index) == vp(t,2,second_index));
                second_path = [second_path 2];
                second_index = 2;
        else,
            [score,second_index] = max(vp(t,:,second_index));
            second_path = [second_path second_index];
        end
        t = t-1;
        if t == 0,
            break
        end
    end
score = maximum;