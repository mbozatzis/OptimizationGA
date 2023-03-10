clc
clear
format long

ci = [54.13 21.56 34.08 49.19 33.03 21.84 29.96 24.87 47.24 33.97 26.89 32.76 39.98 37.12 53.83 61.65 59.73];
ai = zeros();
for i=1:17
    if i <= 5
        ai(i) = 1.25;
    elseif i>5 && i<=10
        ai(i) = 1.5;
    else
        ai(i) = 1;
    end
end
V = 100;
rk = 1e-6;


bounds = zeros(2, 17);
for i = 1:17
   bounds(1, i) = 0;
   bounds(2, i) = ci(i);
end


N_population = 200;
N_x = 17;
N_bits = 50;
N_generations = 500;
elit_percentage = 0.4;

population = populationInitialization(N_population, N_bits, N_x);


min_word = population(1, :);
min_word_fitness = fitness_2(min_word, ai, ci, V, rk, bounds, N_x, N_bits);
most_fitted = [];
word_fitness = zeros();

for i = 1:N_generations
    
    for j = 1:N_population
        word_fitness(j) = fitness_2(population(j,:), ai, ci, V, rk, bounds, N_x, N_bits);
        
        if word_fitness(j) < min_word_fitness
            min_word = population(j, :);
            min_word_fitness = word_fitness(j);
        end        
    end
    
    elite = elitism(population, word_fitness, elit_percentage*N_population);
    
    c_words = [];
    for j = 1:ceil((1-elit_percentage)*N_population)
        it = randperm(elit_percentage*N_population, 2);
        p1 = elite(it(1),:);
        p2 = elite(it(2),:);

        [c1, c2] = crossover(p1, p2, N_x, N_bits);
        c1 = mutation(c1, N_bits, N_x);
        c2 = mutation(c2, N_bits, N_x);
        c_words = [c_words; c1; c2];
    end
    most_fitted = [most_fitted min_word_fitness];
    population = [elite;c_words;];
end
        
x = decode(min_word, bounds, N_x, N_bits);
i = 1:9;

plot(most_fitted);
title("Fitness of the best word of each generation");
ylabel("Fitness value");
xlabel("Generation");

fprintf("The x values that minimize the objective function under the specified constrains are:\n");
fprintf("x = [");
fprintf(" %f", x);
fprintf(" ]\n");   
fprintf("The fitness value with the above values is: %f\n", min_word_fitness);