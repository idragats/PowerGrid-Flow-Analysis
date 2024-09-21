clc; clear; clf;
nodes10=readtable('grid-nodes-R-10.dat');
nodes20=readtable('grid-nodes-R-20.dat');
nodes30=readtable('grid-nodes-R-30.dat');
nodes40=readtable('grid-nodes-R-40.dat');
nodes50=readtable('grid-nodes-R-50.dat');
nodes60=readtable('grid-nodes-R-60.dat');
nodes70=readtable('grid-nodes-R-70.dat');
nodes80=readtable('grid-nodes-R-80.dat');
nodes90=readtable('grid-nodes-R-90.dat');
nodes100=readtable('grid-nodes-R-100.dat');



nodesNum=100;
total_power_flux=[10;20;30;40;50;60;70;80;90;100];

[power_supply_level_10,power_demand_level_10,current_time_10]=Power(nodes10.Var5,nodes10.Var6,nodes10.Var2,nodesNum);
[power_supply_level_20,power_demand_level_20,current_time_20]=Power(nodes20.Var5,nodes20.Var6,nodes20.Var2,nodesNum);
[power_supply_level_30,power_demand_level_30,current_time_30]=Power(nodes30.Var5,nodes30.Var6,nodes30.Var2,nodesNum);
[power_supply_level_40,power_demand_level_40,current_time_40]=Power(nodes40.Var5,nodes40.Var6,nodes40.Var2,nodesNum);
[power_supply_level_50,power_demand_level_50,current_time_50]=Power(nodes50.Var5,nodes50.Var6,nodes50.Var2,nodesNum);
[power_supply_level_60,power_demand_level_60,current_time_60]=Power(nodes60.Var5,nodes60.Var6,nodes60.Var2,nodesNum);
[power_supply_level_70,power_demand_level_70,current_time_70]=Power(nodes70.Var5,nodes70.Var6,nodes70.Var2,nodesNum);
[power_supply_level_80,power_demand_level_80,current_time_80]=Power(nodes80.Var5,nodes80.Var6,nodes80.Var2,nodesNum);
[power_supply_level_90,power_demand_level_90,current_time_90]=Power(nodes90.Var5,nodes90.Var6,nodes90.Var2,nodesNum);
[power_supply_level_100,power_demand_level_100,current_time_100]=Power(nodes100.Var5,nodes100.Var6,nodes100.Var2,nodesNum);

figure(1)
plot(current_time_10,power_supply_level_10,'-')
hold on
plot(current_time_20,power_supply_level_20,'-')
plot(current_time_30,power_supply_level_30,'-')
plot(current_time_40,power_supply_level_40,'-')
plot(current_time_50,power_supply_level_50,'-')
plot(current_time_60,power_supply_level_60,'-')
plot(current_time_70,power_supply_level_70,'-')
plot(current_time_80,power_supply_level_80,'-')
plot(current_time_90,power_supply_level_90,'-')
plot(current_time_100,power_supply_level_100,'-')

title("Power Supply flow over-capacity-cost=50")
xlabel("Current Time")
ylabel("% Power Supply")
legend({'10 over capacity cost','20 over capacity cost','30 over capacity cost','40 over capacity cost','50 over capacity cost','60 over capacity cost','70 over capacity cost','80 over capacity cost','90 over capacity cost','100 over capacity cost'})



current_time=[current_time_10(end); current_time_20(end); current_time_30(end); current_time_40(end); ...
              current_time_50(end); current_time_60(end);current_time_70(end); current_time_80(end); current_time_90(end); ...
              current_time_100(end)];
          
          
power_variance=[sqrt(sum(nodes10.Var5-nodes10.Var6)^2); sqrt(sum(nodes20.Var5-nodes20.Var6)^2); ...
                sqrt(sum(nodes30.Var5-nodes30.Var6)^2); sqrt(sum(nodes40.Var5-nodes40.Var6)^2); ...
                sqrt(sum(nodes50.Var5-nodes50.Var6)^2); sqrt(sum(nodes60.Var5-nodes60.Var6)^2); ...
                sqrt(sum(nodes70.Var5-nodes70.Var6)^2); sqrt(sum(nodes80.Var5-nodes80.Var6)^2); ...
                sqrt(sum(nodes90.Var5-nodes90.Var6)^2); sqrt(sum(nodes100.Var5-nodes100.Var6)^2)];
           
            
             figure(2)
 plot(total_power_flux,current_time,'*-')
 xlabel("Tota Power Flux")
 ylabel("current time mean")
 

 
 
