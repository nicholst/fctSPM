% This function takes ~360 seconds on i5 processor and files takes 175 Mo of space
% don't forget to add the source code path

clear
close all
clc

% data
load ExampleDatas
DATA=ExampleDatas.Ratios;

% parameters
effectNames={'Sex','Speed','Side'};

independantEffects{1}={'M','M','M','F','M','F','F','M','F','M','M','F','F','M','F','F','M','F','F','M'}; % same number than participants
colorLine{1}=[rgb('cyan'); rgb('magenta')];

repeatedMeasuresEffects{1}={'RC60','RC180','RFKF','RFKE','RC60','RC180','RFKF','RFKE'};
colorLine{2}=[rgb('green'); rgb('blue'); rgb('red'); rgb('black')];

repeatedMeasuresEffects{2}={'Right','Right','Right','Right','Left','Left','Left','Left'};
colorLine{3}=[rgb('gray'); rgb('darkgray')];

% There are 20 subjects
% ANOVA3 does not accept unbalanced data (10 males, 10 females)

savedir=[];
savedir2=[];
xlab='Angle (°)';
ylab='Ratio';
xlimits=[30 90];
ylimits=[0 1.6];
nTicksY=9;
nTicksX=7;

% SPM
tic
spmAnalysis=fctSPM(DATA,independantEffects,repeatedMeasuresEffects,...
    'savedir',savedir,...
    'effectsNames',effectNames,...
    'xlabel',xlab,'ylabel',ylab,'nTicksX',nTicksX,...
    'xlimits',xlimits,'ylimits',ylimits,'nTicksY',nTicksY,'colorline',colorLine);
toc

tic
spmAnalysis2=fctSPMS(DATA,independantEffects,repeatedMeasuresEffects,'effectsNames',effectNames);
toc

tic
saveNplot(spmAnalysis2,...
    'savedir',savedir2,...
    'xlabel',xlab,'ylabel',ylab,'nTicksX',nTicksX,...
    'xlimits',xlimits,'ylimits',ylimits,'nTicksY',nTicksY,'colorline',colorLine);
toc

