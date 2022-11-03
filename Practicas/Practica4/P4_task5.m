%Task 5
img_c = imread('CERATI.jpg');
img = rgb2gray(img_c);
img_n = imnoise(img,'gaussian');

%   a) Laplaciano 3x3
delta = [0 0 0; 0 1 0; 0 0 0];
hp = ones(3)/9;
MxH = delta - hp;
img_l = conv2(img,MxH);
img_ln = conv2(img_n,MxH);
%   b)
N = 7; %5,7,11
r = 2;
vec = [];

% %------------caso base--------------
if N-r >= 0
    vec(1) = factorial(N-r) / factorial(N-r);
else
    vec(1) = 0;
end
% %----------------------------------

for x = 1:N
    if N-r >=0 && (N-r)-x >= 0
       f1 = factorial(N-r) / (factorial(x) * factorial((N-r)-x));
    else
        f1 = 0;
    end
    
    if N-r >=0 && x-r>= 0 && (N-r)-(x-r) >= 0
        f2 = factorial(N-r) / (factorial(x-r) * factorial((N-r)-(x-r)));
    else
        f2 = 0;
    end
    vec(x+1) = f1-f2;
end

img_pdg = convn(img,vec);
img_pdg_n = convn(img_n,vec);

figure(1);
imshow(img_l); title('Im. sin ruido con Filtro Laplaciano');
figure(2);
imshow(img_ln); title('Im. con ruido con Filtro Laplaciano');
figure(3);
imshow(img_pdg); title('Im. sin ruido con filtro detector de borde Segunda Gaussiana orden 7x7');
figure(4);
imshow(img_pdg_n); title('Im. con ruido con filtro detector de borde Segunda Gaussiana orden 7x7');