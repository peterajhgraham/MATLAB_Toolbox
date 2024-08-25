# MATLAB Toolbox Overview

A concise MATLAB toolbox for data analysis, algorithm development, modeling, and simulation.

## Directory Structure
```
MATLAB_Toolbox/
├── src/
│   ├── data_analysis.m
│   ├── algorithm_development.m
│   ├── modeling.m
│   ├── simulation.m
│   └── Main.m
│
├── .gitignore
└── README.md
```

## Usage

### Data Analysis
Perform data cleaning, statistical analysis, and PCA.
```matlab
data = randn(100, 5);
[cleanedData, stats, pcaResult] = data_analysis(data, true);
disp(stats);
```

### Algorithm Development
Develop predictive models using various algorithms.
```matlab
X = randn(100, 3);
y = X(:, 1) + 2*X(:, 2) + randn(100, 1);
model = algorithm_development(X, y, 'lasso');
disp(model);
```

### Modeling
Simulate state-space models and compute eigenvalues for stability analysis.
```matlab
A = [0 1 0; 0 0 1; -1 -1 -1];
B = [0; 0; 1];
C = [1 0 0];
D = 0;
y0 = [1; 0; 0];
tSpan = 0:0.01:10;
u = ones(length(tSpan), 1);
[t, y, eigenvalues] = modeling(A, B, C, D, u, y0, tSpan);
plot(t, y);
```

### Simulation
Generate noisy signals and compute SNR.
```matlab
t = linspace(0, 1, 1000);
[signal, noise, snr] = simulation(5, t, 0.1);
plot(t, signal);
disp(['SNR: ', num2str(snr), ' dB']);
```

## Installation and Executing
- git clone repo
- change directory to src directory in repo
- run `Main.m` (no dependencies needed)
