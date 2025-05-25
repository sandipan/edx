function odefun = hareLynx(t, x, a)
    H = x(1);
    L = x(2);
    dH = a*H - H*L;
    dL = -L + H*L;
    odefun = [dH; dL];
end