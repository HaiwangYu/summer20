# login

```bash
ssh <usr>@rssh.rhic.bnl.gov
ssh <usr>@dune0001.sdcc.bnl.gov
scp ~/.ssh/id_rsa.pub <usr>@rftpexp.rhic.bnl.gov:.ssh/authorized_keys

exec bash -l
source /cvmfs/larsoft.opensciencegrid.org/products/setup
setup root v6_18_04d -q e19:prof
```

# simulation

## setup icaruscode

```bash
source  /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
setup icaruscode v08_55_01 -q e19:prof
```

## use updated cfg

```bash
# download wire-cell-toolkit
git clone https://github.com/WireCell/wire-cell-toolkit.git

# prepend the updated cfg to $WIRECELL_PATH
export WIRECELL_PATH=</path/to/wire-cell-toolkit>/cfg/:$WIRECELL_PATH
```



## run sim-g4-detector-sp chain

```bash
# gen stage (choose one from the three)
lar -n1 -c prodsingle_common_icarus.fcl -o gen.root # single particle (default: muon)
lar -n1 -c prodcorsika_standard_icarus.fcl -o gen.root # corsika cosmics ray
lar -n1 -c simulation_genie_icarus_bnb.fcl -o gen.root # genie BNB neutrino

# geant4 stage
lar -n1 -c cosmics_g4_icarus_volCryostat.fcl gen.root -o g4.root

# detector sim stage
lar -n1 -c wcls-multitpc-sim-drift-simchannel.fcl g4.root -o wcsim.root

# signal processing stage
lar -n1 -c wcls-decode-to-sig.fcl wcsim.root -o decon.root
```


