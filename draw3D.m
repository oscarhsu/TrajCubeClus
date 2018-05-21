function draw3D(m2,m1)
    figure;
    hold on;

    if ~isempty(m1)
        trajList = unique(m1(:,5));
        n2 = length(trajList);
        for i = 1:n2
            plot3( m1(m1(:,5) == trajList(i),3) , m1(m1(:,5) == trajList(i),4) , m1(m1(:,5) == trajList(i),2),'.' ,'color','green' );
            x = m1(m1(:,5) == trajList(i),3);
            y = m1(m1(:,5) == trajList(i),4);
            t = m1(m1(:,5) == trajList(i),2);
            plot3( x(end) , y(end), t(end),'x','color','green' );
        end      
    end    
	[n,~] = size(m2);
	u=m2(:,9)-m2(:,7);
	v=m2(:,10)-m2(:,8);
	w=zeros(n,1);
	x = m2(:,5);
	mu = median(x);
	pd = makedist('Exponential','mu',mu);
	y = cdf(pd,x);

	h = quiver3(m2(:,7),m2(:,8),m2(:,1), u.*y, v.*y, w, 'AutoScale','off','color','black','LineWidth',2);
	uistack(h,'top');
end