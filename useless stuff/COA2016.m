clc

otheraidnow = 4488

disp('------------------------------------')

costbyitemraw = [4906*2 2400 9000 800 4700 2000 120]'
costtotalraw = sum(costbyitemraw)
aidbyitem = [9812 5665 5500 2992]'
aidtotal = sum(aidbyitem)

need = costtotalraw - aidtotal

disp('------------------------------------')

%second calculation
costbyitemraw = [4906*2 2400 9000 300 4700 1000 120]'
costtotalraw = sum(costbyitemraw)
aidbyitem = [9812 5665 4500 2992 5331]'
aidtotal = sum(aidbyitem)

need = costtotalraw - aidtotal