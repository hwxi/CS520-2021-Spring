######
#
# For midterm1
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
midterm1_test; time ./$<

######

midterm1_test: \
midterm1_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f midterm1_test

###### end of [Makefile] ######
