#!/bin/ksh
# This script was generated Sat Mar 16 17:43:24 2024 by:
#
# Program: /home/buet/cadence/ASSURA41/tools/assura/bin/32bit/RCXspice
# Version: 3.1.5
# Created: Wed Dec 8 11:40:37 EST 2004
#
#/home/buet/cadence/ASSURA41/tools/assura/bin/32bit/RCXspice -techdir \
#	/home/buet/cadence/gpdk090_v4.6/assura/rcx -newlvs \
#	/home/buet/Desktop/inv/test1.xcn -assura_run_dir \
#	/home/buet/Desktop/inv -assura_run_name test1 -rcxdir \
#	/home/buet/Desktop/inv/test1 -xy_coordinates c,r -type full \
#	-temperature 25.0 -sub_node_char # -res_models no -rcxfs_type none \
#	-parasitic_res_models comment -parasitic_cap_models no \
#	-output_net_name_space layout -output \
#	/home/buet/Desktop/inv/test1/extview.tmp -net_name_space layout -minR \
#	0.001 -max_merged_via_size auto -max_fracture_length infinite \
#	-macro_cell -hierarchy_delimiter / -fracture_length_units microns \
#	-df2 -cap_models no -cap_ground gnd -cap_extract_mode decoupled \
#	-cap_coupling_factor 1.0 -array_vias_spacing auto -extract both
set -e
set -v
##=======================================================
##ADD_EXPLICIT_VIAS=N
##ADD_BULK_TERMINAL=N
##AGDS_FILE=/dev/null
##AGDS_LAYER_MAP_FILE=/dev/null
##AGDS_SPICE_FILE=/dev/null
##AGDS_TEXT_LAYERS=
##ARRAY_VIAS_SPACING=
##ASSURA_RUN_DIR=/home/buet/Desktop/inv
##ASSURA_RUN_NAME=test1
##BLACK_BOX_CELLS=/dev/null
##BREAK_WIDTH=
##CAP_COUPLING_FACTOR=1.0
##CAP_EXTRACT_MODE=decoupled
##CAP_GROUND=gnd
##CAP_MODELS=no
##DANGLINGR=N
##DEVICE_FINGER_DELIMITER='@'
##DF2=Y
##DRACULA_RUN_DIR=
##DRACULA_RUN_NAME=
##EXCLUDE_FLOAT_LIMIT=
##EXCLUDE_FLOAT_DECOPULING_FACTOR=
##EXCLUDE_FLOATING_NETS=N
##EXCLUDE_NETS_REDUCERC=/dev/null
##EXCLUDE_SELF_CAPS=N
##EXTRACT=both
##EXTRACT_MOS_DIFFUSION_AP=N
##EXTRACT_MOS_DIFFUSION_HIGH=
##EXTRACT_MOS_DIFFUSION_RES=N
##FILTER_SIZE=2.0
##FIXED_NETS_FILE=/dev/null
##FMAX=
##FRACTURE_LENGTH_UNITS=microns
##FREQUENCY_FILE=/dev/null
##GROUND_NETS=
##GROUND_NETS_FILE=/dev/null
##HCCI_DEV_PROP=7
##HCCI_INST_PROP=6
##HCCI_NET_PROP=5
##HCCI_RULE_FILE=
##HCCI_RUN_DIR=
##HCCI_RUN_NAME=
##HEADER_FILE=/dev/null
##HIERARCHY_DELIMITER='/'
##HRCX_CELLS_FILE=/dev/null
##IMPORT_GLOBALS=Y
##LADDER_NETWORK=N
##LVS_SOURCE=assura
##M_FACTORR=
##M_FACTORW=N
##MACRO_CELL=Y
##MAX_FRACTURE_LENGTH=infinite
##MAX_SIGNALS=
##MERGE_PARALLEL_R=N
##MINC=
##MINC_BY_PERCENTAGE=
##MINR=0.001
##NET_NAME_SPACE=layout
##NETS_FILE=/dev/null
##OUTPUT=/home/buet/Desktop/inv/test1/extview.tmp
##OUTPUT_NET_NAME_SPACE=layout
##PARASITIC_CAP_MODELS=no
##PARASITIC_RES_MODELS=comment
##PARASITIC_RES_LENGTH=N
##PARASITIC_RES_WIDTH=N
##PARASITIC_RES_WIDTH_DRAWN=N
##PARTIALCAPBLOCKING=N
##PARTIAL_BLOCKING=N
##PEEC=N
##PIN_ORDER_FILE=/dev/null
##PIPE_ADVGEN=
##PIPE_SPICE2DB=
##POWER_NETS=
##POWER_NETS_FILE=/dev/null
##RC_FREQUENCY=
##RCXDIR=/home/buet/Desktop/inv/test1
##RCXFS_HIGH=N
##RCXFS_NETS_FILE=/dev/null
##RCXFS_TYPE=none
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_VIA_OFF=N
##REDUCERC=N
##REGION_LIMIT=
##RES_MODELS=no
##RISE_TIME=
##SAVE_FILL_SHAPES=N
##SINGLE_CAP_EDSPF=N
##SEISMIC=N
##SHOW_DIODES=N
##SKIN_FREQUENCY=
##SPEF=N
##SPEF_UNITS=
##SPLIT_PINS=N
##SPLIT_PINS_DISTANCE=
##SUB_NODE_CHAR='#'
##SUBSTRATE_PROFILE=/dev/null
##SUBSTRATE_STAMPING_OFF=N
##TEMPDIR=/tmp
##TEMPERATURE=25.0
##TYPE=full
##USER_REGION=/dev/null
##VARIANT_CELL_FILE=/dev/null
##VIA_EFFECT_OFF=N
##VIRTUAL_FILL=
##XREF=/dev/null,/dev/null
##XY_COORDINATES=c,r
##=======================================================

