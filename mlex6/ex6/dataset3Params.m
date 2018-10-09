function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
_C = 0.1;
least_error = 1;
limit = 10; 

while _C <= limit
  _sigma = 0.1;
  
  while _sigma <= limit
    model = svmTrain(X, y, _C, @(x1, x2) gaussianKernel(x1, x2, _sigma));
    predictions = svmPredict(model, Xval);
    err1 = mean(double(predictions ~= yval));
    if err1 < least_error
      C = _C;
      sigma = _sigma;
      least_error = err1;
    end
    _sigma *= 3;
  end
  
  _C *= 3;
end
% =========================================================================

  





% =========================================================================

end
