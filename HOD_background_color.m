% 결과 위한 플랏; hands on/off background 

cd('D:\Dropbox (HuVA)\HuVA\과제_진행중\06.모비스 조향AI_2021(공동)\6. 실험\데이터 취득\전체 데이터 취합')

close all
data = readtable('vehicle_data_1_30_1');

y = table2array(data);
x = 1:length(y(:,1));

%HOD 값에 따른 배경 색칠
hod = y(:,242);

hold on
for i = 1:length(y(:,1))     
    if hod(i)
            xx = [y(i,1) y(i,1) y(i+1,1) y(i+1,1)];   % x limits of patch
            patch(xx,[-3 3 3 -3],[0 1 0],...
                'FaceAlpha',0.5,...
                'EdgeColor','none');
            b = true;
    end 
end

road = y(:,171);
for i = 1:length(y(:,1))     
    if road(i) < 0.9998
            xx = [y(i,1) y(i,1) y(i+1,1) y(i+1,1)];   % x limits of patch
            patch(xx,[-3 3 3 -3],[0 0 1],...
                'FaceAlpha',0.5,...
                'EdgeColor','none');
            b = true;
    
    end 
end

% plot(y(:,1),y(:,45),'k')
plot(y(:,1),y(:,45),'k')
% plot(y(:,1),y(:,204),'k')
hold on
% plot(y(:,1),y(:,226),'b')
% plot(y(:,1),y(:,242),'r')
ylim([-1.5 1.5])

title('steering wheel torque')
xlabel('time (s)')
ylabel('torque (Nm)')
xlim([0 300])
