function compressed_matrix = discard_high_frequencies_antidiagonal(matrix, p)
    n = size(matrix, 1);
    compressed_matrix = matrix;
    
    for i = 1:n
        for j = 1:n
            if (i + j > p * 2 * n)
                compressed_matrix(i, j) = 0;
            end
        end
    end
end