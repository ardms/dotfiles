import pandas as pd
import matplotlib.pyplot as plt

df = pd.DataFrame()

for i in range(0,100):
    df.loc[i,'test'] = i**2
    print(i)

plt.plot(df)
