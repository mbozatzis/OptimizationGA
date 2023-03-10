function x = decode(word, bounds, N_x, N_bits)
    for i = 0:N_x-1
        word_i = word(17*i + 1: 17*(i+1));
        num = 0;
        for j = 1:length(word_i)
            num = num + 2^(N_bits - j) * word_i(j);
        end
        max_num = 2^N_bits - 1;
        x(i+1) = bounds(1,i+1) + (num/max_num)*(bounds(2,i+1)-bounds(1,i+1));
    end
end