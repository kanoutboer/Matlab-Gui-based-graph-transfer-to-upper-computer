%�˹���ģ��Ϊ�û����붯̬������빤��ģ��
%�û�ֻ��Ҫ��userprogram���д����д
%���߽������Լ��ĳ����ڸú����е���
%�ú���Ϊ������
function userprogram(hObject,handles)
%���ɸ��ĺ�����
%����Ϊ�Ҷ�ʾ������
newimg_size=size(handles.img);
if numel(newimg_size)>2
  handles.img = rgb2gray(handles.img);
  guidata(hObject,handles);
end
axes(handles.image2);
cla reset;
imshow(handles.img);
update_image(hObject,handles,2);
update_image(hObject,handles,3);
%����Ϊ������湦�ܺ���
%�û��ɵ���
function  update_image(hObject,handles,n)
  if     n ==1
      oldimg_size=size(handles.oldimg);
      axes(handles.image3); 
      cla reset ; 
   if numel(oldimg_size)>2
      r=handles.oldimg(:,:,1);
      g=handles.oldimg(:,:,2);
      b=handles.oldimg(:,:,3);
      x=size(r); 
      x=(1:x(1,2));
      r=r(1,:); 
      g=g(1,:); 
      b=b(1,:);
      axes(handles.image3); 
      cla reset;
      plot(x,r,'r');
      hold on
      plot(x,g,'g');
      plot(x,b,'b'); 
      set(gca,'xtick',-inf:inf:inf);
      title('原图RGB');
      hold off;
     else
        k=handles.oldimg(:,:,1);
        x=size(k);
        x=(1:x(1,2));
        k=k(1,:);
        axes(handles.image3);
        cla reset;
        plot(x,k,'k');
        set(gca,'xtick',-inf:inf:inf);
        title('原图RGB');
   end   
  elseif n ==2
   axes(handles.image4); 
      cla reset ;
      imhist(handles.img);
      title('灰度直方�');
      
  elseif n ==3  
      newimg_size=size(handles.img);
      axes(handles.image5); 
      cla reset ; 
   if numel(newimg_size)>2
      r=handles.img(:,:,1);
      g=handles.img(:,:,2);
      b=handles.img(:,:,3);
      x=size(r); 
      x=(1:x(1,2));
      r=r(1,:); 
      g=g(1,:); 
      b=b(1,:);
      axes(handles.image5); 
      cla reset;
      plot(x,r,'r');
      hold on
      plot(x,g,'g');
      plot(x,b,'b'); 
      set(gca,'xtick',-inf:inf:inf);
      title('效果RGB');
      hold off;
     else
        k=handles.img(:,:,1);
        x=size(k);
        x=(1:x(1,2));
        k=k(1,:);
        axes(handles.image5);
        cla reset;
        plot(x,k,'k');
        set(gca,'xtick',-inf:inf:inf);
        title('效果RGB');
   end   
  end
