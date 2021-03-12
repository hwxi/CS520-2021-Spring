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

Q1_test: \
midterm1_Q1_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

Q2_test: \
midterm1_Q2_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

Q3_test: \
midterm1_Q3_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

Q4_test: \
midterm1_Q4_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

Q5_test: \
midterm1_Q5_test.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

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
cleanall:: ; rm -f Q?_test
cleanall:: ; rm -f midterm1_test

###### end of [Makefile] ######
