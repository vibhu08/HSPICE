********************************************************************
* Carbon Nanotube Field Effect Transistors
*             HSPICE Model
*	       Version 2.2.1  
*   Copyright The Board Trustees of the Leland Stanford Junior University 2009
*   Albert Lin, Gordon Wan, Jie Deng, Prof. H-S Philip Wong
*   All Rights Reserved.
*   09/09/2008 Last Modified by Albert Lin.
*   Carbon Nanotube Field Effect Transistors Verilog-A implementation
*   based on 
*   "A Circuit-Compatible SPICE model for Enhancement Mode Carbon 
*   Nanotube Field Effect Transistors" by Jie Deng and H-S Philip Wong 
*   Patent Pending.
*   File name: cnfet_sample.sp
********************************************************************
********************************************************************
* LICENSE AGREEMENT
* Stanford Leland Junior University and the authors ("Stanford") 
* provide these model files to you subject to the License Agreement, 
* which may be updated by us from time to time without notice to you. 
* The most-up-to-date License Agreement can be found at
* http://nano.stanford.edu/license.php
********************************************************************
***************************************************
*
*Sample HSPICE Deck
*
***************************************************
.TITLE 'INVERTER'
***************************************************
*For optimal accuracy, convergence, and runtime
***************************************************
.OPTIONS LIST NODE POST
.options POST
.options AUTOSTOP
.options INGOLD=2     DCON=1
.options GSHUNT=1e-12 RMIN=1e-15 
.options ABSTOL=1e-5  ABSVDC=1e-4 
.options RELTOL=1e-2  RELVDC=1e-2 
.options NUMDGT=4     PIVOT=13
.param   TEMP=27
***************************************************
***************************************************
*Include relevant model files
***************************************************
.lib 'CNFET.lib' CNFET
***************************************************
***************************************************
*Beginning of circuit and device definitions
***************************************************
*Some CNFET parameters:
.param Ccsd=0      CoupleRatio=0
.param m_cnt=1     Efo=0.6     
.param Wg=4e-9     Cb=40e-12
.param Lg=32e-9    Lgef=100e-9
.param Vfn=0       Vfp=0
.param m=0        n=19    
.param Hox=4e-9    Kox=16 
***********************************************************************
* Define power supply
***********************************************************************
***********************************************************************
* Main Circuits
*********************************************************************** 
* pFET
XCNT1 Vdd q qb qb PCNFET Lg=32e-9 Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=9  tubes=8
* nFET
XCNT2 qb q GND GND NCNFET  Lg=32e-9 Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=9  tubes=20
* nFET
XCNT3 qb Vdd Vddl Vddl NCNFET Lg=64e-9  Lch=64e-9  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=11 tubes=2
*****************************************************************************************************************
* pFET
XCNT4 Vdd qb q q PCNFET  Lg=32e-9 Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=9  tubes=8
* nFET
XCNT5 q qb GND GND NCNFET Lg=32e-9  Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=9  tubes=20
* nFET
XCNT6 q Vdd Vddl Vddl NCNFET Lg=64e-9  Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=11  tubes=2
*****************************************************************************************************************
* pFET
XCNT22 q wwlb wbl wbl PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=19  tubes=1
* nFET
XCNT11 wbl wwl q q NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=19  tubes=1
*****************************************************************************************************************
* pFET
XCNT16 Vdd qb n5 n5 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=10  tubes=1
* nFET
XCNT15 n5 qb GND GND NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=10  tubes=1
*****************************************************************************************************************
* pFET
XCNT18 rbl rwlb n5 n5 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=19  tubes=1
* nFET
XCNT17 n5 rwl rbl rbl NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=0  n2=19  tubes=1
***********************************************************************
* Measurements
***********************************************************************
Vdd Vdd 0 0.9
Vddl Vddl 0 0.45
vwbl wbl 0 PWL(0ns 0v 5ns 0V 5.1ns .45v 10ns 0.45V 10.1ns 0v 15ns 0v 15.1ns 0.9v 20ns 0.9v 20.1ns 0v 30ns 0v 40ns 0v)
vwwl wwl 0 PWL(0ns 0v 7.5ns 0v 7.6ns .9v 10ns .9v 10.1ns 0v 17.5ns 0v 17.6ns 0.9v 20ns 0.9v 20.1ns 0v 27.5ns 0v 27.6ns .9v 30ns 0.9v 30.1ns 0v 40ns 0v)
vwwlb wwlb 0 PWL(0ns .9v 7.5ns .9v 7.6ns 0v 10ns 0v 10.1ns 0.9v 17.5ns 0.9v 17.6ns 0v 20ns 0v 20.1ns 0.9v 27.5ns 0.9v 27.6ns 0v 30ns 0v 30.1ns 0.9v 40ns 0.9v)
vrwl rwl 0 PWL(0ns 0v 12.5ns 0v 12.6ns 0.9v 15ns 0.9v 15.1ns 0v 22.5ns 0v 22.6ns 0.9v 25ns 0.9v 25.1ns 0v 32.5ns 0v 32.6ns 0.9v 35ns .9v )
vrwlb rwlb 0 PWL(0ns 0.9v 12.5ns 0.9v 12.6ns 0v 15ns 0v 15.1ns 0.9v 22.5ns 0.9v 22.6ns 0v 25ns 0v 25.1ns 0.9v 32.5ns 0.9v 32.6ns 0v 35ns 0v )
.TRAN 0.1ns 40ns 
.PRINT V(q) V(qb) V(rbl) 
***********************************************************************
.end 




