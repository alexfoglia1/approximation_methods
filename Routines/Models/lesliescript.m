%age classes     [Children]   [Young]     [Adult]     [Olds]     
%birth rates     0.81844      0.070636    0.024407     0.003298    
%survival        0.071936     0.189763    0.115040     0
%start gen       10           25          30           15     
birth_rates=[0.81844,0.070636,0.024407,0.003298];
survival = [0.071936,0.189763,0.115040];
start_gen= [100,250,300,150];
n_steps = 50;
gens = population(birth_rates,survival,start_gen,n_steps);
hold on;
population_amounts = zeros(1,n_steps);
for i=1:n_steps
    population_amounts(i)= (sum(gens(:,i)));
    disp(['generation ' num2str(i) ':']);
    disp(['[Children]         -------> ' num2str(gens(1,i)) ]);
    disp(['[Youngs]           -------> ' num2str(gens(2,i)) ]);
    disp(['[Adults]           -------> ' num2str(gens(3,i)) ]);
    disp(['[Olds]             -------> ' num2str(gens(4,i)) ]);
    disp(['[Total population] -------> ' num2str(population_amounts(i)) ]);
end
plot(population_amounts,'DisplayName','Amount of people');
legend(gca,'show','location','northeast');