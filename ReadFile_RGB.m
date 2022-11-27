
ImgRead=imread('pokerCards.jpg');
ImgR=ImgRead(:,:,1);
ImgG=ImgRead(:,:,2);
ImgB=ImgRead(:,:,3);

HistR=imhist(ImgR);
HistG=imhist(ImgG);
HistB=imhist(ImgB);


subplot(2,2,1), imshow(ImgRead)
subplot(2,2,2), plot(HistR)
subplot(2,2,3), plot(HistG)
subplot(2,2,4), plot(HistB)