CASE_SENSITIVE=TRUE
export CASE_SENSITIVE
TEMPDIR=`setTempDir /tmp`
export TEMPDIR
DEVICE_FINGER_DELIMITER='@'
HIERARCHY_DELIMITER='/'
cd /home/buet/Desktop/inv/test1
cat <<ENDCAT> caps2dversion
* caps2d version: 10
ENDCAT
cat <<ENDCAT> flattransUnit.info
meters
ENDCAT
cat <<ENDCAT> topcellxcn.info
/home/buet/Desktop/inv/test1.xcn
ENDCAT

#==========================================================#
# Generate RCX input data from Assura LVS database
#==========================================================#

vdbToRcx /home/buet/Desktop/inv test1 -unit meters -- -V1 -H satfile -r \
	/home/buet/Desktop/inv/test1.xcn -df2 -xgl

#==========================================================#
# Generate power list
#==========================================================#

cat global.net > power_list

#==========================================================#
# Ensure vias do not extend beyond routing
#==========================================================#

geom -V Metal1_v Metal1_p metal1_conn - Metal1_v,111,i,2
geom -V cont_poly metal1_conn poly_conn - cont_poly,111,i,2
geom -V cont_pdiff metal1_conn pdiff_conn - cont_pdiff,111,i,2
geom -V cont_ndiff metal1_conn ndiff_conn - cont_ndiff,111,i,2
geom -V ptap pdiff_conn - ptap_pdiff_conn_ovia,11,i,1
geom -V psubstrate ptap - psubstrate_ptap_ovia,11,i,1
geom -V ntap ndiff_conn - ntap_ndiff_conn_ovia,11,i,1
geom -V nwell_conn ntap - nwell_conn_ntap_ovia,11,i,1

#==========================================================#
# Flatten net file, routing, via and device layers
#==========================================================#

SAVEDIR=`beginFlattenInputs`
export SAVEDIR
/bin/mv -f NET h_NET
flatnet -V -li -h '/' h_NET NET
netprint -V -N1 power_list:power_list_nums NET
flattenTransistorData _nmos_12_MOS_1 meters
flattenTransistorData _pmos_12_MOS_7 meters
flattenLayers -m metal1_conn poly_conn ndiff_conn pdiff_conn nwell_conn \
	psubstrate Metal1_v Metal1_p cont_poly cont_pdiff cont_ndiff \
	ptap_pdiff_conn_ovia ptap psubstrate_ptap_ovia ntap_ndiff_conn_ovia \
	ntap nwell_conn_ntap_ovia
