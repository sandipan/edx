import xgboost as xgb
from sklearn.datasets import load_diabetes, load_breast_cancer
import numpy as np
import matplotlib.pylab as plt
#from sklearn.metrics import classification_report

#X, y = load_diabetes(return_X_y=True)
#reg = xgb.XGBRegressor(
#    tree_method="hist",
#    eval_metric=mean_absolute_error,
#)
#reg.fit(X, y, eval_set=[(X, y)])

def absolute_error_obj(alpha):
    def absolute_error(labels, predt):
        x = predt - labels
        grad = np.sign(x) 
        grad[np.abs(x) < alpha] = 2/alpha*x[np.abs(x) < alpha] #np.tanh(x)
        hess = np.zeros_like(labels) 
        hess[np.abs(x) < alpha] = 2/alpha #1 / np.cosh(x)**2
        return grad, hess
    return absolute_error

def run_xgboost():    
    X, y = load_diabetes(return_X_y=True)
    reg = xgb.XGBRegressor(tree_method="hist", objective=absolute_error_obj(75))
    reg.fit(X, y, eval_set=[(X, y)])
    with open('loss.txt') as f:
        ll = list(map(float, f.read().splitlines()))
        plt.plot(range(len(ll)), ll)
        plt.xlabel('iter')
        plt.ylabel('loss')
        plt.grid()
        plt.show()
    ypred = reg.predict(X)
    plt.scatter(y, ypred)
    plt.xlabel('y')
    plt.ylabel('ypred')
    plt.show()
    #print(classification_report(y, clf.predict(X)))

'''
def softprob_obj(labels: np.ndarray, predt: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    rows = labels.shape[0]
    classes = predt.shape[1]
    grad = np.zeros((rows, classes), dtype=float)
    hess = np.zeros((rows, classes), dtype=float)
    eps = 1e-6
    for r in range(predt.shape[0]):
        target = labels[r]
        p = softmax(predt[r, :])
        for c in range(predt.shape[1]):
            g = p[c] - 1.0 if c == target else p[c]
            h = max((2.0 * p[c] * (1.0 - p[c])).item(), eps)
            grad[r, c] = g
            hess[r, c] = h

    grad = grad.reshape((rows * classes, 1))
    hess = hess.reshape((rows * classes, 1))
    return grad, hess

#clf = xgb.XGBClassifier(tree_method="hist", objective=softprob_obj)
'''

def ci():
    import scipy
    from scipy import stats

    # find a 95 percent confidence interval for the mean weight of a popcorn bag
    data = np.array([91, 101, 98, 98, 103, 97, 102, 105, 94, 90])

    sMu = np.mean(data)
    sSigma = np.std(data)
    sem = stats.sem(data)
    n = len(data)
    df = n - 1
    α = 0.05

    dist = stats.t(df=n-1, loc=sMu, scale=sem) #, loc=sMu, scale=sem)
    #critical_value = dist.ppf(0.975)
    #print(critical_value)

    print((dist.ppf(α/2), dist.ppf(1-α/2)))
    print(dist.interval(1-α)) #, loc=sMu, scale=sem))
    print(stats.t.interval(1-α, df=n-1, loc=sMu, scale=sem))

    #upper = sMu + (sem * critical_value)
    #lower = sMu - (sem * critical_value)
    #print('Manually Calculated: ', lower,' ', upper)
    #dist.interval(0.975, loc=sMu, scale=sem)
    import matplotlib.pylab as plt
    x = np.linspace(dist.ppf(0.01),
                    dist.ppf(0.99), 100)
    plt.plot(x, dist.pdf(x), 'k-', lw=2, label='frozen pdf')
    plt.axvline(dist.ppf(α/2), color='red', linestyle='dashed')
    plt.axvline(dist.ppf(1-α/2), color='red', linestyle='dashed')
    plt.show()


from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from mlxtend.data import iris_data
from sklearn.model_selection import train_test_split

'''
X, y = iris_data()
clf1 = LogisticRegression(random_state=1, max_iter=1000)
clf2 = DecisionTreeClassifier(random_state=1, max_depth=1)

X_train, X_test, y_train, y_test = \
    train_test_split(X, y, test_size=0.25,
                     random_state=123)

score1 = clf1.fit(X_train, y_train).score(X_test, y_test)
#X_train, X_test, y_train, y_test = \
#    train_test_split(X, y, test_size=0.98,
#                     random_state=123)
score2 = clf2.fit(X_train, y_train).score(X_test, y_test)

print('Logistic regression accuracy: %.2f%%' % (score1*100))
print('Decision tree accuracy: %.2f%%' % (score2*100))

from mlxtend.evaluate import paired_ttest_5x2cv


t, p = paired_ttest_5x2cv(estimator1=clf1,
                          estimator2=clf2,
                          X=X, y=y,
                          random_seed=123)

print('t statistic: %.3f' % t)
print('p value: %.3f' % p)
'''

from sklearn.metrics import f1_score

