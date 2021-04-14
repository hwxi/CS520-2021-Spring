# Lectures

For CS520, Spring, 2021

## Lecture-01-26(Tue)

Testing can find bugs. But no bugs being found so far does not
guarantee absence of bugs.

Comparing implementations of fibo (for computing Fibonacci numbers)
in C (imperative programming) with corresponding ones in ATS (functional
programming).

Recursion is ubiquitous in programming. Loops in imperative programming
corresponds to tail-recursive functions in functional programming.

#### Recording:

https://bostonu.zoom.us/rec/share/IHIMsYC0PMAFYGD-T_9VSvsdNZRJ6wDZA2uv5eFFMEBoJcriB6H105nRq757YAKt.0sRwSX4D2ekYIW6B (Access Passcode: 941+TX@L)

## Lecture-01-28(Thu)

Compared with imperative programs, functional programs are relatively
easier to reason about in general. So we are to start with functional
programming.

The feature of datatypes is introduced and some examples involving pattern-matching
are given.

#### Recording:

https://bostonu.zoom.us/rec/share/YCfuSJvugu75epf88_UPJbSA-Sw-8gby2wnnmNsOopw8gZmip4WtpTePqJSHR0dq.KtdbBVbYLAgW8zoS (Access Password: D?Kq65fJ) 

## Lecture-02-02(Tue)

A brief introduction to polymorphic datatypes is given. With such
datypes, template functions are introduced. Please see some related code in the mylib directory.

#### Recording:

https://bostonu.zoom.us/rec/share/oZqFTykeFNe-40GcX-tiIIZ1z5tGnbaKZJorDFRJ5AcA42Z7rqKzaG5XHYn4A_rD.uUS_IvvLJpVf0amV (Access Password: v7XW.$4x)

## Lecture-02-04(Thu)

Some explanation on #include and #staload is given. In general, #staload is the proper way to access
a module. Also, please take a look at the mylib directory, which is created to store the library built
for this class.

#### Recording:

https://bostonu.zoom.us/rec/share/rwYxZMT0dDxaa2PC9Y8lt0k-WwV-vmastLnGwXTA_CYDrp4in0dMIxB5LZ_Him3q.hLY9I3Xu01cVRFJ5 (Access Passcode: UQ9e4.Gd)

## Lecture-02-09(Tue)

More time is spent on building the mylib library. In particular, the
two combinators mylist_foldleft and mylist_foldright are implemented
and a few previously implemented combinators are re-implemented based
on these two. Also, streams as a lazy form of lists are briefly introduced.
  
#### Recording:

https://bostonu.zoom.us/rec/share/s5OrmHuj329VOITX9gnOae7EbsYVJFJi8psmJPZ-XyOdSnsF19oHKPwYgwECuEiD.SAOyZFnGSzctWbel (Access Password: Lf0?gxc9)

## Lecture-02-11(Thu)

An introduction to (functional) streams is given; mystrm_map is implemented; sieve is implemented.

#### Recording:

https://bostonu.zoom.us/rec/share/ELRNDcP9uLRtyP32al-I-89PXDmezIkNXocWuRtJJuhMgeuMLGknrVI3tGZq7K8L.eO3_ALbFsRS52o5r (Access Password: 1@HkVhO7)

## Lecture-02-18(Thu)

The introduction to functional streams is wrapped up, and an
introduction to linear streams is started.  A comparison between sieve
(functional) and sieve_vt (linear) is given, which shows that the
latter is much more efficient than the former, both time-wise and
memory-wise.

#### Recording:

https://bostonu.zoom.us/rec/share/mXWJSjXW_joz7uDVE85aaEF429cgcbWGcO-sV9OW96-XIRr9pyIZSBky_LMcRNjr.osTmp-lmBynvAC99 (Access Password: Yg7R*63R) 

## Lecture-02-23(Tue)

This lecture covers the exception mechanism as is supported in ATS. A
typical scenario of "hitting-two-birds-with-one-stone" is explained
where using exceptions can lead to both clean code and run-time efficiency.

#### Recording:

https://bostonu.zoom.us/rec/share/WHFKGq8luOkgP2C5lpXUttV3ADpw-ZaS55i0Ea7wtQ-cExcc5DIHxWhJvM7TJhkD.tGSWfzM4RxAmLkbU (Access Password: Q.gtsn@0)

## Lecture-02-25(Thu)

This lecture does a review on various programming features introduced so far.

#### Recording:

https://bostonu.zoom.us/rec/share/JylEumRnZbRDBHrKrLCpDZbIltb9V3Lw3Rh8GQfUSFZB-kiykIAlE4SaT_a15mZ-.2YkSZniq7Tx4BmAV (Access Password: fkr2m.=a)

