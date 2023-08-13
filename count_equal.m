function [cardin, indexs] = count_equal(mat, lookfor)

% mat = Vol_atlas;
% lookfor = atlas_val(1);

[fst_dim, snd_dim, trd_dim] = size(mat);
cardin = 0;
indexes = zeros(fst_dim * snd_dim * trd_dim, 3);
lookfor = int16(lookfor);
m = 1;
for i = 1: fst_dim
    for j = 1: snd_dim
        for k = 1: trd_dim
            if (int16(mat(i,j,k)) == lookfor)
                cardin = cardin + 1;
                indexes(m,1) = i;
                indexes(m,2) = j;
                indexes(m,3) = k;
                m = m + 1;
            end
        end
    end
end

indexs = indexes(1:m-1, :);

