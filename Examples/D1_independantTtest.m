% This function takes ~10 seconds on i5 processor and files takes 20 Mo of
% storage

clear
close all
clc

% add source code path
addpath(genpath("../src"))

% data
load ExampleDatas
DATA=ExampleDatas.Ratios(:,1);

% function parameters
effectNames={'Sex'};
EFFET_ind{1}={'M','M','M','F','M','F','F','M','F','M','M','F','F','M','F','F','M','F','F','M'}; % same number than participants
EFFET_rm=[]; % empty

savedir=[];
xlab='Angle (�)';
ylab='Ratio';
xlimits=[30 90];
ylimits=[0 1.2];

% SPM
tic
fctSPM(DATA,EFFET_ind,EFFET_rm,...
    'savedir',savedir,...
    'effectsNames',effectNames,...
    'xlabel',xlab,'ylabel',ylab,...
    'xlimits',xlimits,'ylimits',ylimits);
toc

