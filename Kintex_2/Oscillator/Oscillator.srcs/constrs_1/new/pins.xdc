## Inputs
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {en}]

## Outputs
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {run}]
set_property -dict { PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {out3}]
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {out5}]
set_property -dict { PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports {out7}]
set_property -dict { PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports {out101}]
set_property -dict { PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports {out1001}]
set_property -dict { PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports {out4999}]
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {out1001_M}]

## Gambiarras
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring1001_M/notGate[1]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring4999/out]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring1001/out]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring101/out]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring7/out]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring5/out]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets ring3/out]
