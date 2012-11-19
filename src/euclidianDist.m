function d=euclidianDist(p,o)
%---yeah well, euclidean distance ftw! screw bhattacharya...tried it, works
%same, period. can add in that function if needed. however, bhattacharya
%distance works only for normalised rgb. 
s=(p-o).^2;
s=sum(sum(sum(s)));
d=sqrt(s);
end