%Following is the blackman_tukey. FFT has to be applied in the main
%function.
function out = blackman_tukey(y,l)
corr= unbiased_cross_corr(y,y,l);
win =  hamming_win(length(y),l);
out =corr.*win;
end
function r = unbiased_cross_corr(x,y,l)
N=length(x);
r=zeros(1,N-l);
    for n=1:N-l;
    r(n) = x(n).*y(n+l);
    r(n)=r(n)*(1/(N-l));
    end
end

function w = hamming_win(Nh,l)
n=0:Nh-1-l;
w=0.54+0.46*cos(2*pi*n/(Nh-1-l));
end

