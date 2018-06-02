function RoboticArm
   % robot kolun sonlu aralýðý.
   % giriþ argumanlarý alýnmayacak.
   % açýlarý baslat.
    
    th0 = 0 ; th1 = 0; th2 = 0; th3 = 0 ; %yeni acýlarý oluaturduk.
    th1_old = 0; th2_old = 0; th3_old = 0 ;% onceki acýlarý ilk dönüs icin sýfýr yaptýk.
    
    pitch = 25; %animasyon penceresi icin yazýldý.
    figure(2)
    clf(2,'reset')
    hold on
% ILK ROBOT KOL-1. VE 2. BAGLANTI
    line([0 3 0],[0 0 0],[0 0 0],'color','k','linewidth',5) % birinci link
    line([2 5 5],[0 0 0],[0 0 0],'color','b','linewidth',5) % ikinci link
    grid
% birinci yapýlandýrma cercevesi
    rot = rotation(th0)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % ilk karede dönüs yönü yok
    DrawAxis(0,0,0,rot) %ilk yapýlandýrma cercevesi   
    pussEnd = false;
    
    % ÝLERÝ KÝNEMATÝK ÝÇÝN ANÝMASYON
    while (pussEnd ~= true)
           th2_2 = th2;
           th3_2 = th3;
           turn = 0;
    % TH1 HAREKETÝ ÝCÝN KOD
           if th1-th1_old ~= 0
             for th1 = linspace(th1_old,th1,pitch);
                       th2 = th2_old ; th3 = th3_old;
                       turn = LoopAnimation(th1,th2,th3,turn);
             end
           end
           grid
           th2 = th2_2;
    % TH2 HAREKETÝ ÝCÝN KOD
           if th2-th2_old ~= 0
                for th2 = linspace(th2_old,th2,pitch);
                    th3 = th3_old;
                    turn = LoopAnimation(th1,th2,th3,turn);
                end
           end
           th3 = th3_2;
    %  TH3 HAREKETÝ ÝCÝN KOD
           if th3-th3_old ~= 0
               for th3 = linspace(th3_old,th3,pitch);
                   turn = LoopAnimation(th1,th2,th3,turn);
               end
           end
           
    %pussEnd = true-- DAHA SONRA KULLANMAK ÝCÝN
    % DAHA SONRAKÝ GÝRÝS ACILARI
    
           prompt = 'Input th1 \n';
           th1_old = th1;
           th1 = input(prompt);           
           clc
           prompt = 'Input th2 \n';
           th2_old = th2;
           th2 = input(prompt);     
           clc           
           prompt = 'Input th3 \n';
           th3_old = th3;
           th3 = input(prompt);
           clc
           
      end
end
