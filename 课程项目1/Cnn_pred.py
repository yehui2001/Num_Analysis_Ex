import numpy as np
import tensorflow as tf
import pandas as pd                     #配置导入数据环境  
import matplotlib.pyplot as plt                  #配置绘图环境
(X_train,y_train),(X_test,y_test)= load_mnist()    #重新载入训练集
plt.imshow(X_test[100])                         #选取第100个样本
plt.show()
result=model.predict(tf.reshape(X_test[100],(1,28,28,1))) #预测
y_pred=np.argmax(result)                                  #归类
print(y_pred)                            
