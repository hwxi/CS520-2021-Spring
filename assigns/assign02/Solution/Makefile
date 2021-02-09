######
#
# For assign02
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
assign02_test; time ./$<

######

assign02_test: \
assign02_test.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f assign02_test

###### end of [Makefile] ######
