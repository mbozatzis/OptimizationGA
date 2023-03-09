function [elite, min_i] = elitism(population, fitness_values, N_elits)
    [~, min_i] = mink(fitness_values, N_elits);
    elite = zeros(N_elits, length(population));
    for i = 1:N_elits
        elite(i, :) = population(min_i(i), :);
    end
end