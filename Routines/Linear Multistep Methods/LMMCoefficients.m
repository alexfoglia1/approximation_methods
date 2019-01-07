classdef LMMCoefficients
    properties(Constant)
        AB1A = ([-1.0,1.0]);
        AB1B = ([1.0,0.0]);
        AB2A = ([0.0, -1.0 , 1.0]);
        AB2B = ([-0.5 , 1.5, 0.0]);
        MIDA = ([-1.0, 0.0,  1.0]);
        MIDB = ([0.0,  2.0,  0.0]);
        AB3A = ([0.0, 0.0, -1.0 , 1.0]);
        AB3B = ([5.0 / 12.0, - 4.0 / 3.0, 23.0 / 12.0, 0.0]);
        AB4A = ([0.0, 0.0, 0.0,-1.0, 1.0]);
        AB4B = ([- 3.0 / 8.0, 37.0 / 24.0, -59.0 / 24.0, 55.0 / 24, 0.0]);
        AB5A = ([0.0, 0.0, 0.0, 0.0, -1.0, 1.0]);
        AB5B = ([251.0 / 720.0, -637.0 / 360.0, 109.0 / 30.0, ...
                         -1387.0 / 360.0, 1901.0 / 720.0, 0.0]);
        AM1AA = ([-1.0, 1.0]);
        AM1AB = ([0.0, 1.0]);
        AM1BA = ([-1.0, 1.0]);
        AM1BB = ([0.5, 0.5]);
        AM2A = ([0.0, -1.0, 1.0]);
        AM2B = ([-1.0 / 12.0, 2.0 / 3.0, 5.0 / 12.0]);
        AM3A = ([0.0, 0.0, -1.0, 1.0]);
        AM3B = ([1.0 / 24.0, -5.0 / 24.0, 19.0 / 24.0, 3.0 / 8.0]);
        AM4A = ([0.0, 0.0, 0.0, -1.0, 1.0]);
        AM4B = ([-19.0 / 720.0, 106.0 / 720, -264.0 / 720.0, 646.0 / 720.0, ...
                         251.0 / 720]);
        BDF1A = ([-1.0, 1.0]);
        BDF1B = ([0.0, 1.0]);
        BDF2A = ([1.0 / 3.0, -4.0 / 3.0, 1.0]);
        BDF2B = ([0.0, 0.0, 2.0 / 3.0]);
        BDF3A = ([-2.0 / 11.0, 9.0 / 11.0, -18.0 / 11.0, 1.0]);
        BDF3B = ([0.0, 0.0, 0.0, 6.0 / 11.0]);
        BDF4A = ([3.0 / 25.0, -16.0 / 25.0, 36.0 / 25.0, -48.0 / 25.0, 1.0]);
        BDF4B = ([0.0, 0.0, 0.0, 0.0, 12.0 / 25.0]);
        BDF5A = ([-12.0 / 137.0, 75.0 / 137.0, -200.0 / 137.0, 300 / 137.0, ...
                          -300.0 / 137.0, 1.0]);
        BDF5B = ([0.0, 0.0, 0.0, 0.0, 0.0, 60.0 / 137.0]);
        BDF6A = ([10.0 / 147.0, -72.0 / 147.0, 225.0 / 147.0, -400.0 / 147.0, ...
                          450.0 / 147.0, -360.0 / 147.0, 1.0]);
        BDF6B = ([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 60.0 / 147.0]);
    end
end