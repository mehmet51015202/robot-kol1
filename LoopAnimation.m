function turn = LoopAnimation (th1,th2,th3,turn) %#ok<*INUSD

% AN�MASYON B�LGES� �C�N BAGLANTILARIN ACILARINI VE DONUS SIRASINI ALIR
% "turn" DEGER�N� DONDURUR
% "Robotik Kol" �SLEV�YLE CAGIRILIYOR

    for_kin %HOMOJEN D�N�S�MLER� HESAPLAMAK �C�N �LER� K�NEMAT�K FONKS�YONUNU CAGIRIR.
    clc
    turn = turn + 1
% B�R�NC� JO�NT�N KONF�G�RASYON CERCEVES�
    rot = rotation(th1)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % th1 in rotation �
    x = 0; y = 0 ; z = 0; % ilk link in orijini
    DrawAxis(x,y,z,rot) % th1 in yap�land�rma cercevesi
% 2. a�� i�in yap�land�rma cercevesi
    origin = FIRST_TRANSFORMATION;
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th2 nin rotation �
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];
            DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) %th2 nin yap�land�rma cercevesi
% ROBOT KOL- B�R�NC� L�NK
    line([0 origin(1,4) 0],[0 origin(2,4) 0],[0 origin(3,4) 0],'color','k','linewidth',5) % birinci link
% 2. joint i�in konfig�rasyon cercevesi
    origin = FINAL_TRANSFORMATION; 
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th3 �n rotation �
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];  
    DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th4 �n yap�land�rma �er�evesi
% ROBOT KOL-�K�NC� L�NK
    line([FIRST_TRANSFORMATION(1,4) origin(1,4) origin(1,4)],[FIRST_TRANSFORMATION(2,4) ...
        origin(2,4) origin(2,4)],[FIRST_TRANSFORMATION(3,4) origin(3,4) origin(3,4)], ...
            'color','b','linewidth',5) % ikinci link
    pause(1/60)
    hold off

end