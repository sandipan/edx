function u = diffuse(im, delta_t, T, show)

% Read input image
g = double(imread(im));
[h, w] = size(g);

% Enlarge u for boundary conditions
u = zeros(h+2,w+2);
u(2:h+1,2:w+1) = g;
g = u;
[h, w] = size(g);

% Start diffusion
str = sprintf('\n diffusion of u and v begun\n');
disp(str);
analyse(u);

for k=1:round(T/delta_t)
    str = sprintf('Iteration number %d\n',k);
    disp(str);
    u = ld(u,delta_t);
    analyse(u);
        
    if show==1
        imshow(uint8(255*mat2gray(u(2:h-1,2:w-1))));
        drawnow;
    end
end

    
   