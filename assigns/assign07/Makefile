######
#
# A simple Makefile
#
######

PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
ATSCC2JS=${PATSHOME}/bin/atscc2js

######

fact_dats.c: \
fact.dats ; $(PATSCC) -ccats -o $@ $<
fact_dats.js: \
fact_dats.c ; $(ATSCC2JS) -o $@ -i $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
cleanall:: clean
cleanall:: ; rm -f *_?ats.js

################################################
