

function varargout = SoundRecorder(varargin)
% SOUNDRECORDER MATLAB code for SoundRecorder.fig
%      SOUNDRECORDER, by itself, creates a new SOUNDRECORDER or raises the existing
%      singleton*.
%
%      H = SOUNDRECORDER returns the handle to a new SOUNDRECORDER or the handle to
%      the existing singleton*.
%
%      SOUNDRECORDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOUNDRECORDER.M with the given input arguments.
%
%      SOUNDRECORDER('Property','Value',...) creates a new SOUNDRECORDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SoundRecorder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SoundRecorder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SoundRecorder

% Last Modified by GUIDE v2.5 16-Aug-2018 14:07:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SoundRecorder_OpeningFcn, ...
                   'gui_OutputFcn',  @SoundRecorder_OutputFcn, ...
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


% --- Executes just before SoundRecorder is made visible.
function SoundRecorder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SoundRecorder (see VARARGIN)

% Choose default command line output for SoundRecorder
handles.output = hObject;
handles.recObj=audiorecorder(48000,16,2,-1);
% handles.recObj.TimerFcn={@RecDisplay,handles};
handles.recObj.TimerFcn={@redisplay,handles};
handles.recObj.TimerPeriod=0.25;
handles.playSpeed=1;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SoundRecorder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SoundRecorder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record(handles.recObj);
% redisplay(handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.recObj);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.myRecording=getaudiodata(handles.recObj);
handles.playObj=audioplayer(handles.myRecording,handles.playSpeed*handles.recObj.SampleRate);
play(handles.playObj)
guidata(hObject,handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uiputfile(['soundDemo_Speed',num2str(handles.playSpeed),'.wav'],'Save recorded sound');
if file
    audiowrite([path,file],handles.myRecording,handles.playSpeed*handles.recObj.SampleRate);
end

function redisplay(hObject, eventdata, handles)
handles.myRecording=getaudiodata(handles.recObj);
% axex=handles.axes1;
% axes();
length_1 = length(handles.myRecording);
plot(handles.axes1,(1:length_1)/handles.recObj.SampleRate,handles.myRecording(:,1),'r');%��
plot(handles.axes2,(1:length_1)/handles.recObj.SampleRate,handles.myRecording(:,2),'g');%��
drawnow;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.playSpeed=str2double(get(hObject,'String'));
guidata(hObject,handles)

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
