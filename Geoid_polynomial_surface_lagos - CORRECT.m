clc
%This program uses Observation Equation Method of Least Squares Adjustment 
%to model the geoidal model parameters and accuracy of polynomial surfaces
%PLANE SURFACE

%Note that the centroid of the x and y coordinates and the coefficients have been computed in
%the Excel worksheet
%Read coefficients in the Excel worksheet 'geoid_surface_data_LAGOS_planesurface' into
%variable X, and observations in the Excel worksheet 'L_A' into variable L
[X] = xlsread('geoid_surface_data_LAGOS_ALL_planesurface');
[L] = xlsread('L_A');

%Form a vector of parameters
%param = [a0; a1; a2];

%Number of equations
n = 1165;

%Matrix of constant a0 with elements ones
anot = eye(n,1);

%Form the design matrix A by concatenating a0 and X
A = horzcat(anot,X);

% Compute the unknown parameters, a(a0 a1 a2)
a = (A'*A)\A'*L;

% Determine the model Nc and form matrix of computed geoidal undulations Lc
syms x y  
Nc = a(1) + a(2)*x + a(3)*y;
Lc = A*a; 
%A, matrix of coefficients, is multiplying a, matrix of parameters, which
%is same as substituting coefficients into model Nc to produce predicted Lc
%Compute residuals by the diff between L = N(i) and Lc
v = Lc - L;

%Compute local geometric geoid model accuracy, 
rmse_planesurface = sqrt(v'*v/n);

%Compute coefficient of determination (r squared)
num = sum((L - mean(L)).* (Lc - mean(Lc)));
den = sqrt(sum(abs(L - mean(L)).^2) .* sum(abs(Lc - mean(Lc)).^2));
r2_planesurface = (num/den)^2;

fprintf('PLANESURFACE_Parameter: %.20f\n', a);
fprintf('\n');

fprintf('PLANESURFACE_rmse: %.20f\n', rmse_planesurface);
fprintf('\n');

fprintf('PLANESURFACE_rsquared: %.20f\n', r2_planesurface);
fprintf('\n');
%%

%This program uses Observation Equation Method of Least Squares Adjustment 
%to model the geoidal model parameters and accuracy of polynomial surfaces
%MULTIQUADRATIC SURFACE

%Note that the centroid of the x and y coordinates and the coefficients have been computed in
%the Excel worksheet
%Read coefficients in the Excel worksheet 'geoid_surface_data_LAGOS_quintic' into
%variable X, and observations in the Excel worksheet 'L' into variable L
[X] = xlsread('geoid_surface_data_LAGOS_ALL_multiquadratic');
[L] = xlsread('L_A');

%Form a vector of parameters
%param = [a0; a1; a2; a3; a4; a5; a6; a7; a8];

%Number of equations
n = 1165;

%Matrix of constant a0 with elements ones
anot = ones(n,1);

%Form the design matrix A by concatenating a0 and X
A = horzcat(anot,X);

% Compute the unknown parameters, a(a0 a1 a2 a3 a4 a5 a6 a7 a8)
a = (A'*A)\A'*L;

% Determine the model Nc and form matrix of computed geoidal undulations Lc
syms x y x2 y2 xy x2y xy2 x2y2 
Nc = a(1) + a(2)*x + a(3)*y + a(4)*x2 + a(5)*y2 + a(6)*xy + a(7)*x2y + a(8)*xy2 + a(9)*x2y2;
Lc = A*a; 
%A, matrix of coefficients, is multiplying a, matrix of parameters, which
%is same as substituting coefficients into model to produce predicted Lc
%Compute residuals by the diff between L = N(i) and Lc 
v = Lc - L;

%Compute local geometric geoid model accuracy, 
rmse_multiquadratic = sqrt(v'*v/n);

%Compute coefficient of determination (r squared)
num = sum((L - mean(L)).* (Lc - mean(Lc)));
den = sqrt(sum(abs(L - mean(L)).^2) .* sum(abs(Lc - mean(Lc)).^2));
r2_multiquadratic = (num/den)^2;

fprintf('\n');
fprintf('MULTIQUADRATIC_Parameter: %.20f\n', a);
fprintf('\n');

fprintf('MULTIQUADRATIC_rmse: %.20f\n', rmse_multiquadratic);
fprintf('\n');

fprintf('MULTIQUADRATIC_rsquared: %.20f\n', r2_multiquadratic);
fprintf('\n');
%%
%This program uses Observation Equation Method of Least Squares Adjustment 
%to model the geoidal model parameters and accuracy of polynomial surfaces
%THIRD DEGREE SURFACE

%Note that the centroid of the x and y coordinates and the coefficients have been computed in
%the Excel worksheet
%Read coefficients in the Excel worksheet 'geoid_surface_data_LAGOS_quintic' into
%variable X, and observations in the Excel worksheet 'L' into variable L
[X] = xlsread('geoid_surface_data_LAGOS_ALL_thirddegree');
[L] = xlsread('L_A');

%Form a vector of parameters
%param = [a0; a1; a2; a3; a4; a5; a6; a7; a8; a9];

%Number of equations
n = 1165;

%Matrix of constant a0 with elements ones
anot = ones(n,1);

%Form the design matrix A by concatenating a0 and X
A = horzcat(anot,X);

% Compute the unknown parameters, a(a0 a1 a2 a3 a4 a5 a6 a7 a8 a9)
a = (A'*A)\A'*L;

% Determine the model Nc and form matrix of computed geoidal undulations Lc
syms x y x2 y2 xy x2y xy2 x3 y3
Nc = a(1) + a(2)*x + a(3)*y + a(4)*x2 + a(5)*y2 + a(6)*xy + a(7)*x2y + a(8)*xy2 + a(9)*x3 + a(10)*y3;
Lc = A*a; 
%A, matrix of coefficients, is multiplying a, matrix of parameters, which
%is same as substituting coefficients into model Nc to produce predicted Lc
%Compute residuals by the diff between L = N(i) and Lc
v = Lc - L;

%Compute local geometric geoid model accuracy, 
rmse_thirddegree = sqrt(v'*v/n);

%Compute coefficient of determination (r squared)
num = sum((L - mean(L)).* (Lc - mean(Lc)));
den = sqrt(sum(abs(L - mean(L)).^2) .* sum(abs(Lc - mean(Lc)).^2));
r2_thirddegree = (num/den)^2;

fprintf('\n');
fprintf('THIRDDEGREE_Parameter: %.20f\n', a);
fprintf('\n');

fprintf('THIRDDEGREE_rmse: %.20f\n', rmse_thirddegree);
fprintf('\n');

fprintf('THIRDDEGREE_rsquared: %.20f\n', r2_thirddegree);
fprintf('\n');
%%
%This program uses Observation Equation Method of Least Squares Adjustment 
%to model the geoidal model parameters and accuracy of polynomial surfaces
%QUINTIC SURFACE

%Note that the centroid of the x and y coordinates and the coefficients have been computed in
%the Excel worksheet
%Read coefficients in the Excel worksheet 'geoid_surface_data_LAGOS_quintic' into
%variable X, and observations in the Excel worksheet 'L' into variable L
[X] = xlsread('geoid_surface_data_LAGOS_ALL_quintic');
[L] = xlsread('L_A');
%[W] = xlsread('geoid_weight');

%Form a vector of parameters
%param = [a0; a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12; a13; a14; a15; a16; a17; a18; a19; a20];

%Number of equations
n = 1165;

%Matrix of constant a0 with elements ones
anot = eye(n,1);

%Form the design matrix A by concatenating a0 and X
A = horzcat(anot,X);

%Form weight matrix
%W = diag(W);

% Compute the unknown parameters, a(a0; a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12; a13; a14; a15; a16; a17; a18; a19; a20)
a = (A'*A)\A'*L;

% Determine the model Nc and form matrix of computed geoidal undulations Lc
syms x y x2 y2 xy x2y xy2 x3 y3 x2y2 x3y xy3 x4 y4 x3y2 x2y3 x4y xy4 x5 y5 
Nc = a(1) + a(2)*x + a(3)*y + a(4)*x2 + a(5)*y2 + a(6)*xy + a(7)*x2y + a(8)*xy2 + a(9)*x3 + a(10)*y3 + a(11)*x2y2 + a(12)*x3y + a(13)*xy3 + a(14)*x4 + a(15)*y4 + a(16)*x3y2 + a(17)*x2y3 + a(18)*x4y + a(19)*xy4 + a(20)*x5 + a(21)*y5;
Lc = A*a; 
%A, matrix of coefficients, is multiplying a, matrix of parameters, which
%is same as substituting coefficients into model Nc to produce predicted Lc
%Compute residuals by the diff between L = N(i) and Lc
v = Lc - L;

%Compute local geometric geoid model accuracy, 
rmse_egm = sqrt(v'*v/n);

%Compute coefficient of determination (r squared)
num = sum((L - mean(L)).* (Lc - mean(Lc)));
den = sqrt(sum(abs(L - mean(L)).^2) .* sum(abs(Lc - mean(Lc)).^2));
r2_egm = (num/den)^2;

fprintf('\n');
fprintf('THIRDDEGREE_Parameter: %.20f\n', a);
fprintf('\n');

fprintf('THIRDDEGREE_rmse: %.20f\n', rmse_egm);
fprintf('\n');

fprintf('THIRDDEGREE_rsquared: %.20f\n', r2_egm);
fprintf('\n');

%VALIDITY TEST
[Y] = xlsread('LAGOS_VALIDITY_DATA_test');

%Number of equations
n = 267;

%Matrix of constant a0 with elements ones
ano = eye(n,1);

%Form the design matrix A by concatenating a0 and X
AA = horzcat(ano,Y);

N = AA*a;
%%
clc;
%This program uses Observation Equation Method of Least Squares Adjustment 
%to model EGM2008 enrichment using polynomial surfaces

%Note that the centroid of the x and y coordinates and the coefficients have been computed in
%the Excel worksheet
%Read coefficients in the Excel worksheet 'geoid_surface_data_LAGOS_quintic' into
%variable X, and observations in the Excel worksheet 'L' into variable L
[X] = xlsread('geoid_surface_data_LAGOS_ALL_quintic');
[L_obs_EGM] = xlsread('L_EGM');
%[W] = xlsread('geoid_weight');

%Form a vector of parameters
%param = [a0; a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12; a13; a14; a15; a16; a17; a18; a19; a20];

%Number of equations
n = 1165;

%Matrix of constant a0 with elements ones
anot = eye(n, 1);

%Form the design matrix A by concatenating a0 and X
A = horzcat(anot,X);

%Form weight matrix
%W = diag(W);

% Compute the unknown parameters, a(a0; a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12; a13; a14; a15; a16; a17; a18; a19; a20)
a = (A'*A)\A'*L_obs_EGM;

% Determine the model Nc and form matrix of computed geoidal undulations Lc
syms x y x2 y2 xy x2y xy2 x3 y3 x2y2 x3y xy3 x4 y4 x3y2 x2y3 x4y xy4 x5 y5 
Nc = a(1) + a(2)*x + a(3)*y + a(4)*x2 + a(5)*y2 + a(6)*xy + a(7)*x2y + a(8)*xy2 + a(9)*x3 + a(10)*y3 + a(11)*x2y2 + a(12)*x3y + a(13)*xy3 + a(14)*x4 + a(15)*y4 + a(16)*x3y2 + a(17)*x2y3 + a(18)*x4y + a(19)*xy4 + a(20)*x5 + a(21)*y5;

% After adjustment, ?N_EGM represented by Lcorr, was achieved thus
Lcorr = A*a; 
%A, matrix of coefficients, is multiplying a, matrix of parameters, which
%is same as substituting coefficients into model Nc to produce predicted Lc

%Compute residuals by the diff between L = N(i) and Lc
v = Lcorr - L_obs_EGM;

%Compute local geometric geoid model accuracy, 
rmse_egm = sqrt(v'*v/n);

%Compute coefficient of determination (r squared)
num = sum((L - mean(L)).* (Lc - mean(Lc)));
den = sqrt(sum(abs(L - mean(L)).^2) .* sum(abs(Lc - mean(Lc)).^2));
r2_egm = (num/den)^2;

fprintf('\n');
fprintf('EGM_Parameter: %.20f\n', a);
fprintf('\n');

fprintf('EGM_rmse: %.20f\n', rmse_egm);
fprintf('\n');

fprintf('EGM_rsquared: %.20f\n', r2_egm);