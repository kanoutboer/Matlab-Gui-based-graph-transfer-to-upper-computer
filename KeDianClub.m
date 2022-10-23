% ���ߣ���־��-���ݳ���ѧԺ-�Ƶ���ֲ�
% ����ʱ�䣺2022��4��
% ˵������ֹ���ã���ӭ���ħ�ġ�
%       �ڴ˸�л�ž���ѧ���Լ�¬�����Ա��ο����ṩ�İ����ͽ���
%��Դ��ַ��https://github.com/xuzhihaoup/Matlab-Gui-based-graph-transfer-to-upper-computer
function varargout = KeDianClub(varargin)
% KeDianClub MATLAB code for KeDianClub.fig 
%      KeDianClub, by itself, creates a new KeDianClub or raises the existing
%      singleton*.
%
%      H = KeDianClub returns the handle to a new KeDianClub or the handle to
%      the existing singleton*.
%
%      KeDianClub('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KeDianClub.M with the given input arguments.
%
%      KeDianClub('Property','Value',...) creates a new KeDianClub or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KeDianClub_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KeDianClub_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KeDianClub

% Last Modified by GUIDE v2.5 05-Aug-2022 12:28:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KeDianClub_OpeningFcn, ...
                   'gui_OutputFcn',  @KeDianClub_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%��������
% --- Executes just before KeDianClub is made visible.
function KeDianClub_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KeDianClub (see VARARGIN)
%global get_image;
% Choose default command line output for KeDianClub
handles.output = hObject;
handles.get_image = ones(60,94);
guidata(hObject, handles);
%set(handles.image1,'Visible','off');
%set(handles.image2,'Visible','off');
% Ports = instrhwinfo('serial');
% if  size(Ports.AvailableSerialPorts,1) ~= 0
%     comlist =  Ports.AvailableSerialPorts;
%     set(handles.list1,'string',comlist);
% end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KeDianClub wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KeDianClub_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%��ͼ��
% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image1); 
%ͼ������
cla reset ;
axes(handles.image2); 
%ͼ������
cla reset ;
[image_name image_path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, '���ļ�');

original_image = [image_path image_name];
new_image      = [image_path image_name];

%��ͼ����ʾ
 if isequal(image_name,0)
    warndlg('��ѡ��һ��ͼƬ','Warning') ;
 else
    img_path = sprintf('\n%s',original_image);
    set(handles.text4,'string',img_path);
 end
 %�ж�ͼ���ļ���ʽ�Ƿ���ȷ
[fpath, fname, fext]=fileparts(image_name);
image_Type = ({'.bmp','.jpg','.jpeg','.png'});
%ͼ���ʽ�жϱ�־Ϊ
image_Type_flag = 0;
image_type_num = length(image_Type);
for i = 1 : image_type_num
    if strcmpi(fext,image_Type{i})
        image_Type_flag = 1;   
        set(handles.image1,'Visible','on');
        set(handles.image2,'Visible','on');
    end
end
if image_Type_flag == 0
    errordlg('ͼ���ʽ���󣬿��ø�ʽ[jpg��jpeg��bmp��png]','��ʽ����');  
end
%����ͼ�񵽽ṹ��
handles.oldimg = imread(original_image);
handles.img    = imread(new_image);
    h = waitbar(0,'Loading your image...');
    for i=1:100
    s=sprintf('������:%d',ceil(i/10));
    waitbar(i/100,h,[s '%']);
    end        
    close(h) 
axes(handles.image2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);
axes(handles.image1); 
cla; 
imshow(handles.img);
%ʾ��������
update_image(handles,1);
%����ͼƬ
% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.png';'*.bmp';'*.jpg'},'ͼƬ����');
    if filename ~= 0
       
        %imwrite(handles.img,save,'save.file');
      h=getframe(handles.image2);%picture��GUI�����ͼ������ϵ���
      imwrite(h.cdata,[pathname, filename]);
        msgbox('ͼ���ѳɹ�����','ȷ�ϣ�','warn');
    else
        msgbox('������ȡ��','ȷ��','warn');
    end
