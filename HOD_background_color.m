% background 

cd('') % your current directory which you want to access

close all
data = readtable('file name'); %your file name

y = table2array(data);
x = 1:length(y(:,1));

answer = y(:,242); % we will make the background colored by this answer value (1: colored, 0: non-colored)

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
