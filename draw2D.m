function draw2D(m2,m1)
    figure;
    hold on;

    if ~isempty(m1)
       trajList = unique(m1(:,5));
       n2 = length(trajList);
       h1 = cell(1,1);
    for i = 1:n2
        %plot3( m1(m1(:,5) == trajList(i),3) , m1(m1(:,5) == trajList(i),4) , m1(m1(:,5) == trajList(i),2),'.' ,'color','green' );
        plot( m1(m1(:,5) == trajList(i),3) , m1(m1(:,5) == trajList(i),4) ,'.' ,'color','green' );
        x = m1(m1(:,5) == trajList(i),3);
        y = m1(m1(:,5) == trajList(i),4);
        t = m1(m1(:,5) == trajList(i),2);
        %plot3( x(end) , y(end), t(end),'x','color','green' );
        plot( x(end) , y(end), 'x','color','green' );
    end      
    end    
  [n,~] = size(m2);
         u=m2(:,9)-m2(:,7);
         v=m2(:,10)-m2(:,8);
         %w=zeros(n,1);
         %w = m2(:,6)-m2(:,1);
        x = m2(:,5);
        mu = median(x);
        pd = makedist('Exponential','mu',mu);
        y = cdf(pd,x);
        %y = ones(n,1);
%       for i = 1:n
% %           %quiver3(m2(i,5),m2(i,6),m2(i,1),m2(i,7),m2(i,8),m2(i,1));
% %         %quiver3(-m2(i,6),m2(i,7),m2(i,1), u(i), v(i), w(i), 'AutoScale','off','LineWidth',width(i));
%          quiver3(-m2(i,6),m2(i,7),m2(i,1), u(i)*y(i), v(i)*y(i), w(i), 'AutoScale','off');

%       end    
%      u=-m2(:,8)+m2(:,6);
%      v=m2(:,9)-m2(:,7);
%      w=zeros(n,1);
    % h = quiver3(m2(:,7),m2(:,8),m2(:,1), u.*y, v.*y, w, 'AutoScale','off','color','black','LineWidth',2);
    h = quiver(m2(:,7),m2(:,8),u.*y, v.*y, 'AutoScale','off','color','black','LineWidth',1.2);
     uistack(h,'top');
     %grid on;


    %axis([min(X1) max(X1) min(Y1) max(Y1) min(time1) max(time1)]);
    hold off;
    %grid on;
end