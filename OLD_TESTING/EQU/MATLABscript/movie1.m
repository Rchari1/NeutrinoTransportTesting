
for idx = 1:8560
    heatmap(EQU_LOG_DAT(:,:,idx)) 
    F = getframe;
    M(idx) = F;
    idx = idx +100;

end
movie(M)