endFlattenInputs

#==========================================================#
# Initialize CAP_GROUND variable
#==========================================================#

CAP_GROUND=`findCapGround -g gnd -l psubstrate NET`
echo "CAP_GROUND=" ${CAP_GROUND}

#==========================================================#
# Segregate interconnect into resistive and non-resistive
#==========================================================#

selectNetsByNumber power_list_nums Metal1_p p_rMetal1_p np_rMetal1_p
selectNetsByNumber power_list_nums metal1_conn p_rmetal1_conn np_rmetal1_conn
selectNetsByNumber power_list_nums ndiff_conn p_rndiff_conn np_rndiff_conn
selectNetsByNumber power_list_nums ntap p_rntap np_rntap
selectNetsByNumber power_list_nums nwell_conn p_rnwell_conn np_rnwell_conn
selectNetsByNumber power_list_nums pdiff_conn p_rpdiff_conn np_rpdiff_conn
selectNetsByNumber power_list_nums poly_conn p_rpoly_conn np_rpoly_conn
selectNetsByNumber power_list_nums psubstrate p_rpsubstrate np_rpsubstrate
selectNetsByNumber power_list_nums ptap p_rptap np_rptap
selectNetsByNumber power_list_nums cont_poly p_rcont_poly np_rcont_poly

#==========================================================#
# Create resistor cut regions between resistive
# interconnect levels
#==========================================================#

mergevia -V -cnt np_rcont_poly rcont_poly - np_rmetal1_conn np_rpoly_conn

#==========================================================#
# Create resistive interconnect MOSFET terminals
#==========================================================#

createNRMosfetGateTerminal _nmos_12_MOS_1 np_rpoly_conn _nmos_12_MOS_1_mgvia
createNRMosfetGateTerminal _pmos_12_MOS_7 np_rpoly_conn _pmos_12_MOS_7_mgvia

#==========================================================#
# Prepare non-resistive text layers
#==========================================================#

flatlabel -V -tc -F Metal1_p_pintext Metal1_p_pintext_nr_labs

#==========================================================#
# Assign net numbers to cut regions
#==========================================================#

connect -V -relocate NET np_rMetal1_p:np_rMetal1_p.conn \
	np_rnwell_conn:np_rnwell_conn.conn np_rpsubstrate:np_rpsubstrate.conn \
	np_rndiff_conn:np_rndiff_conn.conn np_rpdiff_conn:np_rpdiff_conn.conn \
	np_rntap:np_rntap.conn np_rptap:np_rptap.conn rcont_poly \
	_nmos_12_MOS_1_mgvia _pmos_12_MOS_7_mgvia - ntap_ndiff_conn_ovia,6,4 \
	nwell_conn_ntap_ovia,2,6 psubstrate_ptap_ovia,3,7 \
	ptap_pdiff_conn_ovia,7,5 - Metal1_p_pintext_nr_labs,1

#==========================================================#
# Assign net numbers to resistor vias
#==========================================================#

geom -V Metal1_v np_rMetal1_p.conn - tmp_rMetal1_v,11,i,2
mergevia -V -i -cnt tmp_rMetal1_v rMetal1_v - np_rmetal1_conn np_rMetal1_p
/bin/rm -f tmp_rMetal1_v
geom -V cont_ndiff np_rndiff_conn.conn - tmp_rcont_ndiff,11,i,2
mergevia -V -i -cnt tmp_rcont_ndiff rcont_ndiff - np_rmetal1_conn \
	np_rndiff_conn
/bin/rm -f tmp_rcont_ndiff
geom -V cont_pdiff np_rpdiff_conn.conn - tmp_rcont_pdiff,11,i,2
mergevia -V -i -cnt tmp_rcont_pdiff rcont_pdiff - np_rmetal1_conn \
	np_rpdiff_conn
