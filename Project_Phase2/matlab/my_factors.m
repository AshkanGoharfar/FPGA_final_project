clear all;
close all;
% *************************   Wi
fp=fopen('Wi.coe','wt');
Wi=[];
 Wi(1:32)=[
    0.13965783 -0.04775485  0.34143683  0.28217432  0.05485592  0.5929077  -0.14488743  0.0269083   
-0.26471546  0.21732531 -0.63501525 -0.5341712   0.4722219   0.1886938   0.16185956 -0.1487629   
 0.3210674   0.32791585  0.24699497 -0.19182979  0.21832567  0.22613047  0.1668725  -0.10851475   
 0.09162864 -0.22094683 -0.7704977  -0.27422312 -0.5308995  -0.19721255 -0.10660882 -0.28635386
 ];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Wi)
   
       fixed_number(i)=fi(Wi(i),1,32,23)
       bin_number=bin(fixed_number(i));
       fprintf(fp,'%s,\n',bin_number);
   
end;
fclose(fp);
 
%******************  Wf
fp=fopen('Wf.coe','wt');
 Wf=[];
 Wf(1:32)=[
 -0.02987039  0.04314025  0.53898245  0.41512847 -0.80487585 -0.09355235 -0.41942886 -0.357487
 0.73685104  0.3203586  -0.49644002 -0.05589191  0.5361538   0.4786008   0.18015783  0.536344
-0.27975634 -0.32213825  0.44963884 -0.1668127  -0.72459227 -0.5951743  -0.12105721 -0.8235756
-0.1605476   0.14743894  0.2773945   0.29888842  0.533289    0.8247989   0.08690736  0.56370485
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(Wf) 
    
       fixed_number(i)=fi(Wf(i),1,32,23)
       bin_number=bin(fixed_number(i));
       fprintf(fp,'%s,\n',bin_number);
   
end;

fclose(fp);
 
% *************************   Wc
fp=fopen('Wc.coe','wt');
Wc=[];
 Wc(1:32)=[
-0.21440436  0.58637863 -0.07314462  0.6577152  -0.8901406  -0.49870068  0.7506063  -0.14046632
 0.08641554 -0.01217922  0.13672125 -0.75612044  0.6853312  -0.2585029  -0.7974984   0.16907303
-0.73499763  0.5950351  -0.20747943  0.3708285  -0.76652896 -0.57712734  0.54822814 -0.24967012
 0.25779077 -0.60224974 -0.2717871  -0.18705575  0.82094723  0.6652274  -0.21723086  0.17782894
];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Wc)
    fixed_number(i)=fi(Wc(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%*********************** Wo
fp=fopen('Wo.coe','wt');
Wo=[];
 Wo(1:32)=[
 0.81262547  0.3234628   0.7666596  -0.14796887  1.0295157   0.5463878  -0.2399153  -0.29666474
 0.7540123  -0.07887857 -0.72580874 -0.41807404  0.07835332 -0.90355235 -0.07551592 -0.37188026
 0.46900183  0.04062076  1.0506912  -0.20407581  0.53115785  0.49669996  0.15442692  0.02013548
-0.32798606  0.03164255 -0.6752109  -0.5345587  -0.82918984  0.0482377   0.05022579  0.12873164
];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Wo)
    fixed_number(i)=fi(Wo(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%************************
%*********************** Ui
fp=fopen('Ui.coe','wt');
Ui=[];
 Ui(1:64)=[
  -0.22540611 -0.07725633 -0.04325512 -0.04499104 -0.32806206 -0.04144218  -0.03638914  0.03160138
 0.18012986 -0.29333568  0.00671834 -0.16674466 -0.34768414  0.01304776  -0.06656786 -0.33698344
 0.35989136 -0.16509496 -0.07809209 -0.02823459 -0.6466683   0.03439626  -0.02917804  0.06093279
 0.20940925  0.38939223  0.02142915  0.06047469  0.19592714  0.50517815   0.14237255  0.48360968
 0.02413642  0.16279134  0.02921131  0.4190974  -0.31731865 -0.16067709   0.34781075  0.07166091
-0.07821875  0.14518033 -0.35107407 -0.02979031  0.25414816 -0.37739775   0.45078024  0.20540176
 0.11960886 -0.00708573 -0.01591504 -0.0124966   0.23815277  0.15988702  -0.10813737  0.17890273
 0.28208584  0.28524047 -0.11078832  0.05000078  0.62929094  0.03044126   0.37248662  0.19190663

];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Ui)
    fixed_number(i)=fi(Ui(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%************************
%*********************** Uf
fp=fopen('Uf.coe','wt');
Uf=[];
 Uf(1:64)=[
 0.12014879 -0.0524535  -0.12467378 -0.03299288  0.4924234  -0.24017411   0.03967816  0.35719723
-0.1104935   0.12806204  0.16687083  0.3333305  -0.02045518 -0.16147594  -0.13974743 -0.38790867
 0.2634898   0.23817575 -0.07626809  0.05557626 -0.04142026  0.2815075    0.05502056  0.34272337
-0.05009506  0.06229772 -0.0626516   0.45941448 -0.3453443  -0.3853578   -0.08171016 -0.05097225
-0.23506312  0.12299766  0.18684718 -0.15129495  0.28006473  0.30475447  -0.1648891   0.2405248 
-0.059511   -0.04555352 -0.19750983  0.03688432  0.166731    0.14389813   0.19836815 -0.19307654
-0.0608201  -0.6685579  -0.14629643  0.2732291  -0.1487119  -0.5028979   -0.19989286 -0.60279423
-0.01670908  0.25028083  0.06285841  0.08058461  0.05506877  0.09961189   0.21074672  0.26627186

];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Uf)
    fixed_number(i)=fi(Uf(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%************************
%*********************** Uc
fp=fopen('Uc.coe','wt');
Uc=[];
 Uc(1:64)=[
 0.24807113 -0.18499182 -0.48871857 -0.05675852  0.1581574   0.4236816  -0.22095923  0.12871744
-0.177079    0.4365895  -0.10886224 -0.2711792   0.06320903 -0.3596882   0.03018917 -0.16216652
-0.01938948  0.1877461   0.21442765 -0.18974146 -0.19947451 -0.09283099 -0.42934605 -0.09511761
-0.52744734  0.32326484  0.28837425  0.3303778  -0.264037   -0.11096267  0.25911146 -0.30506   
 0.22532704 -0.1567047  -0.33357525 -0.03777692 -0.03376415  0.5673492   0.03478994  0.02179503
-0.2492082  -0.15948121 -0.26482478 -0.03805209 -0.00448201  0.07136463 -0.11671741  0.22851901
-0.12679164  0.5482961  -0.05207148  0.03086551 -0.4302712  -0.49658602  0.06617329 -0.5270848 
 0.21930438 -0.07057948 -0.04036796 -0.1382596  -0.00983683  0.09509208  0.2272774   0.22204381

];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Uc)
    fixed_number(i)=fi(Uc(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%************************
%*********************** Uo
fp=fopen('Uo.coe','wt');
Uo=[];
 Uo(1:64)=[
-0.1564388   0.060792   -0.25346947 -0.21916276 -0.05961246  0.16500823  0.07056013 -0.04299608
-0.10268968 -0.16318482 -0.0763059  -0.14473884 -0.32715902 -0.3284195   0.01457982 -0.21989729
 0.4014409  -0.20964584  0.12663233  0.15928917  0.06926352  0.0872872   0.09628288  0.20289727
 0.31969658  0.48952508 -0.06890938  0.04971746  0.4850268   0.77359366  0.04772833  0.00763122
-0.21406649  0.3851055   0.06895181 -0.09096608  0.2268963   0.02800295 -0.26645523  0.09101521
-0.23577942  0.40463912 -0.02379321  0.12271876  0.20454015  0.3340834   0.20872128  0.23313737
 0.36070636 -0.08882497  0.1167473  -0.09869172  0.3148002   0.41594255 -0.1424936  -0.13277136
-0.09099162 -0.14975166  0.14469796 -0.09419464  0.34336716  0.45454732 -0.19643505  0.19911067

];
 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');

for i=1:length(Uo)
    fixed_number(i)=fi(Uo(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;
fclose(fp);
%************************
%******************  Bi
fp=fopen('Bi.coe','wt');
 Bi=[];
 Bi(1:8)=[
 0.22003067 0.3905463  0.21280797 0.22266074 0.5750835  0.5361282  0.19412729 0.18189429
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(Bi)
    fixed_number(i)=fi(Bi(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************
%******************  Bi
fp=fopen('Bf.coe','wt');
 Bf=[];
 Bf(1:8)=[
 1.1545736 1.2713808 1.0521708 1.2388046 1.3204008 1.2830889 1.1497107  1.1425042
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(Bf)
    fixed_number(i)=fi(Bf(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************
%******************  Bc
fp=fopen('Bc.coe','wt');
 Bc=[];
 Bc(1:8)=[
-0.05570378 -0.00401851  0.1789396  -0.00899142 -0.02097004 -0.00503316   0.02325593  0.00892116
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(Bc)
    fixed_number(i)=fi(Bc(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************
%******************  Bc
fp=fopen('Bo.coe','wt');
 Bo=[];
 Bo(1:8)=[
 0.215092   0.48508435 0.2803704  0.26674628 0.60106176 0.65973246  0.22069259 0.21072803 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(Bo)
    fixed_number(i)=fi(Bo(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************

%******************  weigth outpout
fp=fopen('wout.coe','wt');
 wout=[];
 wout(1:16)=[
 1.0394741   -1.113635
-0.8161245    1.3644532 
-0.8602668    0.8385718 
 0.01399208   0.6809298 
 0.9627248   -1.0659114 
 1.4139701   -1.3464441 
 0.03614046   1.0304761 
 1.0350043   -0.89600146
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(wout)
    fixed_number(i)=fi(wout(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************

%******************  bias output
fp=fopen('bout.coe','wt');
 bout=[];
 bout(1:2)=[
-0.3260368 -0.0219169
 ];

 fprintf(fp,'memory_initialization_radix=2;\n');
 fprintf(fp,'memory_initialization_vector=\n');
for i=1:length(bout)
    fixed_number(i)=fi(bout(i),1,32,23)
    bin_number=bin(fixed_number(i));
    fprintf(fp,'%s,\n',bin_number);
end;

fclose(fp);
%**************************

