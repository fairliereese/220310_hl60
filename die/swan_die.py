import swan_vis as swan
import sys
import os

# arguments
sg_fname = sys.argv[1]
col = sys.argv[2]
cond1 = sys.argv[3]
cond2 = sys.argv[4]
test = sys.argv[5]
fname = sys.argv[6]

# read in SwanGraph
sg = swan.read(sg_fname)

# actually perform the test
die = sg.die_gene_test(obs_col=col,
                       obs_conditions=[cond1, cond2],
                       kind=test)
die.to_csv(fname, sep='\t')