/bin/rm -f tmp_rcont_pdiff

#==========================================================#
# Assign net numbers to nonresistive layers
#==========================================================#

epick -V -reo -e rMetal1_v -e rcont_ndiff -e rcont_pdiff np_rndiff_conn.conn \
	tmp_ndiff_conn
epick -V -reo -e tmp_ndiff_conn -c np_rndiff_conn.conn tmp1_ndiff_conn
geom -V tmp1_ndiff_conn np_rndiff_conn - tmp1_ndiff_conn,11,i,2
geom -V tmp_ndiff_conn,tmp1_ndiff_conn - np_rndiff_conn,1,i,1
/bin/rm -f tmp_ndiff_conn tmp1_ndiff_conn
epick -V -reo -e rMetal1_v -e rcont_ndiff -e rcont_pdiff np_rpdiff_conn.conn \
	tmp_pdiff_conn
epick -V -reo -e tmp_pdiff_conn -c np_rpdiff_conn.conn tmp1_pdiff_conn
geom -V tmp1_pdiff_conn np_rpdiff_conn - tmp1_pdiff_conn,11,i,2
geom -V tmp_pdiff_conn,tmp1_pdiff_conn - np_rpdiff_conn,1,i,1
/bin/rm -f tmp_pdiff_conn tmp1_pdiff_conn
epick -V -reo -e rMetal1_v -e rcont_ndiff -e rcont_pdiff np_rnwell_conn.conn \
	tmp_nwell_conn
epick -V -reo -e tmp_nwell_conn -c np_rnwell_conn.conn tmp1_nwell_conn
geom -V tmp1_nwell_conn np_rnwell_conn - tmp1_nwell_conn,11,i,2
geom -V tmp_nwell_conn,tmp1_nwell_conn - np_rnwell_conn,1,i,1
/bin/rm -f tmp_nwell_conn tmp1_nwell_conn
epick -V -reo -e rMetal1_v -e rcont_ndiff -e rcont_pdiff np_rpsubstrate.conn \
	tmp_psubstrate
epick -V -reo -e tmp_psubstrate -c np_rpsubstrate.conn tmp1_psubstrate
geom -V tmp1_psubstrate np_rpsubstrate - tmp1_psubstrate,11,i,2
geom -V tmp_psubstrate,tmp1_psubstrate - np_rpsubstrate,1,i,1
/bin/rm -f tmp_psubstrate tmp1_psubstrate

#==========================================================#
# Generate resistor command file
#==========================================================#

cat <<ENDCAT> res.mod
np_rmetal1_conn,0.08,mt1(i)
+:t,10,10,10,rcont_poly
+:t,15,15,15,rcont_pdiff
+:t,15,15,15,rcont_ndiff
np_rpoly_conn,10.0,poly(j)
ENDCAT

#==========================================================#
# Process text layers
#==========================================================#

flatlabel -V  -tc -F Metal1_p_pintext L1T0

#==========================================================#
# Parasitic R extraction with default precision
#==========================================================#

rex -V -m -pd -I'#' -u -N NET -e2 -Ply np_rpoly_conn -rP res.mod \
	np_rpoly_conn::poly_cut np_rmetal1_conn::mt1_cut - rMetal1_v,2 \
	rcont_ndiff,2,t rcont_pdiff,2,t rcont_poly,1,2,t \
	_nmos_12_MOS_1_mgvia,1,z _pmos_12_MOS_7_mgvia,1,z - L1T0,2,I

#==========================================================#
# Reconnect MOSFET devices
#==========================================================#

reconnect -V -n NET -se2 mwires.res -t \
	_nmos_12_MOS_1.trans:_nmos_12_MOS_1.transr _nmos_12_MOS_1 \
	np_rndiff_conn,_nmos_12_MOS_1_mgvia,np_rpsubstrate -t \
	_pmos_12_MOS_7.trans:_pmos_12_MOS_7.transr _pmos_12_MOS_7 \
	np_rpdiff_conn,_pmos_12_MOS_7_mgvia,np_rnwell_conn
