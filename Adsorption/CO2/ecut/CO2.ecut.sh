NAME='ecut'

for CUTOFF in 20 25 30 35 40 45 50 55 60 65 70 75 80
do
cat > $NAME.$CUTOFF.in << EOF
 &control
    calculation='scf'
    verbosity='high'
    prefix='CO2'
    pseudo_dir='/home/drewglenna/Documents/Espresso/q-e-qe-6.8/pseudo/PAW'
 /
 &system
    ibrav=1,
    A=10.0, B=10.0, C=10.0,
    nat=3,
    ntyp=2,
    nbnd=20,
    ecutwfc=$CUTOFF,
    occupations='smearing',
    smearing='gaussian',
    degauss=0.01,
    starting_magnetization(1)=+0.1,
    starting_magnetization(1)=-0.1,
    nspin=2,
/
&electrons
/
&ions
/
ATOMIC_SPECIES
 C   12.011  C.upf
 O   15.999  O.upf
ATOMIC_POSITIONS {crystal}
 C             0.5000000000        0.5000000000        0.5000000000
 O             0.5000000000        0.5000000000        0.3829425406
 O             0.5000000000        0.5000000000        0.6170574594
K_POINTS {automatic}
 1 1 1 0 0 0
EOF

pw.x < $NAME.$CUTOFF.in > $NAME.$CUTOFF.out

done