%���Ч��
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.s1,'Value',0);
set(handles.s2,'Value',0);
handles.img = handles.oldimg;
guidata(hObject,handles);
axes(handles.image2); 
cla reset ;
imshow(handles.img);
axes(handles.image3); 
cla reset ;
update_image(handles,1);
axes(handles.image4); 
cla reset ;
axes(handles.image5); 
cla reset ;
update_image(handles,3);
%�˳�����
% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
%�ϰ�դ��
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image2); 
cla; 
imshow(handles.img);
hold on
img_width  = size(handles.img,2); %��ȡͼ���
img_length = size(handles.img,1); %��ȡͼ��
%[X,Y] = meshgrid(1:100,1:100);
M = round(str2num(get(handles.edit1,'String')));
[X,Y] = meshgrid(round(linspace(1, img_width, M)), ...
                 round(linspace(1, img_length, M)));%�������ݵ����
mesh(X, Y, zeros(size(X)), 'FaceColor', ...
    'None', 'LineWidth', 1, ...
    'EdgeColor', 'k');             
%plot(X,Y,'k',Y,X,'k'); %����&���ߡ�
%axis equal; %��������
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%ʾ�������º���
% n ==1 ���µ�һ��ʾ����
% n ==2 ���µڶ���ʾ����
% n ==3 ���µڶ���ʾ����
function  update_image(handles,n)
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
      title('ԭͼRGB');
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
        title('ԭͼRGB');
   end   
  elseif n ==2
   axes(handles.image4); 
      cla reset ;
      imhist(handles.img);
      title('�Ҷ�ֱ��ͼ');
      
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
      title('Ч��RGB');
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
        title('Ч��RGB');
   end   
     elseif n==4
        axes(handles.image1);
        cla reset;      
        imshow(handles.get_image);
  end
      
      

%�Ҷȴ���
% --- Executes on button press in img1.
function img1_Callback(hObject, eventdata, handles)
% hObject    handle to img1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newimg_size=size(handles.img);
if numel(newimg_size)>2
  handles.img = rgb2gray(handles.img);
  guidata(hObject,handles);
