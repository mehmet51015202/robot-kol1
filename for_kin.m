a2 = 3; a3 = 2; % linklerin uzunlugu

rot_z0_th1 = rotation(th1) * [ 1 0 0 ; 0 0 1 ; 0 -1 0 ];  % TH1 rotation ý
rot_z1_th2 = rotation(th2) * eye(3) ;                     % TH2 rotation ý
rot_z2_th3 = rotation(th3) *eye(3);                       % TH3 rotation I

p1 = [ 0 ; 0 ; 0 ];                             % BÝRÝNCÝ JOÝNT POZÝSYONU 
p2 = [a2*cos(th2) ; -a2*sin(th2) ; 0 ];         % ÝKÝNCÝ JOÝNT POZÝSYONU 
p3 = [a3*cos(th3+th2) ; -a3*sin(th3+th2) ; 0 ]; % ÜCÜNCÜ JOÝNT POZÝSYONU 

HT_1 = homogeneous(rot_z0_th1,p1);
HT_2 = homogeneous(rot_z1_th2,p2);
HT_3 = homogeneous(rot_z2_th3,p3);

FIRST_TRANSFORMATION = HT_1*HT_2
FINAL_TRANSFORMATION = HT_1*HT_2*HT_3
FT = FINAL_TRANSFORMATION;

x = [FT(1,1) FT(2,1) FT(3,1)]; 
y = [FT(1,2) FT(2,2) FT(3,2)]; 
z = [FT(1,3) FT(2,3) FT(3,3)];
