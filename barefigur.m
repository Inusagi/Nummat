function barefigur(h,figurfil)
%Funksjonen barefigur(h,figurfil) lagrer figur h i fila figurfil 
%og fjerner tomme omraader paa alle sider av figuren
ax = get(h, 'CurrentAxes');
ti = get(ax,'TightInset');
set(ax,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(ax,'units','centimeters');
pos = get(ax,'Position');
ti = get(ax,'TightInset');
set(h, 'PaperUnits','centimeters');
set(h, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(h, 'PaperPositionMode', 'manual');
set(h, 'PaperPosition',[0 0  pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
saveas(h,figurfil);
