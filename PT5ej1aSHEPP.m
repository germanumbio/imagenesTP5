SHEPPhead=phantom('Modified Shepp-Logan');
%J = imnoise(I,'gaussian',m,var_gauss) añade ruido blanco gaussiano con media y varianza.mvar_gauss
noiseGAUSS1=imnoise(SHEPPhead, 'gaussian',0,0.002);
%J = imnoise(I,'salt & pepper',d) adds salt and pepper noise, where d is the noise density. 
% This affects approximately d*numel(I) pixels.

noiseSP2=imnoise(noiseGAUSS1,'salt & pepper',0.01);
noiseSP3=imnoise(noiseGAUSS1,'salt & pepper',0.03);

%maximo, minimo y Dev Sta sobre imagenes 
GAUSmax1=max(noiseGAUSS1(:))
GAUSmin1=min(noiseGAUSS1(:))
GAUSstd1=std(noiseGAUSS1(:))

SPmax2=max(noiseSP2(:))
SPmin2=min(noiseSP2(:))
SPstd2=std(noiseSP2(:))

SPmax3=max(noiseSP3(:))
SPmin3=min(noiseSP3(:))
SPstd3=std(noiseSP3(:))

SNR_1=10*log10((GAUSmax1-GAUSmin1)./GAUSstd1)
SNR_2=10*log10((SPmax2-SPmin2)./SPstd2)
SNR_3=10*log10((SPmax3-SPmin3)./SPstd3)


figure('Name','SNR','NumberTitle','off');
subplot(2,2,1), imshow(SHEPPhead, []), title('Fantoma SHEPP-LOGAN sin ruido'), hold on;
subplot(2,2,2),imshow(noiseGAUSS1, []), title(['Ruido Gauss 0.2% SNR=',num2str(SNR_1)]), hold on;
subplot(2,2,3),imshow(noiseSP2, []), title(['R. Gauss + SP 1% SNR=',num2str(SNR_2)]), hold on;
subplot(2,2,4),imshow(noiseSP3, []), title(['R. Gauss + SP 3% SNR=',num2str(SNR_3)]), hold on;


