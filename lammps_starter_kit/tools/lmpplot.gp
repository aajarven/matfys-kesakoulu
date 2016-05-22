
#########################################################
#                                                       #
#  Gnuplot script for plotting lammps log file data.    #
#  Just load it in gnuplot:                             #
#                                                       #
#     gnuplot> load './lmpplot.gp'                      #
#                                                       #
#                                                       #
#  lammps data line format should be:                   #
#      'ec' Step Temp PotEng TotEng Press Volume        #
#                                                       #
#  This can be accomplished by using the following      #
#  lammps commands:                                     #
#                                                       #
#  thermo_style custom step temp pe etotal press vol    #
#  thermo_modify line one flush yes     &               #
#                format int "ec %8d"    &               #
#                format float "%20.10g"                 #
#                                                       #
#                                                       #
#   A.Kuronen, 2010                                     #
#                                                       #
#########################################################

reset

DF='../case1/case1.log'    # LAMMPS log file name

##########################################################
# Output to EPS file
#set term postscript portrait enhanced font "Arial" 10
#set output "lmpplot.eps"
##########################################################

##########################################################
# Output to screen
set term wxt enhanced font "Arial,8"
##########################################################

SX=1.0;
SY=1.0; 
XO=0.0;
YO=0.0;
VM=0.8;
LM=10.0;
HM=5.0;

set bmargin VM; set tmargin VM; set lmargin LM; set rmargin HM
set size SX,SY
set origin XO,YO

LW=0.2
PS=0.4

MPYS=0.195;       # subplot y-size
MPDY=0.19;        # subplot y-shift
MPYO=0.025;       # total y-offset
set multiplot
set size 1.0,MPYS

set xtics scale 0.7
set ytics scale 0.7

set xtics format "%.0f" 
set origin 0.0,MPYO; 
plot DF using 1:2 'ec %lf %lf %lf %lf %lf %lf' with lp \
     lw LW lt rgb "blue"  pt 7 ps PS title "Temp"

set xtics format ""
set origin 0.0,MPDY+MPYO;
plot DF using 1:3 'ec %lf %lf %lf %lf %lf %lf' with lp \
     lw LW lt rgb "red"   pt 7 ps PS title "Epot"

set xtics
set origin 0.0,2*MPDY+MPYO;
plot DF using 1:4 'ec %lf %lf %lf %lf %lf %lf' with lp \
     lw LW lt rgb "green" pt 7 ps PS title "Etot"

set xtics
set origin 0.0,3*MPDY+MPYO;
plot DF using 1:5 'ec %lf %lf %lf %lf %lf %lf' with lp \
     lw LW lt rgb "cyan"  pt 7 ps PS title "Press"

set xtics
set origin 0.0,4*MPDY+MPYO
plot DF using 1:6 'ec %lf %lf %lf %lf %lf %lf' with lp \
     lw LW lt rgb "black"  pt 7 ps PS title "Vol"

unset multiplot
