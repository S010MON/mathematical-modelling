function [output] = lcg_random(seed, n)

    output = zeros(n, 1);

    a = 5;
    m = 16;
    c = 3;

    for i = 1:n
        seed = mod((a * seed + c), m);
        output(i) = seed;
    end%for


end

