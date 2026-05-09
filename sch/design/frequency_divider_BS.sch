v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -100 -640 700 -240 {flags=graph
y1=3.3
y2=3.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00025
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vcc
"
color=8
dataset=-1
unitx=1
logx=0
logy=0
}
N -350 40 -350 60 {lab=VCC}
N -350 170 -350 190 {lab=CLK}
N 340 -20 345 -20 {lab=DIV_CLK}
N -55 -20 -40 -20 {lab=CLK}
C {vsource.sym} -350 90 0 0 {name=VVCC value='VCC' savecurrent=false}
C {lab_pin.sym} -350 120 0 0 {name=p2 lab=0}
C {lab_pin.sym} -350 40 0 0 {name=p41 lab=VCC}
C {code_shown.sym} -30 160 0 0 {name=COMMANDS only_toplevel=false value="
.param VCC=3.3
.control
  save all
  tran 10n 250u
  remzerovec
  write frequency_divider.raw

  plot v(DIV_CLK) v(CLK)
.endc
"}
C {vsource.sym} -350 220 0 0 {name=VCLOCK value="pulse 0 'VCC' 500n 10n 10n 490n 1u"}
C {lab_pin.sym} -350 250 0 0 {name=p6 lab=0}
C {lab_pin.sym} -350 170 0 0 {name=p13 lab=CLK}
C {launcher.sym} -40 -210 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/frequency_divider.raw tran"
}
C {lab_pin.sym} -55 -20 0 0 {name=p4 lab=CLK}
C {lab_pin.sym} -40 20 0 0 {name=p5 lab=VCC}
C {lab_pin.sym} 345 -20 0 1 {name=p7 lab=DIV_CLK}
C {dac_bridge.sym} 310 -20 0 0 {name=A1 dac_bridge_model= dac_buff

device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=10n t_fall=10n
+ out_low=0 out_high=3.3"
}
C {v_freq_divider_BS.sym} 120 20 0 0 {name=ADUT_BS model=dut_BS

***Icarus_verilog***
device_model=".model dut_BS d_cosim simulation=\\"ivlng\\" sim_args=[\\"freq_divider_BS\\"] 
+ vlow=0.8 vhigh=2.0 
+ v0=0 v1=3.3 
+ rise=1n fall=1n"

***Verilator***
*device_model=".model dut d_cosim simulation=\\"./adc.so\\""

tclcommand="edit_file ./freq_divider_BS.v"}
C {launcher.sym} 510 260 0 0 {name=h2
descr="Build Icarus Verilog object (BS)" 
tclcommand="execute 1 sh -c \\"cd $netlist_dir; iverilog -o freq_divider_BS [abs_sym_path freq_divider_BS.v]\\""
}
