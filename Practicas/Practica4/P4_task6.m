%Task 6
img_c = imread('CERATI.jpg');
img = rgb2gray(img_c);
img_n = imnoise(img,'gaussian');

b_filter_5 = ones(5)/25;
img_b_5 = uint8(convn(img,b_filter_5));
img_bn_5 = uint8(convn(img_n,b_filter_5));

delta = [0 0 0; 0 1 0; 0 0 0];

%Adjust same sizes
img_b_5 = imresize(img_b_5,size(img));
img_bn_5 = imresize(img_bn_5,size(img));

%   a) LPF order 3x3 y 7x7 (Block)
% Unsharp Masking Filter(Hum) with LPF 3x3 (Block)
k = 3; 
b_filter_3 = ones(3)/9;
Flpf = uint8(convn(img_b_5,b_filter_3));
Flpf = imresize(Flpf,size(img_b_5));%Resize tamaño
img_um3 = img_b_5 + k*(img_b_5-Flpf);

Flpf_n = uint8(convn(img_bn_5,b_filter_3));
Flpf_n = imresize(Flpf_n,size(img_b_5));%Resize tamaño
img_um3_n = img_bn_5 + k*(img_bn_5-Flpf_n);

figure(1);
imshow(img_b_5); title('Im. sin ruido con filtro suavizador 5x5');
figure(2);
imshow(img_bn_5); title('Im. con ruido con filtro suavizador 5x5');
figure(3);
imshow(img_um3); title('Im. sin ruido: Realce filtro de bloque 3x3');
figure(4);
imshow(img_um3_n); title('Im. con ruido: Realce filtro de bloque 3x3');

%Unsharp Masking Filter(Hum) with LPF 7x7
b_filter_7 = ones(7)/49;
Flpf_7 = uint8(convn(img_b_5,b_filter_7));
Flpf_7 = imresize(Flpf_7,size(img));%Resize tamaño
img_um7 = img_b_5 + k*(img_b_5-Flpf_7);

Flpf_7_n = uint8(convn(img_bn_5,b_filter_7));
Flpf_7_n = imresize(Flpf_7_n,size(img));%Resize tamaño
img_um7_n = img_bn_5 + k*(img_bn_5-Flpf_7_n);

figure(5);
imshow(img_um7); title('Im. sin ruido: Realce filtro de bloque 7x7');
figure(6);
imshow(img_um7_n); title('Im. con ruido: Realce filtro de bloque 7x7');

%   b)LPF order 3x3 y 7x7 (binomial)
%Unsharp Masking Filter(Hum) with LPF 3x3 (Binomial)

Flpf_3b=imgaussfilt(img_b_5,2,'FilterSize',3);%Desviación estándar = 2
Flpf_3b = imresize(Flpf_3b,size(img));%Resize tamaño
img_um3b = img_b_5 + k*(img_b_5-Flpf_3b);

Flpf_3bn=imgaussfilt(img_bn_5,2,'FilterSize',3);%Desviación estándar = 2
Flpf_3bn = imresize(Flpf_3bn,size(img));%Resize tamaño
img_um3bn = img_bn_5 + k*(img_bn_5-Flpf_3bn);

figure(7);
imshow(img_um3b); title('Im. sin ruido: Realce filtro Binomial 3x3');
figure(8);
imshow(img_um3bn); title('Im. con ruido: Realce filtro Binomial 3x3');

%Unsharp Masking Filter(Hum) with LPF 7x7 (Binomial)
Flpf_7b=imgaussfilt(img_b_5,2,'FilterSize',7);
Flpf_7b = imresize(Flpf_7b,size(img));%Resize tamaño
img_um7b = img_b_5 + k*(img_b_5-Flpf_7b);

Flpf_7bn=imgaussfilt(img_bn_5,2,'FilterSize',7);
Flpf_7bn = imresize(Flpf_7bn,size(img));%Resize tamaño
img_um7bn = img_bn_5 + k*(img_bn_5-Flpf_7bn);

figure(9);
imshow(img_um7b); title('Im. sin ruido: Realce filtro Binomial 7x7');
figure(10);
imshow(img_um7bn); title('Im. con ruido: Realce filtro Binomial 7x7');

% L = 6;
% num7 = factorial(L);
% pascal7 = [];
% %------------caso base--------------
% den7 = factorial(0) * factorial(L-0);
% coc7 = num7 / den7;
% pascal7(1) = coc7;
% %----------------------------------
% for i = 1:L
%    den7 = factorial(i) * factorial(L-i);
%    coc7 = num7 / den7;
%    pascal7(i+1) = coc7;
% end
% pascal7_t= transpose(pascal7);
% filter7 = conv2(pascal7_t,pascal7)/L^2;
