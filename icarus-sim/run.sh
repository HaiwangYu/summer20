# lar -n5 -c prodsingle_common_icarus.fcl -o gen.root # single particle (default: muon)
# lar -n5 -c cosmics_g4_icarus_volCryostat.fcl gen.root -o g4.root
lar -n1 -c wcls-multitpc-sim-drift-simchannel.fcl g4.root -o wcsim.root
lar -n1 -c wcls-decode-to-sig.fcl wcsim.root -o decon.root
