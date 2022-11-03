%Práctica 4: Filtros espaciales
%Task 1: Noise
img_c = imread('CERATI.jpg');
img = rgb2gray(img_c);
img_n = imnoise(img,'gaussian');

%Task 2: Blurred filter
b_filter_3 = ones(3)/9;
b_filter_7 = ones(7)/49;
b_filter_9 = ones(9)/81;
b_filter_11 = ones(11)/121;

%Also we can use this form img_b_3 = imfilter(img,b_filter_3);
img_b_3 = uint8(convn(img,b_filter_3));
img_b_7 = uint8(convn(img,b_filter_7));
img_b_9 = uint8(convn(img,b_filter_9));
img_b_11 = uint8(convn(img,b_filter_11));

img_nb_3 = imfilter(img_n,b_filter_3);
img_nb_7 = imfilter(img_n,b_filter_7);
img_nb_9 = imfilter(img_n,b_filter_9);
img_nb_11 = imfilter(img_n,b_filter_9);

figure(1);
%subplot(2, 1, 1);
imshow(img); title('Imagen original');
figure(2);
%subplot(2, 1, 2);
imshow(img_b_3); title('Im. sin ruido con filtro PB orden 3x3');
figure(3);
%subplot(2, 1, 2);
imshow(img_b_7); title('Im. sin ruido con filtro PB orden 7x7');
figure(4);
%subplot(2, 1, 2);
imshow(img_b_9); title('Im. sin ruido con filtro PB orden 9x9');
figure(5);
%subplot(2, 1, 2);
imshow(img_b_11); title('Im. sin ruido con filtro PB orden 11x11');

figure(6);
%subplot(2, 1, 2);
imshow(img_nb_3); title('Im. con ruido con filtro PB orden 3x3');
figure(7);
%subplot(2, 1, 2);
imshow(img_nb_7); title('Im. con ruido con filtro PB orden 7x7');
figure(8);
%subplot(2, 1, 2);
imshow(img_nb_9); title('Im. con ruido con filtro PB orden 9x9');
figure(9);
%subplot(2, 1, 2);
imshow(img_nb_11); title('Im. con ruido con filtro PB orden 11x11');

figure(10);
%subplot(2, 1, 2);
imshow(img_n); title('Im. con ruido');