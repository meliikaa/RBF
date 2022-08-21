%%computational Inteligence Lab RBF code%%
clear all
clc
close all
%%noise + data
NUM_SAMPLES = 100
%building an array of 0 to 1 with 100 random numbers
XX = zeros(1,100);
i=0;
for i =1: 100
    XX(i)=rand();
    while XX(i)==0;
        XX(i)=rand();
    end
end
XX = sort(XX);
%producing a -1 to 1 noise
noise = rand(1,100)/10; 
for i=1:50
    noise(i)= -noise(i);
end
noise = sort(noise)
%y
y = sin(2*pi*XX)  + noise

%% initializing %%
k = 50 %limit of the number of classes that can be chosen by user 
g = 1
iteration = 10; %the limit of updationg
center_x =zeros(1,k);
center_x_new =ones(1,k);
dist = zeros(1,k);
data_number = 100
k = input('Enter the number of class')
dist = zeros(1,k)
A = []
s = []
flag = 1 
lr = 0.01
%% initializing centers of classes by random numbers
for i = 1:k
    center_x(1,i) = rand();
    while center_x(1,i)==0
        center_x(1,i) = rand();   
    end
end
%% K-Mean %%
%input data & classification
  for j = 1:length(XX)
      index = CNUM(k,XX(j),center_x(1,:));
      CLASS_X(index,j)= XX(j);
  end
%Finding new centers
  flag = 1;
  
      while flag
          for l = 1 : iteration %to limit the number of updating
          m_1 = 0;
          sum_1 = 0
          for o = 1:k
              for j = 1:length(XX)
                  CLASS_X(o,j)
                  if CLASS_X(o,j) ~= 0
                      m_1 = m_1+1;
                      sum_1 = sum_1 +CLASS_X(o,j);
                  end
              end
              center_x_new(1,o) = sum_1 / m_1
          end
% input data & classification
          for j = 1:length(XX)
              index = CNUM(k,XX(j),center_x_new(1,:));
              CLASS_X(index,j)= XX(j);
          end
          for i = 1:k
              T=center_x(1,i) - center_x_new(1,i)
              if (sqrt(T^2) < 10)
                  flag = 0
              end
          end
      end
      end
% finding c & s
c= center_x
%finding the max distance between centers
d = 0;
for i=1:k
    d0 = 0;
    for j = 1:k
        d = abs(center_x(i)-center_x(j));
        if d > d0
            d0 = d;
        end
    end
    s(i) = d0/sqrt(2*k);
 
end
%%RBF
w = rand(1,k);
b = rand(1,1);
y_pre = [];
%% training
j=0;
for epoch = 1:100
  for i = 1 : NUM_SAMPLES
    F = 0;
    for m =1:k
      a = rbf(XX(i), c(m), s(m));
      F = F + a*(transpose(w(m))) + b
    if epoch==100
      y_pre(i)=F;
    end
    end
    loss = (y(i) - F)^ 2;
    error = -(y(i) - F);
   % update
    w = w - lr *a*error;
    b = b - lr * error;
  end
end
%%Plot
plot(XX,y,'g')
hold on;
plot(XX, y_pre,'r')
legend('sin(x)+noise','RBF')
%%FUNCTIONS
function [s] = CNUM(k, x, center_x)
s=0;
for i = 1:k
    A = x - center_x(i);
    dist(i) = sqrt(A^2);
    if (dist(i) == min(dist))
      s = i ;
    end 
end

end
function[r] = rbf(x, c, s)
 r = exp(-1 / (2 * s^2) * (x-c)^2);
end
    