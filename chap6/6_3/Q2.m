%通过取对数进行拟合 法方程法
t = [1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8].';
y = [33.4,79.5,122.65,159.05,189.15,214.15,238.65,252.2,267.55,280.50,296.65,301.65,310.40,318.15,325.15].';
y0 = zeros(15, 1);
for j = 1:15%取y的自然对数进行拟合
    y0(j) = log(y(j));
end

A = [1,g2(t(1));1,g2(t(2));1,g2(t(3));1,g2(t(4));1,g2(t(5));1,g2(t(6));1,g2(t(7));1,g2(t(8));1,g2(t(9));1,g2(t(10));1,g2(t(11));1,g2(t(12));1,g2(t(13));1,g2(t(14));1,g2(t(15))];
G = A' * A;
b = A' * y0;
L = Cholesky(G);%cholesky分解
x = L \ (L' \ b);
disp(x);%求出a',b的值
disp(exp(x(1)));%求出a
ss = zeros(15, 1);
for i = 1:15
    ss(i) = exp(4.2106 + 0.2390 * i);%拟合曲线函数值
end

diff = ss - y;
c = sum(diff.^2);%求平方和
sig = sqrt(c / 15);%均方误差
fprintf("均方误差:")
disp(sig);
plot(t,y,'*r')
hold on
x2 = 1:0.5:8;
y2 = exp(4.2106 + 0.2390 * x2);
plot(x2,y2,'b')