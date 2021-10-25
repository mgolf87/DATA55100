%TSP using SOM
x=[0.98 0.15;0.17 0.38;0.25 0.16;0.39 0.75;0.07 0.87;0.68 0.35;0.42 0.68;0.98 0.29;0.40 0.53;0.62 0.83];
plot(x(:,1),x(:,2),'*')
axis([0 1 0 1])
hold
text(x(1,1),x(1,2)+0.02,'C1')
text(x(2,1),x(2,2)+0.02,'C2')
text(x(3,1),x(3,2)+0.02,'C3')
text(x(4,1),x(4,2)+0.02,'C4')
text(x(5,1),x(5,2)+0.02,'C5')
text(x(6,1),x(6,2)+0.02,'C6')
text(x(7,1),x(7,2)+0.02,'C7')
text(x(8,1),x(8,2)+0.02,'C8')
text(x(9,1),x(9,2)+0.02,'C9')
text(x(10,1),x(10,2)+0.02,'C10')

%neighborhood (+-2)
w=rand(10,2);
alpha=0.1;
k=0;
diff=10;
while diff>0.1
    oldw=w; k=k+1;
    
    order=randperm(10);
      
    for i=1:10
        d=ones(10,1)*x(order(i),:)-w;
        d=(d(:,1).^2+d(:,2).^2).^0.5;
        [m1 m2]=min(d);
        if m2==1;
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
            w(2,:)=w(2,:)+alpha*(x(order(i),:)-w(2,:));
            w(3,:)=w(3,:)+alpha*(x(order(i),:)-w(3,:));
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
            w(9,:)=w(9,:)+alpha*(x(order(i),:)-w(9,:));
        elseif m2==2;
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
            w(2,:)=w(2,:)+alpha*(x(order(i),:)-w(2,:));
            w(3,:)=w(3,:)+alpha*(x(order(i),:)-w(3,:));
            w(4,:)=w(4,:)+alpha*(x(order(i),:)-w(4,:));
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
        elseif m2==9;
            w(7,:)=w(7,:)+alpha*(x(order(i),:)-w(7,:));
            w(8,:)=w(8,:)+alpha*(x(order(i),:)-w(8,:));
            w(9,:)=w(9,:)+alpha*(x(order(i),:)-w(9,:));
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
        elseif m2==10;
            w(8,:)=w(8,:)+alpha*(x(order(i),:)-w(8,:));
            w(9,:)=w(9,:)+alpha*(x(order(i),:)-w(9,:));
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
            w(2,:)=w(2,:)+alpha*(x(order(i),:)-w(2,:));
        else
            for d1=m2-2:m2+2
                w(d1,:)=w(d1,:)+alpha*(x(order(i),:)-w(d1,:));
            end
        end
    end
diff1(k)=norm(oldw-w);
diff=norm(oldw-w);
end

plot(w(:,1),w(:,2),'r')

plot(w(:,1),w(:,2),'ro')

%neighborhood (+-1)
%w=rand(10,2);
%k=0;
%diff=10;
alpha=0.05;
while diff>0.01
    oldw=w; k=k+1;
    
    order=randperm(10);
    
    for i=1:10
        d=ones(10,1)*x(order(i),:)-w;
        d=(d(:,1).^2+d(:,2).^2).^0.5;
        [m1 m2]=min(d);
        if m2==1;
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
            w(2,:)=w(2,:)+alpha*(x(order(i),:)-w(2,:));
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
        elseif m2==10;
            w(10,:)=w(10,:)+alpha*(x(order(i),:)-w(10,:));
            w(9,:)=w(9,:)+alpha*(x(order(i),:)-w(9,:));
            w(1,:)=w(1,:)+alpha*(x(order(i),:)-w(1,:));
        else
            for d1=m2-1:m2+1
                w(d1,:)=w(d1,:)+alpha*(x(order(i),:)-w(d1,:));
            end
        end
    end
diff1(k)=norm(oldw-w);
diff=norm(oldw-w);
end
plot(w(:,1),w(:,2),'g')
plot(w(:,1),w(:,2),'go')

%neighborhood (+-0)
alpha=0.01;
while diff>0.0001
    oldw=w; k=k+1;
    
    order=randperm(10);
    
    for i=1:10
        d=ones(10,1)*x(order(i),:)-w;
        d=(d(:,1).^2+d(:,2).^2).^0.5;
        [m1 m2]=min(d);
        w(m2,:)=w(m2,:)+alpha*(x(order(i),:)-w(m2,:));
    end
diff1(k)=norm(oldw-w);
diff=norm(oldw-w);
end
plot(w(:,1),w(:,2))
plot(w(:,1),w(:,2),'o')

figure;
plot(x(:,1),x(:,2),'*')
axis([0 1 0 1])
hold
text(x(1,1),x(1,2)+0.02,'C1')
text(x(2,1),x(2,2)+0.02,'C2')
text(x(3,1),x(3,2)+0.02,'C3')
text(x(4,1),x(4,2)+0.02,'C4')
text(x(5,1),x(5,2)+0.02,'C5')
text(x(6,1),x(6,2)+0.02,'C6')
text(x(7,1),x(7,2)+0.02,'C7')
text(x(8,1),x(8,2)+0.02,'C8')
text(x(9,1),x(9,2)+0.02,'C9')
text(x(10,1),x(10,2)+0.02,'C10')
plot(w(:,1),w(:,2))
plot(w(:,1),w(:,2),'o')

