function [maximum,best_path,second_path] = viterbi4(prob_init,A,B,x)

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
               
            end
           
            [C(i,t+1),index] = max(v);
           
            pred(i,t) = index;
           
        end
        
    end
    
   

    %viterbi score
    [maxscore,index] = max((C(:,T+1)));
    maximum = maxscore;
    pred(N,T) = index;
    t = T;
    best_path = [index];
    C
    while t~=0,
        [score,index] = max(vp(t,:,index));
        best_path = [index best_path];
        t = t-1;
        if t == 0,
            break
        end
    end
score = maximum;