end
axes(handles.image2);
cla reset;
imshow(handles.img);
update_image(handles,2);
update_image(handles,3);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%ԭ�����ȵ���
% --- Executes on button press in light.
function light_Callback(hObject, eventdata, handles)
% hObject    handle to light (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
light_lavel = round(str2num(get(handles.edit2,'String')));
light_image = handles.img;
light_image = light_image + light_lavel;
axes(handles.image2);
cla reset;
imshow(light_image);
handles.img = light_image;
guidata(hObject,handles);
update_image(handles,2);
%������դ�����
% --- Executes on slider movement.
function s1_Callback(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
axes(handles.image2); 
cla; 
imshow(handles.img);
hold on
img_width  = size(handles.img,2); %��ȡͼ���
img_length = size(handles.img,1); %��ȡͼ��
%[X,Y] = meshgrid(1:100,1:100);
M = round(get(handles.s1,'Value'));
[X,Y] = meshgrid(round(linspace(1, img_width, M)), ...
                 round(linspace(1, img_length, M)));%�������ݵ����
mesh(X, Y, zeros(size(X)), 'FaceColor', ...
    'None', 'LineWidth', 1, ...
    'EdgeColor', 'r');    
% --- Executes during object creation, after setting all properties.
function s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light img1 background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%���������ȵ���
% --- Executes on slider movement.
function s2_Callback(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
level=get(hObject,'Value');
img=handles.img;
img=img+level;
axes(handles.image2); 
cla reset; 
imshow(img)
handles.img = img;
newimg_size=size(handles.img);
if numel(newimg_size)>2
    update_image(handles,3);
else
    update_image(handles,2);
    update_image(handles,3);
end






% --- Executes during object creation, after setting all properties.
function s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light img1 background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%baud=[4800,9600,14400,115200,128000,200000,460800];
%botelv=baud(get(handles.p2,'value'));
%botelv=num2str(botelv)
%duankou_zhi=get(handles.p1,'value');
%duankou_zhi = strcat('com',num2str(duankou_zhi));
%str2 = sprintf('\n%s\n',oldpath);
%str3 = sprintf('\n%s\n',newpath);
%strnum = [duankou_zhi botelv];
%set(handles.p1, 'String', 'botelv');

% Ports   = instrhwinfo('serial');
% comlist =  Ports.AvailableSerialPorts;
% set(handles.p1, 'String', comlist);


% Hints: contents = cellstr(get(hObject,'String')) returns p1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p1


% --- Executes during object creation, after setting all properties.
function p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p2


% --- Executes during object creation, after setting all properties.
function p2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  scom  ;
baud = [4800,9600,14400,115200,128000,200000,460800,512000,1000000];
handles.botelv=baud(get(handles.p2,'value'));
%set(handles.list1, 'String', handles.botelv);
guidata(hObject,handles);
duankouhao  = get(handles.p1,'value');
% duankouhao  = sprintf('%s',duankouhao{1,1});
% % assignin('base','M1',duankouhao)
%  set(handles.list1,'string',duankouhao);
 handles.com = strcat('COM',num2str(duankouhao));
 guidata(hObject,handles);
% handles.com = duankouhao;
%  set(handles.list1,'string',handles.com);
% duankouhao = sprintf(duankouhao);
try
    scom = serial(handles.com);
    %set(handles.list1, 'String', handles.com);
    scom.BaudRate = handles.botelv;
    scom.InputBufferSize  = 1024000 ;
    scom.OutputBufferSize = 1024000 ;
    scom.ReadAsyncMode    =  'continuous';
    scom.Parity           = 'none';
    scom.StopBits         =  1;
    scom.DataBits         =  8;
    %��LF�����з����� �͡�CR(�س���)��
    scom.Terminator       = 'H';
    scom.FlowControl      = 'none';
    scom.timeout          = 1;
    scom.BytesAvailableFcnMode = 'terminator';   %byte
    scom.BytesAvailableFcnCount = 1;%һ�ֽڴ���,handles,handles
    scom.BytesAvailableFcn      = {@myReceiveCallback,handles};      % �����ж���Ӧ��������  
    handles.scom  =  scom ;
    guidata(hObject,handles);
    fopen(scom);   %�򿪴��� 
    set(gco,'string','�򿪴���');
    hs  = msgbox(['��',handles.com,'�ɹ�']);
     ht = findobj(hs, 'Type', 'text');
      set(ht, 'FontSize', 10, 'Unit', 'normal');
        waitfor(hs);
   catch 
           hs = msgbox('�򿪴���ʧ��');
           ht = findobj(hs, 'Type', 'text');
      set(ht, 'FontSize', 10, 'Unit', 'normal');
        waitfor(hs);
end
    
%     ,handles
    
function myReceiveCallback(obj,event,handles)
global  scom  ;
getchar_flag = 1;
%buff = {'----���ڴ�----'};
%oldbuff = get(handles.list1,'string');
%assignin('base','M1',oldbuff)
%set(handles.list1,'string','');,'string'
buffstr = fscanf(scom);   % �������ݲ���ʾ���޷ֺţ�
%flush(scom);
%assignin('base','M1',scom.InputBufferSize);
buffstr = strtrim(buffstr);
L = strlength(buffstr) 
% assignin('base','lh',L);
% assignin('base','M2',buffstr);
if get(handles.tucuan,'value')
            if buffstr == 'H'
                assignin('base','M2',buffstr);
                %imshow(handles.get_image,'Parent',handles.image1);
%               handles.get_image = zeros(60,94);
            else
                newstr = uint8(buffstr);
                assignin('base','M1',buffstr);
%                 nl = strlen(newstr);
%                 assignin('base','M9',nl);
                %newstr = dec2hex(newstr);
        %     newstr =  str2num(newstr);   0 �� 1�� axes(handles.image1);
%                assignin('base','M3',newstr);
                for i = 1:1:60
                    for j = 1:1:94
                      handles.get_image(i,j) = newstr(getchar_flag);
                      getchar_flag = getchar_flag + 1;
                    end
                end
                %getchar_flag = 1;
             imshow(handles.get_image,'Parent',handles.image1);
               assignin('base','M5',getchar_flag);
            %newstr = sprintf('%s',newstr);'Parent'
        %     handles.get_image =handles.get_image;
            assignin('base','M4',handles.get_image);
            end
else
        if get(handles.COM5,'value')
            %buff(end+1) = buffstr; 
            %assignin('base','M2',buffstr);
            %oldstr = sprintf('%s',oldbuff);
            newstr = sprintf('%s',buffstr);
        elseif get(handles.COM6,'value')
            newstr = int8(buffstr);
            newstr = dec2hex(newstr);
            %newstr = sprintf('%s',newstr);
        end    
        %showstr  =[oldstr,newstr];
        %showstr = cat(1,oldbuff,buffstr);
        %assignin('base','M3',showstr)
        %assignin('base','M1',buffstr)
        %buffstr  = buffstr;
        %
        %buff  =[buff,buffstr];
        %assignin('base','M4',showstr)
        liststr = get(handles.list1,'string');
        newstr=strcat('[GET]:',newstr);
        liststr{end+1} = newstr;
        set(handles.list1,'string',liststr);
end


%guidata(hObject,handles);   
%axes(handles.image1);
%cla(handles.image1);      
%guidata(hObject, handles);
%update_image(handles,4)
%update_image(handles,3);
%showstr  =[oldstr,newstr];
%showstr = cat(1,oldbuff,buffstr);
%assignin('base','M3',showstr)
%assignin('base','M1',buffstr)
%buffstr  = buffstr;
%buff  =[buff,buffstr];
%assignin('base','M4',showstr)
% liststr = get(handles.list1,'string');
% assignin('base','M1',liststr);
% newstr=strcat('[GET]:',newstr);
% assignin('base','M2',newstr);
% liststr{end+1} = newstr;
% set(handles.list1,'string',liststr);
% liststr = get(handles.list1,'string');
% newstr=strcat('[GET]:',newstr);
% liststr{end+1} = newstr;
% set(handles.list1,'string',liststr);
%index = size(get(handles.list1,'string'),1);
%liststr = get(handles.list1,'string');
%liststr = sprintf('%s\n',buff);
%newlist = [liststr buff];
%set(handles.list1,'Value',index);      
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
        guidata(hObject,handles); 
        stopasync(handles.scom); 
        fclose(handles.scom);
        delete(handles.scom);
        clear handles.scom;
                set(gco,'string','�رմ���');
                hs = msgbox(['�ر�',handles.com,'�ɹ�']);
                ht = findobj(hs, 'Type', 'text');
                set(ht, 'FontSize', 10, 'Unit', 'normal');
                waitfor(hs);
catch  
    set(gco,'string','�رմ���');
                hs = msgbox(['�ر�ʧ�ܻ���δ����']);
                ht = findobj(hs, 'Type', 'text');
                set(ht, 'FontSize', 10, 'Unit', 'normal');
                waitfor(hs);
end
%�ֶ���ֵ
% --- Executes on button press in img2.
function img2_Callback(hObject, eventdata, handles)
% hObject    handle to img2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end

prompt = {'��������ֵ��С��'};
title ='��ֵ����';
numlines = [1 40];
def = {'127'};
answer = inputdlg(prompt,title,numlines,def);
a = str2num(answer{1});
I = handles.img > a;
handles.img = I;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(a);
%���
% --- Executes on button press in img3.
function img3_Callback(hObject, eventdata, handles)
% hObject    handle to img3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thresh = graythresh(handles.img);     %�Զ�ȷ����ֵ����ֵ
handles.img = im2bw(handles.img,thresh);
axes(handles.image2);
cla reset;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(thresh);
% --- Executes on button press in img4.
function img4_Callback(hObject, eventdata, handles)
% hObject    handle to img4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
I=double(handles.img);
[m,n]=size(handles.img);
Smax=-1;
for T=0:255
    sum1=0; num1=0;                   
    sum2=0; num2=0;                   
    for i=1:m
        for j=1:n
            if I(i,j)>=T
                sum2=sum2+I(i,j); 
                num2=num2+1;               
            else 
                sum1=sum1+I(i,j); 
                num1=num1+1;                
            end 
        end 
    end
    ave1=sum1/num1; 
    ave2=sum2/num2;
    ave=(sum1+sum2)/(m*n);
    d1=-1;
    d2=-1;
    for i=1:m
        for j=1:n
            if I(i,j)>=T
                d=(I(i,j)-ave2)^2;
                if d2==-1
                   d2=d;
                else
                   d2=d2+d;
                end
            else
                d=(I(i,j)-ave1)^2;
                if d1==-1
                    d1=d;
                else
                    d1=d1+d;
                end
            end
        end
    end
    p1=num1/(m*n);
    p2=num2/(m*n);
    S1=p1*(ave1-ave)^2+p2*(ave2-ave)^2;
    S2=p1*d1+p2*d2;
    S=S1/S2;
    if S>Smax
        Smax=S;
        Th=T;
    end
end
ThI = handles.img > Th;
handles.img = ThI;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(Th);

% --------------------------------------------------------------------
function menu1_Callback(hObject, eventdata, handles)
% hObject    handle to menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu2_Callback(hObject, eventdata, handles)
% hObject    handle to menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.s1,'Value',0);
set(handles.s2,'Value',0);
set(handles.list1,'string',[]);
handles.img = handles.oldimg;
guidata(hObject,handles);
axes(handles.image2); 
cla reset ;
imshow(handles.img);
axes(handles.image3); 
cla reset ;
update_image(handles,1);
axes(handles.image4); 
cla reset ;
axes(handles.image5); 
cla reset ;
update_image(handles,3);

% --------------------------------------------------------------------
function menu3_Callback(hObject, eventdata, handles)
% hObject    handle to menu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --------------------------------------------------------------------
function menu1oopen_Callback(hObject, eventdata, handles)
% hObject    handle to menu1oopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.image1); 
%ͼ������
cla reset ;
axes(handles.image2); 
%ͼ������
cla reset ;
[image_name image_path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, '���ļ�');

original_image = [image_path image_name];
new_image      = [image_path image_name];

%��ͼ����ʾ
 if isequal(image_name,0)
    warndlg('��ѡ��һ��ͼƬ','Warning') ;
 else
    img_path = sprintf('\n%s',original_image);
    set(handles.text4,'string',img_path);
 end
 %�ж�ͼ���ļ���ʽ�Ƿ���ȷ
[fpath, fname, fext]=fileparts(image_name);
image_Type = ({'.bmp','.jpg','.jpeg','.png'});
%ͼ���ʽ�жϱ�־Ϊ
image_Type_flag = 0;
image_type_num = length(image_Type);
for i = 1 : image_type_num
    if strcmpi(fext,image_Type{i})
        image_Type_flag = 1;  
        set(handles.image1,'Visible','on');
        set(handles.image2,'Visible','on');
    end
end
if image_Type_flag == 0
    errordlg('ͼ���ʽ���󣬿��ø�ʽ[jpg��jpeg��bmp��png]','��ʽ����');  
end
%����ͼ�񵽽ṹ��
handles.oldimg = imread(original_image);
guidata(hObject,handles);
handles.img    = imread(new_image);
guidata(hObject,handles);
    h = waitbar(0,'Loading your image...');
    for i=1:100
    s=sprintf('������:%d',ceil(i/10));
    waitbar(i/100,h,[s '%']);
    end        
    close(h) 
axes(handles.image2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);
axes(handles.image1); 
cla; 
imshow(handles.img);
%ʾ��������
update_image(handles,1);

% --------------------------------------------------------------------
function menusave_Callback(hObject, eventdata, handles)
% hObject    handle to menusave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.png';'*.bmp';'*.jpg'},'ͼƬ����');
    if filename ~= 0  
       
        %imwrite(handles.img,save,'save.file');
      h=getframe(handles.image2);%picture��GUI�����ͼ������ϵ���
      imwrite(h.cdata,[pathname, filename]);
        msgbox('ͼ���ѳɹ�����','ȷ�ϣ�','warn');
    else
        msgbox('������ȡ��','ȷ��','warn');
    end
% --- Executes on button press in img5.
function img5_Callback(hObject, eventdata, handles)
% hObject    handle to img5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
f=im2double(handles.img);                                 
T=0.5*(min(f(:))+max(f(:)));
done=false;
while ~done
    g=f>=T;
    Tn=0.5*(mean(f(g))+mean(f(~g)));
    done=abs(T-Tn)<0.1;
    T=Tn;
end 
handles.img=im2bw(f,T);
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
%T = round(T);
threshold(T);
% --- Executes on button press in img6.
function img6_Callback(hObject, eventdata, handles)
% hObject    handle to img6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
F=double(handles.img);
minValue=min(min(F));
maxValue=max(max(F));
[row,col]=size(F);
Th=minValue+1; %������ʼ��ֵ
perfactValue=10000000000; %�����ʼΪ�����
for m=minValue+1:maxValue-1
k1=1;k2=1;
for i=1:row
for j=1:col
if F(i,j)<m
C1(1,k1)=F(i,j);k1=k1+1; %C1��
else
C2(1,k2)=F(i,j);k2=k2+1; %C2��
end
end
end
%��C1�����ֵ������ֲ�����
average1=mean(C1); %��ֵ1
variance1=0;
for i=1:k1-1
variance1=variance1+(C1(1,i)-average1)^2; %C1��ķ���
end
variance1 = variance1/(k1-1);
p1=(k1-1)/(row*col); %C1��ķֲ�����
%��C2�����ֵ������ֲ�����
average2=mean(C2); %��ֵ2
variance2=0;
for i=1:k2-1
variance2=variance2+(C2(1,i)-average2)^2; %C2��ķ���
end
p2=(k2-1)/(row*col); %C2��ķֲ�����
variance2 = variance2/(k2-1);
newValue=p1*variance1+p2*variance2;
if (newValue<perfactValue)
Th=m;
perfactValue=newValue;
end
end
I = handles.img > Th;
handles.img = I;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(Th);
% --- Executes on button press in img7.
function img7_Callback(hObject, eventdata, handles)
% hObject    handle to img7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
I=handles.img;
h=imhist(handles.img);         
h1=h;
len=length(h);     
[m,n]=size(I);        
h1=h1/(m*n);          
for i=1:(len-1)
 if h(i)~=0
  P1=sum(h1(1:i));
  P2=sum(h1((i+1):len));
 else 
  continue;
 end
 H1(i)=-(sum(P1.*log(P1)));
 H2(i)=-(sum(P2.*log(P2)));
 H(i)=H1(i)+H2(i);
end
m1=max(H);
Th=find(H==m1);
I = handles.img > Th;
handles.img = I;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(Th);
% --- Executes on button press in img8.
function img8_Callback(hObject, eventdata, handles)
% hObject    handle to img8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����ṹԪ�ء�
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
se = strel('disk',50);
%ִ�д���ñ���˲���ʾͼ��
tophatFiltered = imtophat(handles.img,se);
%ʹ��imadjust����߽���Ŀɼ���
contrastAdjusted = imadjust(tophatFiltered);
handles.img = contrastAdjusted;
handles.img = im2bw(handles.img);
%Th = graythresh(handles.img);
%I = handles.img > Th;
%handles.img = I;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
%threshold(Th);
% --- Executes on button press in img9.
function img9_Callback(hObject, eventdata, handles)
% hObject    handle to img9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize = size(handles.img);
if numel(mysize) > 2
    handles.img = rgb2gray(handles.img);
end
I=double(handles.img);
[m,n]=size(I);
Smax=0;
for T=0:255               
    sum1=0; num1=0;                   
    sum2=0; num2=0;                   
    for i=1:m
        for j=1:n
            if I(i,j)>=T
                sum2=sum2+I(i,j); 
                num2=num2+1;              
            else 
                sum1=sum1+I(i,j); 
                num1=num1+1;                
            end 
        end 
    end  
    ave1=sum1/num1; 
    ave2=sum2/num2;
    S=((ave2-T)*(T-ave1))/(ave2-ave1)^2;
    if(S>Smax)
        Smax=S;
        Th=T;
     end
end
I = handles.img >Th;
%I = handles.img > Th;
handles.img = I;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
threshold(Th);
function  threshold(T)
if T<=1
   T = 255 * T; 
end
thousd = sprintf('��ֵ��%.0f',T);
h=msgbox(thousd,'��ֵ��ʾ');
hs = findobj(h, 'Type', 'text');
set(hs, 'FontSize', 15, 'Unit', 'normal');
waitfor(h);
% --- Executes on selection change in list1.
function list1_Callback(hObject, eventdata, handles)
% hObject    handle to list1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns list1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list1
% --- Executes during object creation, after setting all properties.
function list1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in lu1.
function lu1_Callback(hObject, eventdata, handles)
% hObject    handle to lu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����ͨ�˲���
mysize=size(handles.img);
if numel(mysize)>2
    handles.img = rgb2gray(handles.img);
end
I=handles.img;
I=im2double(I);
M=2*size(I,1);
N=2*size(I,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=80;
H=double(D<=D0);
J=fftshift(fft2(I,size(H,1),size(H,2)));
K=J.*H;
L=ifft2(ifftshift(K));
L=L(1:size(I,1),1:size(I,2));
handles.img=L;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in B1.
function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'sobel');
axes(handles.image2);
cla reset;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in B2.
function B2_Callback(hObject, eventdata, handles)
% hObject    handle to B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'roberts');
axes(handles.image2);
cla reset;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in B3.
function B3_Callback(hObject, eventdata, handles)
% hObject    handle to B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'prewitt');
axes(handles.image2);
cla;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in B4.
function B4_Callback(hObject, eventdata, handles)
% hObject    handle to B4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'log');
axes(handles.image2);
cla;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in B5.
function B5_Callback(hObject, eventdata, handles)
% hObject    handle to B5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'canny');
axes(handles.image2);
cla;
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in lu2.
function lu2_Callback(hObject, eventdata, handles)
% hObject    handle to lu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%������˹��ͨ�˲���
mysize=size(handles.img);
if numel(mysize)>2
    handles.img = rgb2gray(handles.img);
