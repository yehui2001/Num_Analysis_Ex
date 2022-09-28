#!/usr/bin/env python
# -*- encoding: utf-8 -*-
'''
@File    :   main.py
@Time    :   2022/09/28 19:32:15
@Author  :   Lev1s
@Version :   1.0
@Contact :   Lev1sStudio.cn@gmail.com
@PW      :   http://Lev1s.cn
@Github  :   https://github.com/o0Lev1s0o

'''
print('''
    __             ___        _____ __            ___     
   / /   ___ _   _<  /____   / ___// /___  ______/ (_)___ 
  / /   / _ \ | / / / ___/   \__ \/ __/ / / / __  / / __ \\
 / /___/  __/ |/ / (__  )   ___/ / /_/ /_/ / /_/ / / /_/ /
/_____/\___/|___/_/____/   /____/\__/\__,_/\__,_/_/\____/
''')
# here put the import lib
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set_style('darkgrid')

max_iteration = 100
acc = 1e-20

x = np.zeros([max_iteration, 2], dtype='float64')
err = np.zeros(max_iteration - 1, dtype='float64')
distance = 1
idx = 1
x[0, 0] = 2
x[0, 1] = 0
while(distance > acc):
    if(idx < max_iteration):
        x[idx, 0] = ((x[idx - 1, 0])**2 + (x[idx - 1, 1])**2 + 8) / 10
        x[idx, 1] = (x[idx - 1, 0] + (x[idx - 1, 0] * x[idx - 1, 1])**2 + 7) / 12
        distance = (x[idx - 1, 0] - x[idx, 0])**2 + (x[idx - 1, 1] - x[idx, 1])**2
        err[idx - 1] = distance
        idx = idx + 1 
    else:
        break  
print(x[idx - 1, 0],end=' ')
print(x[idx - 1, 1])

err = pd.DataFrame({'Iter':np.arange(idx - 1),'Distance': err[0:idx - 1]})
sns.relplot(x = 'Iter', y = 'Distance',kind = 'line', data = err)
plt.xlim(-1,idx - 1)
plt.xticks(range(0,idx - 1))
plt.savefig('err.png', dpi = 300)