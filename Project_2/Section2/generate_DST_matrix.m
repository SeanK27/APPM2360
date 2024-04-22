function S = generate_DST_matrix(n)
    S = zeros(n);

    for i = 1:n
        for j = 1:n
            S(i, j) = sqrt(2/n) * sin(pi * (i - 0.5) * (j - 0.5) / n);
        end
    end
end
