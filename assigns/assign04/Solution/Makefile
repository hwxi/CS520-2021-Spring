######
#
# For assign04
#
######

PATSCC=patscc # for ATS2

######

all:: date
all:: regress
all:: cleanall

######

date: ; echo `date`

######

regress:: \
assign04_test; time ./$<

######

assign04_test: \
assign04_test.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f assign04_test

###### end of [Makefile] ######
