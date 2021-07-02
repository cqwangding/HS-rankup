function res = get_num_games_simu(p, award, double_bonus)
%GET_PROB_CALC Summary of this function goes here
%   Detailed explanation goes here
    sim_times = 10000;
    goal = 15;
    res = 0;
    for i = 1:sim_times
        count = 0;
        score = 0;
        win = 0;
        while score < goal
            count = count + 1;
            if rand() <= p
                if win >= 2 && double_bonus
                    score = score + award*2;
                else
                    score = score + award;
                end
                win = win + 1;
            else
                if score > 0
                    score = score - 1;
                end
                win = 0;
            end
        end
        res = res + count;
    end
    res = res/sim_times;
end
