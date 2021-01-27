######
#
# For lecture-01-26
#
######

MYCC=gcc
MYCC=clang

######

PATSCC=patscc

######

all::
all:: fibo
all:: fibo2
all:: fibo_dats
all:: fibo2_dats

######

fibo: fibo.c ; $(MYCC) -o $@ $<
fibo2: fibo2.c ; $(MYCC) -o $@ $<

######

fibo_dats: fibo.dats ; $(PATSCC) -o $@ $<
fibo2_dats: fibo2.dats; $(PATSCC) -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_dats.?

######

cleanall:: clean
cleanall:: ; rm -f fibo
cleanall:: ; rm -f fibo2
cleanall:: ; rm -f fibo_dats
cleanall:: ; rm -f fibo2_dats

###### end of [Makefile] ######
