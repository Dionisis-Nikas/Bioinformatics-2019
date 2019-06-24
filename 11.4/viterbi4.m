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
    P = (log2([0.5 0.125 0.03125 0.00390625 0.0009765625 0.0001220703125 0.000007629394531; ...
              0.5 0.0625 0.015625 0.00390625 0.00048828125 0.0001220703125 0.000015258789062]));
    P2 = (log2([0.5 0.18 0.648 0.05832 0.0052488 ; ...
                0.5 0.09 0.0162 0.00648 0.0017496 ]));
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
               % if t == T,
               % v(p)= C(p,t)+A(p,L)+B(x(t),p);
               % endscore(p) = v(p);
               % end
            end
           % if t~=T,
            [C(i,t+1),index] = max(v);
           
            pred(i,t) = index;
           % end
        end
        
    end
    
   % for i= 1:N,
   %     C(i,T+1)= endscore(i);
   % end

    %viterbi score
    [maxscore,index] = max((C(:,T+1)));
    maximum = maxscore;
    pred(N,T) = index;
    t = T;
    best_path = [index];
    C
    while t~=0,
        [score,index] = max(vp(t,:,index))
        best_path = [best_path index];
        t = t-1;
        if t == 0,
            break
        end
    end
score = maximum;