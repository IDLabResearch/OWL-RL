#!/bin/bash
#this script can be used to create the enriched merged tbox ontology for ORCA

cd ../..

#Create a Skolemized version of the TBox
/opt/eye/bin/eye.sh <path-to-your-ontology> --nope --query Generation_rules/groundq.n3 > Pre_Skolem_TBox.n3

/opt/eye/bin/eye.sh Pre_Skolem_TBox.n3 listgrounding.n3 --nope --query Skolemisation.n3 > Skolem_TBox.n3



#Create all extra-rules needed
/opt/eye/bin/eye.sh Skolem_TBox.n3 --nope --query Subclasses_rule_generation.n3 > TBox_rules.n3

#produce a preprecessed versions of the whole extended tBox


/opt/eye/bin/eye.sh Skolem_TBox.n3 TBox_rules.n3 --n3p  > TBox.n3p
/opt/eye/bin/eye.sh Skolem_TBox.n3 TBox_rules.n3 --image PreprocessedOntologies/TBox.pvm
