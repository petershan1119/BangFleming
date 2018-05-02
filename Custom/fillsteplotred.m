function h = fillsteplotred(dat,linewid,linez,condnames,xrange,colorcycle)
% function h = fillsteplot(dat,linewid,linez,condnames,xrange,colorcycle)

%
% Plots a mean vector (mean of each column of dat)
% surrounded by a fill with standard err bars
%
% If dat has 3 dimensions, then
% the diff between dat(:,:,1) and dat(:,:,2) is
% used as the difference for computing standard err
% (as in repeated measures)
%
% if behavior is entered as optional argument, removes it before plotting
% lines.

if nargin<2;
    linewid=2;
end
if nargin<3;
    linez='-';
end

% if nargin<4;
%     for n=1:size(dat,2);
%         condnames{n}=['v',num2str(n)];
%     end
% end

% % condnames{1}='equal intervals';
% % condnames{2}='equal mass';

if nargin<5;
    xrange=1:size(dat,ndims(dat));
end

if nargin<6
colorcycle={'b','b','g','c','m','y','k','b','g','r','c','m','y','k'};
end

if ~iscell(linez);
    for c=1:size(dat,2);
        liner{c}=linez;
    end
    linez=liner;
end


if ndims(dat)==3;
    
    
for c=1:size(dat,2);
    
    m=squeeze(nanmean(dat(:,c,:)));
    
    hold on; 
    h(c)=plot(xrange,m,'color',[255/255 51/255 51/255],'LineWidth',linewid,'linestyle',linez{c});
    
    d = squeeze(dat(:,c,:));
   
%    md = nanmean(d);
    fill_around_line(m,ste(d),[255/255 051/255 051/255],xrange);
   
end
% legend(h,condnames,'location','SouthEast');
% legend(h,condnames,'location','BestOutside');
% NorthEast');
legend boxoff;

elseif ndims(dat)==2;
   m=squeeze(nanmean(dat));
    
    hold on; 
    plot(m,'color',[255/255 051/255 051/255],'LineWidth',2,'linestyle',linez{1});
       
%    md = nanmean(d);
    fill_around_line(m,ste(dat),[255/255 051/255 051/255]);
end
    
    

return