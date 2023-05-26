# make makefile
#
# Tools used:
#  Compile::Resource Compiler
#  Compile::GNU C
#  Make: make
all : cnrdtl.exe

cnrdtl.exe : cnrdtl.obj cnfunc.obj cnrdtl.res cnrdtl.def
	gcc -Zomf cnrdtl.obj cnfunc.obj cnrdtl.res cnrdtl.def -o cnrdtl.exe
	wrc cnrdtl.res

cnrdtl.obj : cnrdtl.c cnrdtl.h
	gcc -Wall -Zomf -c -O2 cnrdtl.c -o cnrdtl.obj

cnfunc.obj : cnfunc.c cnfunc.h
	gcc -Wall -Zomf -c -O2 cnfunc.c -o cnfunc.obj

cnrdtl.res : cnrdtl.rc 
	wrc -r cnrdtl.rc

clean :
	rm -rf *exe *res *obj *lib *dll *map
