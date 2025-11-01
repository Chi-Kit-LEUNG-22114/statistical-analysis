import numpy as np
import pandas as pd
import csv
import statsmodels.formula.api as smf
from statsmodels.compat import lzip
import statsmodels.stats.api as sms


df = pd.read_csv("")

#Normal OLS
fit = smf.ols('dependent_variable ~ independent_variable_1', data=df).fit()

#Robust OLS
fit_robust = smf.ols('dependent_variable ~ independent_variable_1', data=df).fit(cov_type='HC0')

print(fit_robust.summary())

test_result = sms.het_breuschpagan(fit.resid, fit.model.exog)


#print(test_result)