end
I=handles.img;
I=im2double(I);
M=2*size(I,1);%�˲�������
N=2*size(I,2);%�˲�������
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=30;%��ֹƵ��
n=6;%������˹�˲�������
H=1./(1+(D0./D).^(2*n));
J=fftshift(fft2(I,size(H,1),size(H,2)));
K=J.*H;
L=ifft2(ifftshift(K));
L=L(1:size(I,1),1:size(I,2));
handles.img=L;
axes(handles.image2); 
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
update_image(handles,2);
update_image(handles,3);
% --- Executes on button press in lu3.
function lu3_Callback(hObject, eventdata, handles)
% hObject    handle to lu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=fspecial('average');
handles.img=imfilter(handles.img,h,'replicate');
axes(handles.image2);
cla reset;
imshow(handles.img)
guidata(hObject,handles);
mysize=size(handles.img);
if numel(mysize)>2
    update_image(handles,5);
    axes(handles.image4); 
    cla reset ;
else
    update_image(handles,5);
    update_image(handles,4);
end 
% --- Executes on button press in lu4.
function lu4_Callback(hObject, eventdata, handles)
% hObject    handle to lu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hsize=[8 8]; sigma=1.7;
h=fspecial('gaussian',hsize,sigma);
handles.img=imfilter(handles.img,h,'replicate');
axes(handles.image2);
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
mysize=size(handles.img);
if numel(mysize)>2
    update_image(handles,3);
    axes(handles.image4); 
    cla reset ;
