clear;

%% calculate the least probabilities to advance

% with bonus rules
fprintf("Least wining probability\n-------------------------\n")
for i = 1:11
    j = 12-i;
    fprintf("Award stars %d: %f\n", j, get_prob_least(j,true));
end

%% calculate the number of games the player need to play to earn 15 stars

fprintf("\nNumber of games the player need to play to earn 15 stars\n-------------------------\n")
% with bonus rules
p = 0.4:0.01:1;
num_games = zeros(1,length(p));
l = [];
figure;
hold on;
for i = 1:10
    j = 12-i;
    for k = 1:length(p)
        num_games(k) = get_num_games_calc(p(k),j,true);
    end
    plot(p, num_games);
    l = [l, num2str(j) + " award stars with double bonus"];
end
hold off;
xlim([0.4,1]);
ylim([0,50]);
xlabel("Winning Probability");
ylabel("Number of games");
title("Theoretical calculation");
legend(l);
saveas(gcf,"plot/num_games_calc_bonus.png");
close(gcf);

p = 0.4:0.01:1;
num_games = zeros(1,length(p));
l = [];
figure;
hold on;
for i = 1:10
    j = 12-i;
    for k = 1:length(p)
        num_games(k) = get_num_games_simu(p(k),j,true);
    end
    plot(p, num_games);
    l = [l, num2str(j) + " award stars with double bonus"];
end
hold off;
xlim([0.4,1]);
ylim([0,50]);
xlabel("Winning Probability");
ylabel("Number of games");
title("Simulation");
legend(l);
saveas(gcf,"plot/num_games_sim_bonus.png");
close(gcf);

% without double bonus rules
p = 0.46:0.01:1;
num_games = zeros(1,length(p));
figure;
hold on;
for k = 1:length(p)
    num_games(k) = get_num_games_calc(p(k),1,true);
end
plot(p, num_games);
p = 0.51:0.01:1;
num_games = zeros(1,length(p));
for k = 1:length(p)
    num_games(k) = get_num_games_calc(p(k),1,false);
end
plot(p, num_games);
l = ["1 award star with double bonus", "1 award star without double bonus"];
hold off;
xlim([0.4,1]);
ylim([0,500]);
xlabel("Winning Probability");
ylabel("Number of games");
title("Theoretical calculation");
legend(l);
saveas(gcf,"plot/num_games_calc_nobonus.png");
close(gcf);

p = 0.4:0.01:1;
num_games = zeros(1,length(p));
figure;
hold on;
for k = 1:length(p)
    num_games(k) = get_num_games_simu(p(k),1,true);
end
plot(p, num_games);
p = 0.45:0.01:1;
num_games = zeros(1,length(p));
for k = 1:length(p)
    num_games(k) = get_num_games_simu(p(k),1,false);
end
plot(p, num_games);
l = ["1 award star with double bonus", "1 award star without double bonus"];
hold off;
xlim([0.4,1]);
ylim([0,500]);
xlabel("Winning Probability");
ylabel("Number of games");
title("Simulation");
legend(l);
saveas(gcf,"plot/num_games_simu_nobonus.png");
close(gcf);
