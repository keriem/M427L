function polarRegion(R1, R2, a, b)
tt = linspace(a,b);
polarplot(tt, R1(tt)), hold on
polarplot(tt, R2(tt), 'Linewidth', 2)
ttt = linspace(a, b, 20);
rcoord = [R1(ttt); R2(ttt)];
polarplot([ttt;ttt], rcoord), hold off
end