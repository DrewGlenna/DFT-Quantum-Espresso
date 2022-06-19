NAME='ecut'

for CUTOFF in 10 15 20 25 30
do
cat > $NAME.$CUTOFF.in << EOF 
 &control
    calculation = 'scf',
    prefix = 'Si_exc1',
    pseudo_dir='./',
    verbosity = 'high'
 /
 &system
    ibrav =  2, 
    celldm(1) = 10.26, 
    nat =  2, 
    ntyp = 1,
    ecutwfc = $CUTOFF
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Si 28.086  Si.pbe-rrkj.UPF

ATOMIC_POSITIONS (alat)
 Si 0.0 0.0 0.0
 Si 0.25 0.25 0.25

K_POINTS (automatic)
  6 6 6 1 1 1
EOF

pw.x < $NAME.$CUTOFF.in > $NAME.$CUTOFF.out

done
