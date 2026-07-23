cd $INSTALL_DIR/benchspec/CPU/500.perlbench_r/run/run_base_refrate_mytest-m64.0000
./perlbench_r_base.mytest-m64 -I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1 > checkspam.2500.5.25.11.150.1.1.1.1.out 2>> checkspam.2500.5.25.11.150.1.1.1.1.err
cd $INSTALL_DIR/benchspec/CPU/502.gcc_r/run/run_base_refrate_mytest-m64.0000
./cpugcc_r_base.mytest-m64 gcc-pp.c -O3 -finline-limit=0 -fif-conversion -fif-conversion2 -o gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s
cd $INSTALL_DIR/benchspec/CPU/505.mcf_r/run/run_base_refrate_mytest-m64.0000
./mcf_r_base.mytest-m64 inp.in > inp.out 2>> inp.err
cd $INSTALL_DIR/benchspec/CPU/507.cactuBSSN_r/run/run_base_refrate_mytest-m64.0000
./cactusBSSN_r_base.mytest-m64 spec_ref.par > spec_ref.out 2>> spec_ref.err
cd $INSTALL_DIR/benchspec/CPU/508.namd_r/run/run_base_refrate_mytest-m64.0000
./namd_r_base.mytest-m64 --input apoa1.input --output apoa1.ref.output --iterations 65
cd $INSTALL_DIR/benchspec/CPU/510.parest_r/run/run_base_refrate_mytest-m64.0000
./parest_r_base.mytest-m64 $INSTALL_DIR/benchspec/CPU/510.parest_r/run/run_base_refrate_mytest-m64.0000/ref.prm
cd $INSTALL_DIR/benchspec/CPU/511.povray_r/run/run_base_refrate_mytest-m64.0000
./povray_r_base.mytest-m64 $INSTALL_DIR/benchspec/CPU/511.povray_r/run/run_base_refrate_mytest-m64.0000/SPEC-benchmark-ref.ini
cd $INSTALL_DIR/benchspec/CPU/519.lbm_r/run/run_base_refrate_mytest-m64.0000
./lbm_r_base.mytest-m64 3000 reference.dat 0 0 100_100_130_ldc.of
cd $INSTALL_DIR/benchspec/CPU/520.omnetpp_r/run/run_base_refrate_mytest-m64.0000
./omnetpp_r_base.mytest-m64 -c General -r 0
cd $INSTALL_DIR/benchspec/CPU/521.wrf_r/run/run_base_refrate_mytest-m64.0000
./wrf_r_base.mytest-m64 > rsl.out.0000 2>> wrf.err
cd $INSTALL_DIR/benchspec/CPU/523.xalancbmk_r/run/run_base_refrate_mytest-m64.0000
./cpuxalan_r_base.mytest-m64 -v t5.xml xalanc.xsl
cd $INSTALL_DIR/benchspec/CPU/525.x264_r/run/run_base_refrate_mytest-m64.0000
./x264_r_base.mytest-m64 --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-1000_x264_r_base.mytest-m64_x264_pass1.out 2>> run_000-1000_x264_r_base.mytest-m64_x264_pass1.err
cd $INSTALL_DIR/benchspec/CPU/526.blender_r/run/run_base_refrate_mytest-m64.0000
./blender_r_base.mytest-m64 sh3_no_char.blend --render-output sh3_no_char_ --threads 1 -b -F RAWTGA -s 849 -e 849 -a > sh3_no_char.849.spec.out 2>> sh3_no_char.849.spec.err
cd $INSTALL_DIR/benchspec/CPU/527.cam4_r/run/run_base_refrate_mytest-m64.0000
./cam4_r_base.mytest-m64 > cam4_r_base.mytest-m64.txt 2>> cam4_r_base.mytest-m64.err
cd $INSTALL_DIR/benchspec/CPU/531.deepsjeng_r/run/run_base_refrate_mytest-m64.0000
./deepsjeng_r_base.mytest-m64 ref.txt
cd $INSTALL_DIR/benchspec/CPU/538.imagick_r/run/run_base_refrate_mytest-m64.0000
./imagick_r_base.mytest-m64 -limit disk 0 refrate_input.tga -edge 41 -resample 181% -emboss 31 -colorspace YUV -mean-shift 19x19+15% -resize 30% refrate_output.tga > refrate_convert.out 2>> refrate_convert.err
cd $INSTALL_DIR/benchspec/CPU/541.leela_r/run/run_base_refrate_mytest-m64.0000
./leela_r_base.mytest-m64 ref.sgf > ref.out 2>> ref.err
cd $INSTALL_DIR/benchspec/CPU/544.nab_r/run/run_base_refrate_mytest-m64.0000
./nab_r_base.mytest-m64 1am0 1122214447 122 > 1am0.out 2>> 1am0.err
cd $INSTALL_DIR/benchspec/CPU/548.exchange2_r/run/run_base_refrate_mytest-m64.0000
./exchange2_r_base.mytest-m64 6
cd $INSTALL_DIR/benchspec/CPU/549.fotonik3d_r/run/run_base_refrate_mytest-m64.0000
./fotonik3d_r_base.mytest-m64 > fotonik3d_r.log 2>> fotonik3d_r.err
cd $INSTALL_DIR/benchspec/CPU/557.xz_r/run/run_base_refrate_mytest-m64.0000
./xz_r_base.mytest-m64 cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6 > cld.tar-160-6.out 2>> cld.tar-160-6.err
cd $INSTALL_DIR/benchspec/CPU/600.perlbench_s/run/run_base_refspeed_mytest-m64.0000
./perlbench_s_base.mytest-m64 -I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1 > checkspam.2500.5.25.11.150.1.1.1.1.out 2>> checkspam.2500.5.25.11.150.1.1.1.1.err
cd $INSTALL_DIR/benchspec/CPU/602.gcc_s/run/run_base_refspeed_mytest-m64.0000
./sgcc_base.mytest-m64 gcc-pp.c -O5 -fipa-pta -o gcc-pp.opts-O5_-fipa-pta.s
cd $INSTALL_DIR/benchspec/CPU/605.mcf_s/run/run_base_refspeed_mytest-m64.0000
./mcf_s_base.mytest-m64 inp.in > inp.out 2>> inp.err
cd $INSTALL_DIR/benchspec/CPU/607.cactuBSSN_s/run/run_base_refspeed_mytest-m64.0000
./cactuBSSN_s_base.mytest-m64 spec_ref.par
cd $INSTALL_DIR/benchspec/CPU/619.lbm_s/run/run_base_refspeed_mytest-m64.0000
./lbm_s_base.mytest-m64 2000 reference.dat 0 0 200_200_260_ldc.of
cd $INSTALL_DIR/benchspec/CPU/620.omnetpp_s/run/run_base_refspeed_mytest-m64.0000
./omnetpp_s_base.mytest-m64 -c General -r 0
cd $INSTALL_DIR/benchspec/CPU/621.wrf_s/run/run_base_refspeed_mytest-m64.0000
./wrf_s_base.mytest-m64 > rsl.out.0000 2>> wrf.err
cd $INSTALL_DIR/benchspec/CPU/623.xalancbmk_s/run/run_base_refspeed_mytest-m64.0000
./xalancbmk_s_base.mytest-m64 -v t5.xml xalanc.xsl
cd $INSTALL_DIR/benchspec/CPU/625.x264_s/run/run_base_refspeed_mytest-m64.0000
./x264_s_base.mytest-m64 --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-1000_x264_s_base.mytest-m64_x264_pass1.out 2>> run_000-1000_x264_s_base.mytest-m64_x264_pass1.err
cd $INSTALL_DIR/benchspec/CPU/631.deepsjeng_s/run/run_base_refspeed_mytest-m64.0000
./deepsjeng_s_base.mytest-m64 ref.txt
cd $INSTALL_DIR/benchspec/CPU/638.imagick_s/run/run_base_refspeed_mytest-m64.0000
./imagick_s_base.mytest-m64 -limit disk 0 refspeed_input.tga -resize 817% -rotate -2.76 -shave 540x375 - alpha remove -auto-level -contrast-stretch 1x1% -colorspace Lab -channel R - equalize +channel -colorspace sRGB -define histogram:unique-colors=false -adaptive- blur 0x5 -despeckle -auto-gamma -adaptive-sharpen 55 -enhance -brightness-contrast 10x10 -resize 30% refspeed_output.tga > refspeed_convert.out 2>> refspeed_convert. err
cd $INSTALL_DIR/benchspec/CPU/641.leela_s/run/run_base_refspeed_mytest-m64.0000
./leela_s_base.mytest-m64 ref.sgf > ref.out 2>> ref.err
cd $INSTALL_DIR/benchspec/CPU/644.nab_s/run/run_base_refspeed_mytest-m64.0000
./nab_s_base.mytest-m64 3j1n 20140317 220 > 3j1n.out 2>> 3j1n.err
cd $INSTALL_DIR/benchspec/CPU/648.exchange2_s/run/run_base_refspeed_mytest-m64.0000
./exchange2_s_base.mytest-m64 6
cd $INSTALL_DIR/benchspec/CPU/649.fotonik3d_s/run/run_base_refspeed_mytest-m64.0000
./fotonik3d_s_base.mytest-m64 > fotonik3d.log 2>> fotonik3d.err
cd $INSTALL_DIR/benchspec/CPU/657.xz_s/run/run_base_refspeed_mytest-m64.0000
./xz_s_base.mytest-m64 cpu2006docs.tar.xz 6643 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1036078272 1111795472 4 > cpu2006docs.tar-6643-4.out 2>> cpu2006docs.tar-6643-4.err
