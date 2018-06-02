function H = homogeneous(rot, pos)

% HOMOJEN DÖNÜSÜM
% ROBOT KOLUN DÖNÜSÜNÜ VE POZÝSYONU GÝRÝNÝZ

H = [ rot pos ; 0 0 0 1];
end