else
    update_image(handles,2);
end 
% --- Executes on button press in lu5.
function lu5_Callback(hObject, eventdata, handles)
% hObject    handle to lu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r=medfilt2(handles.img(:,:,1));
g=medfilt2(handles.img(:,:,2));
b=medfilt2(handles.img(:,:,3)); 
handles.img=cat(3,r,g,b);
axes(handles.image2);
cla reset; 
imshow(handles.img);
guidata(hObject,handles);
mysize=size(handles.img);
if numel(mysize)>2
    update_image(handles,3);
    axes(handles.image4); 
    cla reset ;
else
    update_image(handles,2);
end 
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text12.
function text12_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in userrun.
function userrun_Callback(hObject, eventdata, handles)
% hObject    handle to userrun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);
str1 = handles.filename;%'D:/����/userprogram.m'
%addpath('D:/����/userprogram.m');
addpath(genpath('str1'));
%strH = [str0 str1 str2];
oldpath = cd;      %��ȡ��ǰ����Ŀ¼
newpath = str1;
cd(newpath)    %�޸ĵ�ǰ����·��
userprogram(hObject,handles);         %���е����ļ�
cd(oldpath);     %���ص�ԭ���Ĺ���·��
str2 = sprintf('\n%s\n',oldpath);
str3 = sprintf('\n%s\n',newpath);
strnum = [str2 str3];
set(handles.list1, 'String', strnum);
% --- Executes on button press in useropen.
function useropen_Callback(hObject, eventdata, handles)
% hObject    handle to useropen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[Fnameh,Pnameh]=uigetfile('*.m');%Fnameh��ʾ���ļ����ƣ�Pnameh��ʾ���ļ�·��
filename = [Pnameh,Fnameh];%�洢�ļ���·��������
handles.filename = Pnameh;
guidata(hObject,handles);
[fpath, fname, fext]=fileparts(Fnameh);
image_Type = ({'.m',});
%ͼ���ʽ�жϱ�־Ϊ
image_Type_flag = 0;
image_type_num = length(image_Type);
for i = 1 : image_type_num
    if strcmpi(fext,image_Type{i})
        image_Type_flag = 1;  
        %set(handles.image1,'Visible','on');
        set(handles.userrun,'Enable','on');
    end
