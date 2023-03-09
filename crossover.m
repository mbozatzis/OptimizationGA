function [c1, c2] = crossover(p1, p2, N_x, N_bits)
    r_crossover = 0.8;
    if rand < r_crossover
        section = randi([1, N_x*N_bits]);
        c1 = [p1(1:section) p2(section+1:end)];
        c2 = [p2(1:section) p1(section+1:end)];
    else
        c1 = p1;
        c2 = p2;
    end
end