[Bx,By,Bz] = deal(zeros(9,7));

phi = linspace(0,pi,7);
psi = linspace(0,pi,9);
Bx(1,:) = 1+sin(phi);
By(1,:) = -cos(phi);
Bx(9,:) = -1-sin(phi);
By(9,:) = -cos(phi);
Bx(:,1) = cos(psi);
By(:,1) = -1;

Bz(:,1) = sin(psi);
Bx(:,7) = cos(psi);
By(:,7) = 1;
Bz(:,7) = sin(psi);

mesh(Bx, By, Bz,  'FaceColor', 'None');
%Kontrolne tocke Coonsove ploskve:
%  (1+4*0.28)/4
Bx = fillsqare(Bx, -0.23, (1+4*0.23)/4);
By = fillsqare(By, -0.23, (1+4*0.23)/4);
Bz = fillsqare(Bz, -0.23, (1+4*0.23)/4);


%Tocke na ploskvi:
u = linspace(0,1,100);
v = linspace(0,1,100);

[bx, by, bz] = bezier2(Bx,By,Bz,u,v);

%graf
surf(bx, by, bz); %nariše krivuljo na sliki oziroma vkrivljeno ploskev majhnih pravokotničkov, ki se ne prilegajo popolnoma funkciji mesh
hold on
mesh(Bx, By, Bz, 'FaceColor', 'None');  %prozorne pravokotnike naredi v pravi obliki
hold on
