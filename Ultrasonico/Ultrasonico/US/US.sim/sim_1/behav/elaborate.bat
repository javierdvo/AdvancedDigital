@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xelab  -wto 6179d7c2a3a54b63890a54d79c1dd14a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot unknown_behav xil_defaultlib.unknown -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
