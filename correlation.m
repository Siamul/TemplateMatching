function [ corrcoeff ] = correlation( A, B )
C = A.*B;
dAB = sum(C(:));
Asq = A.*A;
Bsq = B.*B;
sqrtAsqBsq = sqrt(sum(Asq(:))*sum(Bsq(:)));
if sqrtAsqBsq == 0
    corrcoeff = 0;
else
    corrcoeff = dAB/sqrtAsqBsq;
end
end