changeTransFileNameAP _nmos_12_MOS_1.trans _nmos_12_MOS_1.transr
changeTransFileNameAP _pmos_12_MOS_7.trans _pmos_12_MOS_7.transr

#==========================================================#
# Form capacitance layers for resistive process layers
#==========================================================#

geom -V p_rpoly_conn,np_rpoly_conn - poly,1,i,1
geom -V p_rmetal1_conn,np_rmetal1_conn - mt1,1,i,1

#==========================================================#
# Form capacitance layers for non-resistive process layers
#==========================================================#

emerge -V p_rndiff_conn np_rndiff_conn ndiff_conn
emerge -V p_rpdiff_conn np_rpdiff_conn pdiff_conn
geom -V ndiff_conn,pdiff_conn - diff,1,i,1
createEmptyLayer mt9
createEmptyLayer mt8
createEmptyLayer mt7
createEmptyLayer mt6
createEmptyLayer mt5
createEmptyLayer mt4
createEmptyLayer mt3
createEmptyLayer mt2

#==========================================================#
# Form substrate
#==========================================================#

geom -V p_rnwell_conn,np_rnwell_conn - nwell_conn,1,i,1
geom -V p_rpsubstrate,np_rpsubstrate - psubstrate,1,i,1
/bin/cp -f psubstrate psubstrate.df2
xytoebbox -V -g 13.202 -e mt9,mt8,mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,nwell_conn,psubstrate xg_psubstrate
grow -V 0.001 psubstrate g_psubstrate
geom -V xg_psubstrate g_psubstrate - tmp_psubstrate,10
epick -V -reo -D ${CAP_GROUND} tmp_psubstrate pick_psubstrate
emerge -V pick_psubstrate psubstrate tmp1_psubstrate
geom -V tmp1_psubstrate - psubstrate,1,i,1
/bin/rm -f g_psubstrate xg_psubstrate tmp_psubstrate tmp1_psubstrate pick_psubstrate
grow -V 0.001 nwell_conn g_nwell_conn
geom -V psubstrate g_nwell_conn - psubstrate,10,i,1
geom -V nwell_conn,psubstrate - sti,1,i,1
geom -V sti diff - sti,10,i,1

#==========================================================#
# Create sip/sw3d/cn3d capacitance data files
#==========================================================#