## Lecture-03-02(Tue)

This lecture gives a peek on type-based program verification as is supported in ATS.

#### Recording:

https://bostonu.zoom.us/rec/share/L-_0R3NP9wjtj3xL5z2jPZAMNbdl8o7lY5yJtLWOaRxhxEi-rgHB9Sn1A5VFZmHU.WAdebDnv7fCSecTU (Access Password: .9SZ1juH)

## Lecture-03-09(Tue)

This lecture gives some simple examples of (full) program correctness.

#### Recording:

https://bostonu.zoom.us/rec/share/tdhR68VtpfyhA1DOtPsTnE871XACul2XPTL_PwkNhX2GK964ZkWoSXS1ZMZ51U4V.IrZmlXSiRImhg3u1 (Access Password: q9w32W$z)

## Lecture-03-11(Thu)

This lecture gives some examples involving a list type that carries the length information.

#### Recording:

https://bostonu.zoom.us/rec/share/9uiVkG-9MstnPzSScUN6PBsz0siNrHGbd4uayVowXg58tCl47KgAs_kk0UYeb2cb.bxI3kg0EvEAwe5lf (Access Password: +kfK*!4U)

## Lecture-03-16(Tue)

This lecture uses assign02 as an example to show some practical benefits of dependent types.

#### Recording:

https://bostonu.zoom.us/rec/share/od59_7bs0yxoi_wso7OJERv9kj6eMQp93NEoeNbzBB2XoO97EpVLFKp3oVW2Aj-v.FipLsO2dLgirJejT (Access Password: 9tvy6^n1)

## Lecture-03-23(Tue)

This lecture goes over some questions in Midterm1. It stresses the importance of writing code
one can actually explain. It is simply impractical to verify messy code with convoluted logic!

#### Recording:

https://bostonu.zoom.us/rec/share/sAiQ-4cgjdzDjC70GDk8sYfQEd170lzwGVyGw-uYLebNaUeoXUG2dMm512ur0Enf.ivKd7LD0xWUqQt3F (Access Password: Tb#0*XYQ)

## Lecture-03-25(Thu)

This lecture covers more on programming with dependent types. In
particular, mergesort is given an implementation that is verified to
be length-preserving through type-checking. Also, a data structure is
introduced for implementing so-called random-access lists.

#### Recording:

https://bostonu.zoom.us/rec/share/uAPrarZqq-rIk7fVbGzuFCmbOj5uVasj466vO0lW1FpWr7LMOzFzfGpa5MEqMdTz.8MsfyrsJWftyRWSd (Access Password: +3Tz6fZ^)

## Lecture-03-30(Tue)

This lecture covers in-depth an implemenation of random-accesss lists.

#### Recording:

https://bostonu.zoom.us/rec/share/KEf7WB-S3CWDcY8ELwfo_kjUWrK97Y8RwHrTDk5jTtDanvX4Ev0Wh3dr56X3SBAa.0yteMc62Ms2p1f8J (Access Password: ?NDL6qWZ)

## Lecture-04-01(Thu)

This lecture gives a quick introduction to the concept of continuation.

https://bostonu.zoom.us/rec/share/WfzIxalAUd2nuHPof9bsRt1FbDFBSL7sSfDstYFnpjS32ZJxSYrmkzscQD0jxgXE.WsPX3RtcvHYzmnps (Access Password: $HnD$Tq7)

## Lecture-04-06(Tue)

This lecture continues with more examples of CPS-style of
programming. Also, a list-based quicksort implementation is given for
the subsequent animation task.

https://bostonu.zoom.us/rec/share/QZSOj3e0HXKw5v4yRhfW4IUzr8hCVyXv6xr9N-FACDihX8GcfQt7S99hgxWCG0Mq.dBJfKhxXrVOgZuGX (Access Password: mSKl5&C6)

## Lecture-04-08(Thu)

This lecture first demonstrates how ATS source can be compiled to JS code.
It then continues with programming with linear streams:

https://bostonu.zoom.us/rec/share/BhNbpXGvoJUR8RtI_dJnBha-zgu594peMe47TW_labCELbbQl1ado-79_uBRwOI.LPf_jIBCCLzral2U ( Access Password: 7.f5Y80+ )

## Lecture-04-13(Tue)

This lecture first goes over the animation project and then talks about arrays
needed for implementing the quicksort algorithm on arrays.

https://bostonu.zoom.us/rec/share/TtFWQti0wzD27nxxyyWmR9vujObnYGx6tOHEFUvLV63oOvf1aUKWvR1vMhUxr0aA.er4Ja98dzU_7GFeU (Access Password: 5i2p%W!R)
