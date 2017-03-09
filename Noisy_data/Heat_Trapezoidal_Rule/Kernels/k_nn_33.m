function K=k_nn_33(x, y, hyp, i)
global ModelInfo;

dt = ModelInfo.dt;

if i == 0
    
    K = k(x, y, hyp(1:3), i) - 1/2*dt*DskDy1s(x, y, hyp(1:3), i) ...
        - 1/2*dt*DskDy2s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx1sDy1s(x, y, hyp(4:6), i) ...
        + 1/4*dt^2*D4kDx1sDy2s(x, y, hyp(4:6), i) ...
        - 1/2*dt*DskDx1s(x,y,hyp(1:3),i) ...
        + 1/4*dt^2*D4kDx1sDy1s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx1sDy2s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx2sDy1s(x, y, hyp(4:6), i) ...
        + 1/4*dt^2*D4kDx2sDy2s(x, y, hyp(4:6), i) ...
        - 1/2*dt*DskDx2s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx2sDy1s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx2sDy2s(x, y, hyp(1:3), i);

elseif i >= 1 && i <= 3
    
    K = k(x, y, hyp(1:3), i) - 1/2*dt*DskDy1s(x, y, hyp(1:3), i) ...
        - 1/2*dt*DskDy2s(x, y, hyp(1:3), i) ...
        - 1/2*dt*DskDx1s(x,y,hyp(1:3),i) ...
        + 1/4*dt^2*D4kDx1sDy1s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx1sDy2s(x, y, hyp(1:3), i) ...
        - 1/2*dt*DskDx2s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx2sDy1s(x, y, hyp(1:3), i) ...
        + 1/4*dt^2*D4kDx2sDy2s(x, y, hyp(1:3), i);
    
elseif i >= 4 && i <= 6
    
    K = 1/4*dt^2*D4kDx1sDy1s(x, y, hyp(4:6), i-3) ...
        + 1/4*dt^2*D4kDx1sDy2s(x, y, hyp(4:6), i-3) ...
        + 1/4*dt^2*D4kDx2sDy1s(x, y, hyp(4:6), i-3) ...
        + 1/4*dt^2*D4kDx2sDy2s(x, y, hyp(4:6), i-3);
    
end

end