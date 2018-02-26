%% Motor and Prop Selection

clear all
close all
clc

kv = 192;
peff = .8;
pitch = 4.7;
diam = 9;

V = 22.2;
RPM = kv*V;
Vp = RPM*pitch*peff;

T = pitch/Vp