end
if image_Type_flag == 0
    errordlg('��ʽ����,����.m�ļ�','��ʽ����');  
end
% --- Executes on button press in COM9.
function COM9_Callback(hObject, eventdata, handles)
% hObject    handle to COM9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in clear1.
function clear1_Callback(hObject, eventdata, handles)
% hObject    handle to clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.list1,'string',[]);
function COM3_Callback(hObject, eventdata, handles)
% hObject    handle to COM3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of COM3 as text
%        str2double(get(hObject,'String')) returns contents of COM3 as a double
% --- Executes during object creation, after setting all properties.
function COM3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COM3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in COM4.
function COM4_Callback(hObject, eventdata, handles)
% hObject    handle to COM4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sendbuff = get(handles.COM3,'string');
if get(handles.com1,'value')
    %buff(end+1) = buffstr; 
    %assignin('base','M2',buffstr);
    %oldstr = sprintf('%s',oldbuff);
    newstr = sendbuff;
elseif get(handles.com2,'value')
    newstr = int8(sendbuff);
    newstr = dec2hex(newstr);
    %newstr = sprintf('%s',newstr);
end    
try
   fprintf(handles.scom,newstr);
   liststr = get(handles.list1,'string');
   newstr=strcat('[SEND]:',newstr);
   liststr{end+1} = newstr;
   set(handles.list1,'string',liststr);
catch 
    hs = msgbox('����ʧ�����鴮��');
     ht = findobj(hs, 'Type', 'text');
      set(ht, 'FontSize', 10, 'Unit', 'normal');
        waitfor(hs);
end
% --- Executes on button press in com1.
function com1_Callback(hObject, eventdata, handles)
% hObject    handle to com1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%state1 = get(handles.com1,'value')
%state2 = get(handles.com2,'value')
%str3 = sprintf('\n%d\n',state1);
%str4 = sprintf('\n%d\n',state2);
%strn = [str3 str4];
%set(handles.list1, 'String', str3);
% Hint: get(hObject,'Value') returns toggle state of com1
% --- Executes on button press in COM6.
function COM5_Callback(hObject, eventdata, handles)
% hObject    handle to COM6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of COM6
% --- Executes on button press in COM6.
function COM6_Callback(hObject, eventdata, handles)
% hObject    handle to COM6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of COM6


% --- Executes during object creation, after setting all properties.
function image1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate image1


% --- Executes during object creation, after setting all properties.
function image4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate image4
