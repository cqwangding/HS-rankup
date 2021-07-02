function res = get_prob_least(award, double_bonus)
%GET_PROB_CALC Summary of this function goes here
%   Detailed explanation goes here
    if double_bonus
        r = roots([award, 0, award+1, -1]);
        res = r(3);
    else
        res = 1/(award+1);
    end
end

