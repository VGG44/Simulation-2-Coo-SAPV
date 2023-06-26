function [ONOFF] = aleafoto(TTF,TTR)
hT=0;
hF=0;
hR=0;
nTTF = 0;
hTTF = 0;
nTTR = 0;
hTTR = 0;

onoff = zeros([8760 1]);

while hT<8760

    nTTF = randi([1, 100]);
    hTTF = TTF(nTTF);
    hF = round(hTTF);

    for n = 1:hF
        onoff(hT+n) = 1;
    end
    hT=hT+hF;

    nTTR = randi([1, 100]);
    hTTR = TTR(nTTR);
    hR = round(hTTR);

    for i = 1:hR
        onoff(hT+i) = 0;
    end
    hT=hT+hR;

end

ONOFF = onoff(1:8760);