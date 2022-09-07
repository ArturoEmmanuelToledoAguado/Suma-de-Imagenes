clc;
clear all;
close all;

%Extraccion  de la imagenes
img1=imread('IMG/1.jpg');
img2=imread('IMG/2.jpg');

%Mostramos originales
figure()
imshow(img1)
title('Imagen Original 1')
figure()
imshow(img2)
title('Imagen Original 2')

%Tamanos
[f1 c1]=size(img1);
[f2 c2]=size(img2);

%Comparación para reajuste
if (f1<f2) || (c1/3<c2/3)
    img1r=imresize(img1,[f2 c2/3]);
    figure()
    imshow(img1r)
    title('Imagen Redimensionada')
    %Mostramos las 2 formas
    figure()
    %A mano
    imgSum=SImg(img2,img1r);
    imgSum2=SImg(img1r,img2);
    subplot(2,2,1)
    imshow(imgSum)
    title('Original 2 con Redimension de 1')
    subplot(2,2,2)
    imshow(imgSum2)
    title('Redimension de 1 con Original 2')
    %Funcion imadd
    imgSum3=imadd(img2,img1r);
    imgSum4=imadd(img1r,img2);
    subplot(2,2,3)
    imshow(imgSum3)
    title('imadd(Original 2, Redimension 1)')
    subplot(2,2,4)
    imshow(imgSum4)
    title('imadd(Redimension 1,Original 2)')
else
    img2r=imresize(img2, [f1 c1/3]);
    figure()
    imshow(img2r)
    title('Imagen Redimensionada')
    %Mostramos las 2 formas
    figure()
    %A mano
    imgSum=SImg(img2r,img1);
    imgSum2=SImg(img1,img2r);
    subplot(2,2,1)
    imshow(imgSum)
    title('Redimension de 2 con Original 1')
    subplot(2,2,2)
    imshow(imgSum2)
    title('Original 1 con Redimension de 2')
    %Funcion imadd
    imgSum3=imadd(img2r,img1);
    imgSum4=imadd(img1,img2r);
    subplot(2,2,3)
    imshow(imgSum3)
    title('imadd(Redimension 2, Original 1)')
    subplot(2,2,4)
    imshow(imgSum4)
    title('imadd(Original 1, Redimension 2)')
end

%Suma a manita
function imgSum = SImg(img1,img2)
    imgSum=img1+img2;
end