% This function takes ~5 seconds on i5 processor and files takes 1.5 Mo of space

clear
close all
clc

% path (change to your own path)
addpath(genpath('C:\Users\LIBM_yb\Google Drive\Th�se\MATLAB\library_matlab\FCT_SPM'));

% data
load ExampleDatas
DATA=ExampleDatas.Ratios(:,[1 4]);

% function parameters
EFFET_ind=[]; % empty
EFFET_rm{1}={'D','G'}; % Side
effectNames={'Side'};

savedir='Results//1D_pairedTtest';
xlab='Angle (�)';
ylab='Ratio';
xlimits=[30 90];
colorLine=[rgb('black'); rgb('magenta')];


% SPM
fctSPM(DATA,EFFET_ind,EFFET_rm,...
    'savedir',savedir,...
    'effectsNames',effectNames,...
    'xlabel',xlab,'ylabel',ylab,...
    'xlimits',xlimits,'colorLine',colorLine);
