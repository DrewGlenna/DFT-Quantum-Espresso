NAME='LC'

for a in 9.8 10.0 10.2 10.4 10.6 10.8 11.0
do
cat > $NAME.$a.in << EOF 
 &control
    calculation = 'scf',
    prefix = 'Si_exc1',
    pseudo_dir='./',
    verbosity = 'high'
 /
 &system
    ibrav =  2, 
    celldm(1) = $a, 
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
  3 3 3 1 1 1
EOF

pw.x < $NAME.$a.in > $NAME.$a.out

done
