%Task 3: Low pass filter (Gaussian)

%It is possible to change th size of the filter
img_c = imread('CERATI.jpg');
img = rgb2gray(img_c);
img_n = imnoise(img,'gaussian');

lp_img3 = imgaussfilt(img,2,'FilterSize',3); %Desviación estándar = 2
lp_img_n3 = imgaussfilt(img_n,2,'FilterSize',3);

lp_img7 = imgaussfilt(img,2,'FilterSize',7);
lp_img_n7 = imgaussfilt(img_n,2,'FilterSize',7);

lp_img9 = imgaussfilt(img,2,'FilterSize',9);
lp_img_n9 = imgaussfilt(img_n,2,'FilterSize',9);

lp_img11 = imgaussfilt(img,2,'FilterSize',11);
lp_img_n11 = imgaussfilt(img_n,2,'FilterSize',11);

figure(1);
imshow(lp_img3); title('Img. sin ruido con Filtro Gaussiano 3x3');
figure(2);
imshow(lp_img_n3); title('Img. con ruido con Filtro Gaussiano 3x3');

figure(3);
imshow(lp_img7); title('Img. sin ruido con Filtro Gaussiano 7x7');
figure(4);
imshow(lp_img_n7); title('Img. con ruido con Filtro Gaussiano 7x7');

figure(5);
imshow(lp_img9); title('Img. sin ruido con Filtro Gaussiano 9x9');
figure(6);
imshow(lp_img_n9); title('Img. con ruido con Filtro Gaussiano 9x9');

figure(7);
imshow(lp_img11); title('Img. sin ruido con Filtro Gaussiano 11x11');
figure(8);
imshow(lp_img_n11); title('Img. con ruido con Filtro Gaussiano 11x11');
