######
#
# For assign03
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
assign03_test; time ./$<

######

assign03_test: \
assign03_test.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f assign03_test

###### end of [Makefile] ######
