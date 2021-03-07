function a=annealing_algorithm(a1,a2,b1,b2)
%ģ���˻��㷨ʵ�������������ֵ
%Anneal.m
N=20;%��������
temp=20;%��ʼ�¶�
T=200;%��������
k=0.1;%�¶�λ��ϵ��
kt=0.05;%�¶ȸ���ϵ��
de=0.99;%�¶Ƚ�������
minx=0;
maxx=2*pi;%����
location=2*pi*rand(1,N);%���ӳ�ʼλ��
present_value=equation(location,a1,a2,b1,b2);%���ӵ�ǰ��
%---------------------------
for t=1:T %
    dx_av=k*temp;%��ǰ�¶�������ƽ���ƶ�����
    probability=exp(-1/(kt*temp));
    %disp(probability);
    temp=temp*de;%�¶ȱ仯
    for p=1:N
        dx=0.5*dx_av*randn+dx_av;%��ƽ���ƶ�����Ϊ������̬�ֲ���
        if rand>0.5 %0.5�ĸ���Ϊ-
            dx=-dx;
        end
        local=location(p)+dx;
        if (local<maxx)&&(local>minx)%�ж��Ƿ�Խ��
            local_value=equation(local,a1,a2,b1,b2);
            if local_value>present_value(p)
                location(p)=local;
                present_value(p)=local_value;
            else if rand<probability
                    location(p)=local;
                    present_value(p)=local_value;
                end
            end
        end
    end
end
a = location(N);
end
