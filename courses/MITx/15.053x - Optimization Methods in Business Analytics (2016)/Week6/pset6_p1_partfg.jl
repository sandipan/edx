using JuMP

m = Model()

# Parameters

F = 5 # total candidate facilities
C = 5 # total customers
W = 5 # total number of scenarios

fac_cost = [40 40 40 40 40] # facility opening cost

deliv_cost = zeros(5,5,5) # initialize delivery cost

del_cost[:,:,1]=[32  7 60 43 54;12 14 15 52 31;42 50 48 18 61;22 20 45 43 29;19 47 11 16 53] # delivery cost under scenario 1
del_cost[:,:,2]=[10 12 26 19 21;22 46 17 20  9;61 67 17 20 19;31 59 10 71 40;13 48 26 54 19] # delivery cost under scenario 2
del_cost[:,:,3]=[33 41 10 12 11;16 18 16 33 30;57 32 50 54 39;37 18 47 35 39;48 49 54 67 74] # delivery cost under scenario 3
del_cost[:,:,4]=[19 55 15 26 45; 2 54 17 45 25;52 50 36 34 37;13 34 33 26 50;54 70 36 20 37] # delivery cost under scenario 4
del_cost[:,:,5]=[24 27 57 39 30;56 14 23 13 64;16 22 79 11 23;62 12 39 64 18;30 15 62 31 41] # delivery cost under scenario 5
  
prob = [0.1, 0.15, 0.25, 0.2, 0.25] # probability of scenario realization

