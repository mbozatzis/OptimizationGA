function phi = fitness_2(word, a, c, V, rk, bounds, N_x, N_bits)
    x = decode(word, bounds, N_x, N_bits);
    h(1) = x(5) + x(6) - x(1);
    h(2) = x(7) + x(8) - x(2);
    h(3) = x(9) + x(10) - x(4);
    h(4) = x(11) + x(12) + x(13) - x(3) - x(8) - x(9);
    h(5) = x(14) + x(15) - x(6) - x(7) - x(13);
    h(6) = x(17) - x(10) - x(11);
    h(7) = x(16) - x(14) - x(15);

    g(1) = -x(1) - x(2) - x(3) - x(4) + (85/100)*V;
    g(2) = x(1) + x(2) + x(3) + x(4) - (115/100)*V;
    g(3) = -x(12) - x(15) - x(16) - x(17) + (85/100)*V;
    g(4) = x(12) + x(15) + x(16) + x(17) - (115/100)*V;

    f = sum(a.*x./(1-x./c));
    phi = f + - rk*sum(1./g) + (1/sqrt(rk))*sum(h.^2); 
end