cat <<ENDCAT> sip.cmd
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc poly,mt1 -n 1.4 -i 0,1.401 -b \
	mt1,poly,diff,sti -t mt3,mt4,mt5,mt6,mt7,mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt2,key 0,1.4 - mt2.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt1,mt2 -n 2.1 -i 0,2.101 -b \
	mt2,mt1,poly,diff,sti -t mt4,mt5,mt6,mt7,mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt3,key 0,2.1 - mt3.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt2,mt3 -n 2.1 -i 0,2.101 -b \
	mt3,mt2,mt1,poly,diff,sti -t mt5,mt6,mt7,mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt4,key 0,2.1 - mt4.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt3,mt4 -n 2.1 -i 0,2.101 -b \
	mt4,mt3,mt2,mt1,poly,diff,sti -t mt6,mt7,mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt5,key 0,2.1 - mt5.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt4,mt5 -n 2.1 -i 0,2.101 -b \
	mt5,mt4,mt3,mt2,mt1,poly,diff,sti -t mt7,mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt6,key 0,2.1 - mt6.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt5,mt6 -n 2.1 -i 0,2.101 -b \
	mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -t mt8,mt9 -j 0.14 -Maxw 2.1 -p \
	mt7,key 0,2.1 - mt7.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt6,mt7 -n 6.6 -i 0,6.601 -b \
	mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -t mt9 -j 0.44 -Maxw 6.6 -p \
	mt8,key 0,6.6 - mt8.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc mt7,mt8 -n 6.6 -i 0,6.601 -b \
	mt8,mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -j 0.44 -Maxw 6.6 -p \
	mt9,key 0,6.6 - mt9.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -cp poly,allGate,diff -n 1.2 -i \
	0,1.201 -b diff,sti -t mt1,mt2,mt3,mt4,mt5,mt6,mt7,mt8,mt9 -j 0.1 \
	-Maxw 1.5 -p poly,key 0,1.2 - poly.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc poly -n 1.2 -i 0,1.201 -b \
	poly,diff,sti -t mt2,mt3,mt4,mt5,mt6,mt7,mt8,mt9 -j 0.12 -Maxw 1.8 -p \
	mt1,key 0,1.2 - mt1.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -b \
	mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -Maxw 6.6 -p \
	mt8,key,mt9,key 0,6.6,0 - mt8_mt9.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt9 -b \
	mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -Maxw 6.6 -p mt7,key,mt9,key \
	0,6.6,0 - mt7_mt9.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -t mt9 -Maxw 6.6 -p \
	mt7,key,mt8,key 0,6.6,0 - mt7_mt8.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt8 -b \
	mt5,mt4,mt3,mt2,mt1,poly,diff,sti -t mt9 -Maxw 6.6 -p mt6,key,mt8,key \
	0,6.6,0 - mt6_mt8.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b mt5,mt4,mt3,mt2,mt1,poly,diff,sti \
	-t mt8,mt9 -Maxw 2.1 -p mt6,key,mt7,key 0,2.1,0 - mt6_mt7.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt7 -b \
	mt4,mt3,mt2,mt1,poly,diff,sti -t mt8,mt9 -Maxw 2.1 -p mt5,key,mt7,key \
	0,2.1,0 - mt5_mt7.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b mt4,mt3,mt2,mt1,poly,diff,sti -t \
	mt7,mt8,mt9 -Maxw 2.1 -p mt5,key,mt6,key 0,2.1,0 - mt5_mt6.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt6 -b \
	mt3,mt2,mt1,poly,diff,sti -t mt7,mt8,mt9 -Maxw 2.1 -p mt4,key,mt6,key \
	0,2.1,0 - mt4_mt6.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b mt3,mt2,mt1,poly,diff,sti -t \
	mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt4,key,mt5,key 0,2.1,0 - mt4_mt5.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt5 -b mt2,mt1,poly,diff,sti \
	-t mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt3,key,mt5,key 0,2.1,0 - mt3_mt5.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b mt2,mt1,poly,diff,sti -t \
	mt5,mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt3,key,mt4,key 0,2.1,0 - \
	mt3_mt4.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt4 -b mt1,poly,diff,sti -t \
	mt5,mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt2,key,mt4,key 0,2.1,0 - \
	mt2_mt4.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b mt1,poly,diff,sti -t \
	mt4,mt5,mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt2,key,mt3,key 0,2.1,0 - \
	mt2_mt3.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt3 -b poly,diff,sti -t \
	mt4,mt5,mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt1:mt1_cut,key,mt3,key 0,2.1,0 \
	- mt1_mt3.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b poly,diff,sti -t \
	mt3,mt4,mt5,mt6,mt7,mt8,mt9 -Maxw 2.1 -p mt1:mt1_cut,key,mt2,key \
	0,1.4,0 - mt1_mt2.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R mt2 -b diff,sti -t \
	mt3,mt4,mt5,mt6,mt7,mt8,mt9 -k mt1:0.3 -Maxw 2.1 -p \
	poly:poly_cut,key,mt2,key 0,1.4,0 - poly_mt2.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -R mt1,poly -b diff,sti -t \
	mt2,mt3,mt4,mt5,mt6,mt7,mt8,mt9 -Maxw 1.8 -p \
	poly:poly_cut,key,mt1:mt1_cut,key 0,1.2,0 - poly_mt1.sip
ENDCAT

#==========================================================#
# Prepare gate capacitance blocking layers
#==========================================================#

emerge -V _nmos_12_MOS_1 _pmos_12_MOS_7 allGate

#==========================================================#
# Run pax16 to generate capfile
#==========================================================#

