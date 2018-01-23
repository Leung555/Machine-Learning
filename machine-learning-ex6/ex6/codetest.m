c_vec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_vec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

for C = c_vec,
  for sigma = sigma_vec,
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma))
    predictions = svmPredict(model, Xval);
    accuracy = mean(double(predictions ~= yval));
    if (maxacc < accuracy),
      maxacc = accuracy;
      cmax = C;
      sigmamax = sigma;
    end
  end
end