function varargout = RGB2gGrey(varargin)
% RGB2GGREY MATLAB code for RGB2gGrey.fig
%      RGB2GGREY, by itself, creates a new RGB2GGREY or raises the existing
%      singleton*.
%
%      H = RGB2GGREY returns the handle to a new RGB2GGREY or the handle to
%      the existing singleton*.
%
%      RGB2GGREY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB2GGREY.M with the given input arguments.
%
%      RGB2GGREY('Property','Value',...) creates a new RGB2GGREY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB2gGrey_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB2gGrey_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB2gGrey

% Last Modified by GUIDE v2.5 15-Aug-2018 14:21:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB2gGrey_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB2gGrey_OutputFcn, ...
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


% --- Executes just before RGB2gGrey is made visible.
function RGB2gGrey_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB2gGrey (see VARARGIN)

% Choose default command line output for RGB2gGrey
handles.output = hObject;
handles.imgfilename=[];
handles.imgdata=[];
handles.imgoutput=[];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB2gGrey wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB2gGrey_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[imgfilename imgpathname]=uigetfile({'*.jpg;*.png'},'select a RGB image');
if imgfilename
    imgdata=imread([imgpathname imgfilename]);
    
   % image(handles.axes1,imgdata)
   axes(handles.axes1); image(imgdata);
    handles.imgfilename=imgfilename;
    handles.imgdata=imgdata;
end
guidata(hObject,handles)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if~isempty(handles.imgfilename)
    imgoutput=rgb2gray(handles.imgdata);
   % image(handles.axes2,imgoutput)
   axes(handles.axes2);
   image(imgoutput)
    colormap(handles.axes2,gray(256))
    handles.imgoutput=imgoutput; 
end
guidata(hObject,handles)