pax16 -V -scf sip.cmd -cgnd ${CAP_GROUND},1.0 -rP \
	np_rmetal1_conn.res,np_rpoly_conn.res,mwires.res -M_perim_off -c \
	/home/buet/cadence/gpdk090_v4.6/assura/rcx/cap_coeff.dat -f sti diff \
	poly:poly_cut mt1:mt1_cut mt2 mt3 mt4 mt5 mt6 mt7 mt8 mt9 allGate - \
	/home/buet/cadence/gpdk090_v4.6/assura/rcx/paxfile_coeff - - NET - \
	capfile

#==========================================================#
# Generate netlister data files
#==========================================================#

cat <<ENDCAT> lvsmos.mod
xnmos1v#20ivpcell#20gpdk090,	100000.0, 0,	xnmos1v,	unused, unused, 100000.0
nmos1v#20ivpcell#20gpdk090,	100000.0, 0,	nmos1v,	unused, unused, 100000.0
xpmos1v#20ivpcell#20gpdk090,	100000.0, 0,	xpmos1v,	unused, unused, 100000.0
pmos1v#20ivpcell#20gpdk090,	100000.0, 0,	pmos1v,	unused, unused, 100000.0
ENDCAT

#==========================================================#
# Perform RC reduction
#==========================================================#

xreduce -V -mergecap -n NET -d1 -e \
	mt9,mt8,mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -decoupled -sr \
	-minR 0.001 -rP np_rmetal1_conn.res,np_rpoly_conn.res,mwires.res -cap \
	capfile L1T0 _nmos_12_MOS_1.transr _pmos_12_MOS_7.transr

#==========================================================#
# Generate HSPICE file
#==========================================================#

advgen -V -g0 -li -f -n -o HSPICE -h ${HIERARCHY_DELIMITER} -TL L1T0 -cgnd \
	${CAP_GROUND},1.0 -sc caps2dversion -mx capfile \
	mt9,mt8,mt7,mt6,mt5,mt4,mt3,mt2,mt1,poly,diff,sti -rPm res.mod \
	np_rmetal1_conn.res,Rnp_rmetal1_conn.dev2 \
	np_rpoly_conn.res,Rnp_rpoly_conn.dev2 -rPm mwires.mod \
	mwires.res,mwires.dev2 -ta lvsmos.mod,_nmos_12_MOS_1.net \
	_nmos_12_MOS_1.transr -ta lvsmos.mod,_pmos_12_MOS_7.net \
	_pmos_12_MOS_7.transr - NET - \
	/home/buet/Desktop/inv/test1/extview.tmp

#==========================================================#
# Create _save_layers file for Assura extracted view
#==========================================================#

geom mt1 np_rmetal1_conn - np_rmetal1_conn,11,i,1
geom poly np_rpoly_conn - np_rpoly_conn,11,i,1
cat <<ENDCAT> _save_layers
sti psubstrate nwell_conn
mt2 mt2
mt3 mt3
mt4 mt4
mt5 mt5
mt6 mt6
mt7 mt7
mt8 mt8
mt9 mt9
diff np_rpdiff_conn p_rpdiff_conn np_rndiff_conn p_rndiff_conn
metal1_conn np_rmetal1_conn p_rmetal1_conn
poly_conn np_rpoly_conn p_rpoly_conn
ndiff_conn np_rndiff_conn p_rndiff_conn
pdiff_conn np_rpdiff_conn p_rpdiff_conn
nwell_conn np_rnwell_conn p_rnwell_conn
psubstrate psubstrate.df2
Metal1_v rMetal1_v
Metal1_p np_rMetal1_p p_rMetal1_p
cont_poly rcont_poly np_rcont_poly p_rcont_poly
cont_pdiff rcont_pdiff
cont_ndiff rcont_ndiff
ptap_pdiff_conn_ovia ptap_pdiff_conn_ovia
ptap np_rptap p_rptap
psubstrate_ptap_ovia psubstrate_ptap_ovia
ntap_ndiff_conn_ovia ntap_ndiff_conn_ovia
ntap np_rntap p_rntap
nwell_conn_ntap_ovia nwell_conn_ntap_ovia
ENDCAT
