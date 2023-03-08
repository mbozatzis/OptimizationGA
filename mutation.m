function word = mutation(word, N_bits, N_x)
    r_mut = 1.3/100;
    for i=1:length(word)
        if rand < r_mut
            word(i) = 1 - word(i);
        end
    end
end