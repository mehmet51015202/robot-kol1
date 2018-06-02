function turn = LoopAnimation (th1,th2,th3,turn) %#ok<*INUSD

% ANÝMASYON BÖLGESÝ ÝCÝN BAGLANTILARIN ACILARINI VE DONUS SIRASINI ALIR
% "turn" DEGERÝNÝ DONDURUR
% "Robotik Kol" ÝSLEVÝYLE CAGIRILIYOR

    for_kin %HOMOJEN DÖNÜSÜMLERÝ HESAPLAMAK ÝCÝN ÝLERÝ KÝNEMATÝK FONKSÝYONUNU CAGIRIR.
    clc
    turn = turn + 1
% BÝRÝNCÝ JOÝNTÝN KONFÝGÜRASYON CERCEVESÝ
    rot = rotation(th1)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % th1 in rotation ý
    x = 0; y = 0 ; z = 0; % ilk link in orijini
    DrawAxis(x,y,z,rot) % th1 in yapýlandýrma cercevesi
% 2. açý için yapýlandýrma cercevesi
    origin = FIRST_TRANSFORMATION;
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th2 nin rotation ý
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];
            DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) %th2 nin yapýlandýrma cercevesi
% ROBOT KOL- BÝRÝNCÝ LÝNK
    line([0 origin(1,4) 0],[0 origin(2,4) 0],[0 origin(3,4) 0],'color','k','linewidth',5) % birinci link
% 2. joint için konfigürasyon cercevesi
    origin = FINAL_TRANSFORMATION; 
    rot = [origin(1,1) origin(1,2) origin(1,3);     %th3 ün rotation ý
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];  
    DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % th4 ün yapýlandýrma çerçevesi
% ROBOT KOL-ÝKÝNCÝ LÝNK
    line([FIRST_TRANSFORMATION(1,4) origin(1,4) origin(1,4)],[FIRST_TRANSFORMATION(2,4) ...
        origin(2,4) origin(2,4)],[FIRST_TRANSFORMATION(3,4) origin(3,4) origin(3,4)], ...
            'color','b','linewidth',5) % ikinci link
    pause(1/60)
    hold off

end