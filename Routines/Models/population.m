function [gens] = population(alphai,betai,startgen,steps)
gens=zeros(length(startgen),steps);
gens(:,1)=startgen;
for i=2:steps
    gens(:,i)=leslie(alphai,betai,gens(:,i-1));
end
end
