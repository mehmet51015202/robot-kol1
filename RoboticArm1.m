function RoboticArm
   % robot kolun sonlu aral���.
   % giri� argumanlar� al�nmayacak.
   % a��lar� baslat.
    
    th0 = 0 ; th1 = 0; th2 = 0; th3 = 0 ; %yeni ac�lar� oluaturduk.
    th1_old = 0; th2_old = 0; th3_old = 0 ;% onceki ac�lar� ilk d�n�s icin s�f�r yapt�k.
    
    pitch = 25; %animasyon penceresi icin yaz�ld�.
    figure(2)
    clf(2,'reset')
    hold on
% ILK ROBOT KOL-1. VE 2. BAGLANTI
    line([0 3 0],[0 0 0],[0 0 0],'color','k','linewidth',5) % birinci link
    line([2 5 5],[0 0 0],[0 0 0],'color','b','linewidth',5) % ikinci link
    grid
% birinci yap�land�rma cercevesi
    rot = rotation(th0)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % ilk karede d�n�s y�n� yok
    DrawAxis(0,0,0,rot) %ilk yap�land�rma cercevesi   
    pussEnd = false;
    
    % �LER� K�NEMAT�K ���N AN�MASYON
    while (pussEnd ~= true)
           th2_2 = th2;
           th3_2 = th3;
           turn = 0;
    % TH1 HAREKET� �C�N KOD
           if th1-th1_old ~= 0
             for th1 = linspace(th1_old,th1,pitch);
                       th2 = th2_old ; th3 = th3_old;
                       turn = LoopAnimation(th1,th2,th3,turn);
             end
           end
           grid
           th2 = th2_2;
    % TH2 HAREKET� �C�N KOD
           if th2-th2_old ~= 0
                for th2 = linspace(th2_old,th2,pitch);
                    th3 = th3_old;
                    turn = LoopAnimation(th1,th2,th3,turn);
                end
           end
           th3 = th3_2;
    %  TH3 HAREKET� �C�N KOD
           if th3-th3_old ~= 0
               for th3 = linspace(th3_old,th3,pitch);
                   turn = LoopAnimation(th1,th2,th3,turn);
               end
           end
           
    %pussEnd = true-- DAHA SONRA KULLANMAK �C�N
    % DAHA SONRAK� G�R�S ACILARI
    
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
