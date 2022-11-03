%Task 4: 
img_c = imread('CERATI.jpg');
img = rgb2gray(img_c);
img_n = imnoise(img,'gaussian');
%   a) De bloque [1 -1]
simple_block = [1 -1];
img_simple_block = convn(img,simple_block);
img_n_simple_block = convn(img_n,simple_block);
%   b) Prewitt ambas direcciones 
pw_x = [-1,0,1 ; -1,0,1; -1,0,1];
pw_y = [-1,-1,-1 ; 0,0,0; 1,1,1];
img_pw_x = imfilter(img,pw_x);
img_pw_nx = uint8(conv2(img_n,pw_x));
img_pw_y = imfilter(img,pw_y);
img_pw_ny = uint8(conv2(img_n,pw_y));
%   c)Sobel en ambas direcciones
s_x = [-1,0,1 ; -2,0,2; -1,0,1];
s_y = [-1,-2,-1 ; 0,0,0; 1,2,1];
img_s_x = imfilter(img,s_x);
img_s_nx = uint8(conv2(img_n,s_x));
img_s_y = imfilter(img,s_y);
img_s_ny = uint8(conv2(img_n,s_y));
%   d)Primera Derivada Gaussiana
N = 11; %5,7,11
r = 1;
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
%a)
figure(1);
imshow(img_simple_block); title('Im. sin ruido con filtro detector de borde de Bloque simple');

figure(1);
imshow(img_n_simple_block); title('Im. sin ruido con filtro detector de borde de Bloque simple');

%b)
figure(2);
imshow(img_pw_x); title('Im. sin ruido con filtro Prewitt dirección en x');

figure(3);
imshow(img_pw_nx); title('Im. con ruido con filtro Prewitt dirección en x');

figure(4);
imshow(img_pw_y); title('Im. sin ruido con filtro Prewitt dirección en y');

figure(5);
imshow(img_pw_ny); title('Im. con ruido con filtro Prewitt dirección en y');

%c)
figure(6);
imshow(img_s_x); title('Im. sin ruido con filtro Sobel dirección x');

figure(7);
imshow(img_s_nx); title('Im. con ruido con filtro Sobel dirección x');

figure(8);
imshow(img_s_y); title('Im. sin ruido con filtro Sobel dirección y');

figure(9);
imshow(img_s_ny); title('Im. con ruido con filtro Sobel dirección y');

%d)
figure(10);
imshow(img_pdg); title('Im. sin ruido con filtro detector de borde Primera Gaussiana orden 11x11');

figure(11);
imshow(img_pdg_n); title('Im. con ruido con filtro detector de borde Primera Gaussiana orden 11x11');