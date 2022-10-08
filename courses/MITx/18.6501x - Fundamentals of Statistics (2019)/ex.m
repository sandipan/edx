function ret = q_KS(n, M, alpha)
  u = sort(rand(n,M));
  ret = quantile(max([abs(repmat((0:n-1)'/n,1,M)-u)', abs(repmat((1:n)'/n,1,M)-u)']')', 1-alpha);
end

%q_KS <- function(n, M, alpha) {
%  quantile(replicate(M, {u <- sort(runif(n)); max(abs((0:(n-1))/n-u), abs((1:n)/n-u))}), 1-alpha)
%}

%function ret = q_KS(n, M, alpha)
%  x = zeros(M,1);
% for i=1:M
%	u = sort(rand(1,n));%
%	x(i) = max(max(abs((0:(n-1))/n-u), abs((1:n)/n-u)));
%  end
%  ret = quantile(x, 1-alpha);
%end

