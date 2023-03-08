function initial_pop = populationInitialization(N_population, N_bits, N_x)
    initial_pop = randi([0,1], N_population, N_x*N_bits); 
end