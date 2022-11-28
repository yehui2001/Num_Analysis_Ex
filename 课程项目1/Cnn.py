#importing the required libraries 加载tensorflow所包含的各种环境
import numpy as np
import tensorflow as tf
from tensorflow.keras.datasets import mnist      #加载keras读取mnist数据集的环境
from tensorflow.keras.models import Sequential   #加载tensorflow搭建CNN的顺序环境
from tensorflow.keras.layers import Conv2D         #加载进行卷积运算的环境
from tensorflow.keras.layers import MaxPool2D   #加载进行池化（下采样）的环境
from tensorflow.keras.layers import Flatten           #加载对数据进行降维的环境
from tensorflow.keras.layers import Dropout         #加载训练中适当丢弃神经元的环境
from tensorflow.keras.layers import Dense             #加载全连接层搭建神经元的环境

#loading data
def load_mnist():
    path = r'E:\mnist.npz'                                            #放置mnist.py的目录。
    f = np.load(path)
    x_train, y_train = f['x_train'], f['y_train']
    x_test, y_test = f['x_test'], f['y_test']
    f.close()
    return (x_train, y_train), (x_test, y_test)
 
(X_train,y_train),(X_test,y_test)= load_mnist()
 
X_train = X_train[59000:]    #从训练集中拿出1000个样本
y_train = y_train[59000:]

X_test = X_test[9700:]       #从测试集中集中拿出300个样本
y_test = y_test[9700:]

#reshaping data
X_train = X_train.reshape((X_train.shape[0], X_train.shape[1], X_train.shape[2], 1))
X_test = X_test.reshape((X_test.shape[0],X_test.shape[1],X_test.shape[2],1)) 
#checking the shape after reshaping
print(X_train.shape)
print(X_test.shape)
#normalizing the pixel values
X_train=X_train/255      #正则化训练集中图片像素的值为0-1
X_test=X_test/255

#defining model
model=Sequential()
#adding convolution layer
model.add(Conv2D(32,(3,3),activation='relu',input_shape=(28,28,1)))   
#adding pooling layer
model.add(MaxPool2D(2,2))
#adding fully connected layer
model.add(Flatten())
model.add(Dense(100,activation='relu'))
#adding output layer
model.add(Dense(10,activation='softmax'))
#compiling the model
model.compile(loss='sparse_categorical_crossentropy',optimizer='adam',metrics=['accuracy'])    #选择默认缺省优化器
#fitting the model
model.fit(X_train,y_train,epochs=5)

#evaluting the model

model.evaluate(X_test,y_test)

model.summary () #显示CNN结构
