NAME='k#'

for kp in 1 2 3 4 5 6
do
cat > $NAME.$kp.in << EOF 
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
    ecutwfc = 20
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
  $kp $kp $kp 1 1 1
EOF

pw.x < $NAME.$kp.in > $NAME.$kp.out

done
