NAME='ecut'

for CUTOFF in 65 70 75 80 85 90
do
cat > $NAME.$CUTOFF.in << EOF
 &control
    calculation='scf'
    verbosity='high'
    prefix='Cu'
    pseudo_dir='/home/drewglenna/Documents/Espresso/q-e-qe-6.8/pseudo/PAW'
 /
 &system
    ibrav=14,
    A=3.621262, B=3.621262, C=3.621262,
    nat=4,
    ntyp=1,
    nbnd=80,
    ecutwfc=$CUTOFF,
    occupations='smearing',
    smearing='gaussian',
    degauss=0.01,
    tot_magnetization=0,
    nspin=2,
/
&electrons
/
&ions
/
ATOMIC_SPECIES
 Cu  63.546  Cu.upf
ATOMIC_POSITIONS {crystal}
  Cu  0.00000000  0.00000000  0.00000000
  Cu  0.00000000  0.50000000  0.50000000
  Cu  0.50000000  0.00000000  0.50000000
  Cu  0.50000000  0.50000000  0.00000000
K_POINTS (automatic)
 1 1 1 0 0 0
EOF

pw.x < $NAME.$CUTOFF.in > $NAME.$CUTOFF.out

done
