######
#
# For assign01
#
######

PATSCC=patscc # for ATS2

######

all::
all:: regress
all:: cleanall

######

regress:: \
assign01_test; time ./$<

######

assign01_test: \
assign01_test.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -fwrapv -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f assign01_test

###### end of [Makefile] ######
