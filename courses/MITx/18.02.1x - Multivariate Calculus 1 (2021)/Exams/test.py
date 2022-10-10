def exo_U3_R12_3():
    X = [2004, 2006, 2008, 2010]
    Y = [4.4, 39.41, 54.83, 50.31]
    coeffs = np.polyfit(X, Y, 1)
    slope, intercept = coeffs[0], coeffs[1]
    if intercept > 0:
        sign = "+"
    else:
        sign = ""
    print(f'y = {slope:.1f}x {sign} {intercept:.1f}')
    x = 2014
    predic = slope*x+intercept
    print(f'Prediction for {x}: {predic:.3f}')
    actual = 14.38
    print(f'Percentage error : {np.abs(actual-predic)/actual*100:.0f}%')
    coeffs = np.polyfit(X, Y, 2)
    quadratic, slope, intercept = coeffs[0], coeffs[1], coeffs[2]
    print(f'y = {quadratic:.1f}x^2 + {slope:.1f}x + {intercept:.1f}')
    x = 2012
    predic = quadratic*x**2 + slope*x+intercept
    print(f'Prediction for {x}: {predic:.3f}')
    actual = 35.17
    print(f'Percentage error : {np.abs(actual-predic)/actual*100:.1f}%')
	
	
import pandas as pd
import scipy.stats
df = pd.read_csv('data.txt')
print(df.head())
X = df.values
X, y = X[:,0], X[:,1]
model = scipy.stats.linregress(X, y)
print(model.slope, model.intercept)