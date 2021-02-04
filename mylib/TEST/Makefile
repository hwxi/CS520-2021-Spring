
PATSCC=patscc
PATSCC=\
${PATSHOME}/bin/patscc

all:: regress
all:: cleanall

regress:: \
test_myoptn; time ./test_myoptn
regress:: \
test_mylist; time ./test_mylist

test_myoptn: \
test_myoptn.dats; \
$(PATSCC) -o $@ -DATS_MEMALLOC_LIBC $<

test_mylist: \
test_mylist.dats; \
$(PATSCC) -o $@ -DATS_MEMALLOC_LIBC $<

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f test_mylist
