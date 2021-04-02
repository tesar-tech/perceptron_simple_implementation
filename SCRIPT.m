%%
% isnpirated by: https://www.mathworks.com/matlabcentral/fileexchange/45467-perceptron?s_tid=srchtitle

X = [2,3,4,6,7,8;...%x value on plot
    8 7 9 2 4 3];% y value on plot
y = [-1 -1 -1 1 1 1];% group -1 or +1. Expected result

w = rand([1,2]);%random weights
b = rand(1);%random bias
x_to_plot_line = min(X(1,:)): max(X(1,:)); %for ploting the threshold curve (x val)
%%
while(sum(sign(w*X+b)~=y)>0)% checking activations
    for i = 1:length(y)%loop all data
        scatter(X(1,:)',X(2,:)',[],y,'filled')% y is for color here
        hold on
        % training perceptron
        if(sign(w*X(:,i)+b)~=y(i))%maticove nasobeni, ptam se jeslti to odpovida signu
            %changing weights and biases
            diff_from_true_value =  w*X(:,i)+b - y(i);
            w = w - (diff_from_true_value'/200)% 1/200 is learning rate (to not jump too much)
            b = b - (diff_from_true_value'/300)%
            
        end
        
        %where is the result 0 (between -1 and 1)
        % 0 = w(1)*x_to_plot_line + w(2)*yy + b;
        % -w(2)*yy = w(1)*x_to_plot_line + b
        %yy =  ( w(1)*x_to_plot_line + b ) / -w(2)
        yy =  -(w(1)*x_to_plot_line)/w(2) - (b/w(2))
        plot(x_to_plot_line,yy,'-');%plot the threshold curve
        hold off;drawnow; pause(0.1)
    end
end