%%Following is the code for welch_periodogram PSD. It has inbuilt FFT and
%%averging
function fout = welch_period(y,M,D)
lt=floor(length(y)/(M-D));
m=zeros(lt+1,M);
for i=0:(lt)
    for j=1:M
        if(length(y)>=(i*(M-D)+j))
            m(i+1,j)=y(i*(M-D)+j);
        end
    end
end
win =  hamming_win(M,0);
out=zeros(lt,M);
for i=1:lt
    for j=1:M
        out(i,j) = m(i,j).*win(j);
    end
end

nw=fft(out',4096);
    
fout=mean((abs(fftshift(nw'))).^2);
size(fout);
end
function w = hamming_win(Nh,l)
n=0:Nh-1-l;
w=0.54+0.46*cos(2*pi*n/(Nh-1-l));
end

        
        