def compare_algos():

    X, y = iris_data()
    X_train, X_test, y_train, y_test = \
        train_test_split(X, y, test_size=0.25,
                        random_state=123)

    #X = data_frame.iloc[:, 3:]
    #y = data_frame.iloc[:,2:-7]

    algo_A = LogisticRegression(random_state=1, max_iter=1000)
    algo_B = DecisionTreeClassifier(random_state=1, max_depth=1)

    y_pred = algo_A.fit(X_train, y_train).predict(X_test)
    f1_score_Algo_A = f1_score(y_test, y_pred, average='micro')

    y_pred = algo_B.fit(X_train, y_train).predict(X_test)
    f1_score_Algo_B = f1_score(y_test, y_pred, average='micro')

    print(f'Algo A score: {f1_score_Algo_A}, Algo B score: {f1_score_Algo_B}')

    from mlxtend.evaluate import paired_ttest_5x2cv

    #t, p = paired_ttest_5x2cv(estimator1=f1_score_Algo_A, estimator2=f1_score_Algo_B, X=X, y=y)
    t, p = paired_ttest_5x2cv(estimator1=algo_A, estimator2=algo_B, X=X, y=y)
    alpha = 0.05

    print('t statistic: %.3f' % t)
    print('aplha ', alpha)
    print('p value: %.3f' % p)

    if p > alpha:
        print("Fail to reject null hypotesis")
    else:
        print("Reject null hypotesis")

'''
f1_score_Algo_A,f1_score_Algo_B = 0.589744, 0.641026
from scipy import stats
t_value,p_value=stats.ttest_ind([f1_score_Algo_A],[f1_score_Algo_B])
print('Test statistic is %f'%float("{:.6f}".format(t_value)))
print('p-value for two tailed test is %f'%p_value)
'''

def paired_t():
    from sklearn.metrics import f1_score
    from scipy import stats

    algo_A = LogisticRegression(random_state=1, max_iter=1000)
    algo_B = DecisionTreeClassifier(random_state=1, max_depth=3)

    X, y = iris_data()

    f1_scores_Algo_A, f1_scores_Algo_B = [], []

    for i in range(100):
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25)

        y_pred = algo_A.fit(X_train, y_train).predict(X_test)
        f1_scores_Algo_A.append(f1_score(y_test, y_pred, average='micro'))

        y_pred = algo_B.fit(X_train, y_train).predict(X_test)
        f1_scores_Algo_B.append(f1_score(y_test, y_pred, average='micro'))

    t_value,p_value=stats.ttest_ind(f1_scores_Algo_A, f1_scores_Algo_B)
    print('Test statistic is %f'%float("{:.6f}".format(t_value)))
    print('p-value for two tailed test is %f'%p_value)

    import pandas as pd

    #plt.figure(figsize=(8,6))
    #plt.boxplot(f1_scores_Algo_A, alpha=0.5, label="algo A")
    #plt.boxplot(f1_scores_Algo_B, alpha=0.5, label="algo B")

    pd.DataFrame({'algo_A_f1': f1_scores_Algo_A, 'algo_B_f1':f1_scores_Algo_B}).plot(kind='box', title='boxplot')

    #plt.xlabel("scores", size=14)
    #plt.ylabel("count", size=14)
    plt.title("distribution of F1 scores with different train-test splits")
    #plt.legend(loc='upper right')
    plt.show()

def test_pair_t():
    import os
    import numpy as np
    import pandas as pd
    import datetime as dt
    import matplotlib.pyplot as plt
    from statsmodels.tsa.exponential_smoothing.ets import ETSModel

    #df_air = pd.read_csv('https://raw.githubusercontent.com/AileenNielsen/TimeSeriesAnalysisWithPython/master/data/AirPassengers.csv',
    df_air = pd.read_csv('air.csv',
            parse_dates=['Month'], 
            date_parser=lambda x: pd.to_datetime(x, format='%Y-%m', errors = 'coerce'))
    df_air = df_air.set_index('Month')
    data = df_air['#Passengers']

    print(data.head())

    #df_air.to_csv('air.csv')

    model_mul = ETSModel(data, error="mul", trend="mul", seasonal="mul", damped_trend=True, seasonal_periods=12)
    fit_mul = model_mul.fit(maxiter=10000)

    pred = fit_mul.get_prediction()
    df = pred.summary_frame(alpha=0.05)
    print(df.head())

    print(fit_mul.sse)
    #print(pred.predicted_mean)
    #print(pred.forecast_variance)
    #print(pred.pred_int())

    data.plot(label="data")
    fit_mul.fittedvalues.plot(label="statsmodels fit")
    pred.predicted_mean.plot(label="predicted mean")
    df["mean"].plot(label="mean prediction")
    df["pi_lower"].plot(linestyle="--", color="tab:blue", label="95% interval")
    df["pi_upper"].plot(linestyle="--", color="tab:blue", label="_")
    plt.legend()
    plt.show()

def sum_digits(n): # assumes n >= 0
    #return n % 9 if n % 9 else 9 if n > 0 else 0
    return (n-1) % 9 + 1

#print([sum_digits(k) for k in range(100)])
#print(sum_digits(942))
#print(type(pred))
#print(pred.pred_int())


#print(fit_mul.fittedvalues)
#print(fit_mul.conf_int())

from sklearn.neighbors import KernelDensity
import numpy as np

def kde():
    rng = np.random.RandomState(42)
    X = rng.random_sample((100, 3))
    kde = KernelDensity(kernel='gaussian', bandwidth=0.5).fit(X)
    log_density = kde.score_samples(X[:3])
    print(log_density)
    print(kde.sample(5))

kde()
