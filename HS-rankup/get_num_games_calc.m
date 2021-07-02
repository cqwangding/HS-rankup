function res = get_num_games_calc(p, award, double_bonus)
%GET_PROB_CALC Summary of this function goes here
%   Detailed explanation goes here
    goal = 15;
    if double_bonus
        Es = award*p^3 + (award+1)*p - 1;
        res = goal/Es;
    else
        Es = (award+1)*p - 1;
        res = goal/Es;
    end
end