%nodes10a


edges10=readtable('grid-edges-R-10.dat');
edges20=readtable('grid-edges-R-20.dat');
edges30=readtable('grid-edges-R-30.dat');
edges40=readtable('grid-edges-R-40.dat');
edges50=readtable('grid-edges-R-50.dat');
edges60=readtable('grid-edges-R-60.dat');
edges70=readtable('grid-edges-R-70.dat');
edges80=readtable('grid-edges-R-80.dat');
edges90=readtable('grid-edges-R-90.dat');
edges100=readtable('grid-edges-R-100.dat');


CurrentTime2=[mean(edges10.Var3) ; mean(edges20.Var3); mean(edges30.Var3);mean(edges40.Var3); ...
          mean(edges60.Var3);mean(edges70.Var3) ; mean(edges70.Var3);mean(edges80.Var3);...
            mean(edges90.Var3);mean(edges100.Var3)];    
        
lifeTime= [mean(edges10.Var6) ; mean(edges20.Var6); mean(edges30.Var6);mean(edges40.Var6); ...
          mean(edges60.Var6);mean(edges70.Var6) ; mean(edges70.Var6);mean(edges80.Var6);...
            mean(edges90.Var6);mean(edges100.Var6)];
        
load=[mean(edges10.Var5) ; mean(edges20.Var5); mean(edges30.Var5);mean(edges40.Var5); ...
          mean(edges60.Var5);mean(edges70.Var5) ; mean(edges70.Var5);mean(edges80.Var5);...
            mean(edges90.Var5);mean(edges100.Var5)];    

        
        
     
 flux_variance=[sqrt((sum(edges10.Var4-edges10.Var5))^2); sqrt((sum(edges20.Var4-edges20.Var5))^2); ...
                sqrt((sum(edges30.Var4-edges30.Var5))^2); sqrt((sum(edges40.Var4-edges40.Var5))^2); ...
                sqrt((sum(edges50.Var4-edges50.Var5))^2); sqrt((sum(edges60.Var4-edges60.Var5))^2); ...
                sqrt((sum(edges70.Var4-edges70.Var5))^2); sqrt((sum(edges80.Var4-edges80.Var5))^2); ...
                sqrt((sum(edges90.Var4-edges90.Var5))^2); sqrt((sum(edges100.Var4-edges100.Var5))^2)];
           
 

            
 figure(3)        
 plot(total_power_flux,load,'*-')
 xlabel("total power flux")
 ylabel("load")
 
         

 figure(4)
 plot(total_power_flux,flux_variance,'*-')
xlabel("total power flux")
 ylabel("flux variance")

fileID1 = fopen('current_time50.txt','w');
 fileID2 = fopen('load50.txt','w');
 fileID3 = fopen('flux_variance50.txt','w');


fprintf(fileID1,'%f\n', current_time);
fprintf(fileID2,'%f\n', load);
fprintf(fileID3,'%f\n', flux_variance);






function [power_supply_level,power_demand_level,current_time]=Power(A,B,C,nodes) 
        power1=0;
        power2=0;
        power3=0;
        power4=0;
        n=1;
        
        power_supply=zeros(1,length(A)/nodes);
        power_demand=zeros(1,length(A)/nodes);
        power_input=zeros(1,length(A)/nodes);
        power_output=zeros(1,length(A)/nodes);
        current_time=zeros(1,length(A)/nodes);
        
        for i=1:length(A)
            if(A(i)>0)
          
               power1=power1+A(i);
               power3=power3+B(i);
            end
            
            if(A(i)<0)
                power2=power2+A(i);
                power4=power4+B(i);
            end
            
            if (mod(i,nodes)==0)
                power_supply(n)=power1;
                power_demand(n)=power2*(-1);
                power_input(n)=power3;
                power_output(n)=power4*(-1);
                
                current_time(n)=C(i);
                
                
                n=n+1;
                 power1=0;
                 power2=0;
                 power3=0;
                 power4=0;
            end    
            
        end          
        
        
        
        power_supply_level=(power_input./power_supply)*100;
        power_demand_level=(power_output./power_demand)*100;
     end      









