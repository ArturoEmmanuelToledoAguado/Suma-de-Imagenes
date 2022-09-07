clc;
clear all;
close all;

%Extraccion  de la imagenes
img1=imread('IMG/1.jpg');
img2=imread('IMG/2.jpg');

%Mostramos originales
figure()
imshow(img1)
title('Imagen Original')
figure()
imshow(img2)
title('Imagen Original')

%Tamanos
[f1 c1]=size(img1);
[f2 c2]=size(img2);

%Comparación para reajuste
if (f1<f2) || (c1/3<c2/3)
    img1r=imresize(img1,[f2 c2/3]);
    figure()
    imshow(img1r)
    title('Imagen Redimensionada')
else
    img2r=imresize(img2, [f1 c1/3]);
    figure()
    imshow(img2r)
    title('Imagen Redimensionada')
end
