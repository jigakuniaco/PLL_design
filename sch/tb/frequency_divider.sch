v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -100 -640 700 -240 {flags=graph
y1=0
y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.3734487e-05
x2=1.8238086e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk
div_clk"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
N -350 40 -350 60 {lab=VCC}
N -350 170 -350 190 {lab=CLK}
N 300 -30 305 -30 {lab=DIV_CLK}
N -95 -30 -80 -30 {lab=CLK}
C {lab_pin.sym} -95 -30 0 0 {name=p1 lab=CLK}
C {vsource.sym} -350 90 0 0 {name=VVCC value='VCC' savecurrent=false}
C {lab_pin.sym} -350 120 0 0 {name=p2 lab=0}
C {lab_pin.sym} -350 40 0 0 {name=p41 lab=VCC}
C {lab_pin.sym} -80 10 0 0 {name=p3 lab=VCC}
C {lab_pin.sym} 305 -30 0 1 {name=p10 lab=DIV_CLK}
C {code_shown.sym} -30 160 0 0 {name=COMMANDS only_toplevel=false value="
.param VCC=3.3
.control
  save all
  tran 10n 250u
  remzerovec
  write frequency_divider.raw

  *plot v(DIV_CLK) v(CLK)
.endc
"}
C {launcher.sym} 510 220 0 0 {name=h1
descr="Build Icarus Verilog object" 
tclcommand="execute 1 sh -c \\"cd $netlist_dir; iverilog -o freq_divider [abs_sym_path ../design/verilog/freq_divider.v]\\""
}
C {vsource.sym} -350 220 0 0 {name=VCLOCK value="pulse 0 'VCC' 500n 10n 10n 490n 1u"}
C {lab_pin.sym} -350 250 0 0 {name=p6 lab=0}
C {lab_pin.sym} -350 170 0 0 {name=p13 lab=CLK}
C {launcher.sym} -40 -210 0 0 {name=h5
descr="load waves"
tclcommand="xschem raw_read $netlist_dir/frequency_divider.raw tran"
}
C {dac_bridge.sym} 270 -30 0 0 {name=A2 dac_bridge_model= dac_buff

device_model=".model dac_buff dac_bridge input_load=1e-15 t_rise=10n t_fall=10n
+ out_low=0 out_high=3.3"
}
C {/home/jh012/open_source_circuit_design/pll_gf180_custom/sch/sym/v_freq_divider.sym} 80 10 0 0 {name=A1 model=freq_divider}
