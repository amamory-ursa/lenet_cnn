Lenet for Orca
---

Original code by https://github.com/CerfVert94/lenet_cnn, adapted to RISCV32 and Orca by Alexandre Amory.

Instructions
---

Do the following steps :


```
make float
./main
```

This will run Lenet with pre-trained weights (see float_weight.h) with the images in Data folder.
It will also generate a data.h, with the same images, but in 0/1 format.

Then run:

```
make conv
```

This will generate the headers weights in short (short_weight.h) and in char (char_weight.h) format.


Finally, run

```
make short
./main_short
```

and

```
make char
./main_char
```

With short, the inferences will pass, but with char, there will be a inference error in the 2nd image.


To compile to ORCA
----

Edit Makefile-Orca to set the variables ORCA_SIM_DIR and ORCA_SW_DIR to point to 
[orca-sim](https://github.com/andersondomingues/orca-sim) and [orca-software-tools](https://github.com/andersondomingues/orca-software-tools). Make sure that orca-sim is compiled to single-core platform.


```
make -f Makefile-Orca all
```

it will generate image.bin. Then run 

```
$ORCA_SIM_DIR/bin/single-core.exe image.bin
```

These defines in -D_SHORT_WEIGHT_ -DRUN_ORCA in Makefile-Orca-App will generate the short version and without reading files.


After a while (about 3 minutes), check the results

```
cat logs/core\!.cpu_debug.log
The recognized digit is 0
The recognized digit is 1
The recognized digit is 2
The recognized digit is 3
The recognized digit is 4
The recognized digit is 5
The recognized digit is 6
The recognized digit is 7
The recognized digit is 8
The recognized digit is 9
Success
```
