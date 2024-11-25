CC = clang
AR = llvm-ar
NM = llvm-nm
RANLIB = llvm-ranlib

FILES := $(wildcard src/*.c)

FLAGS = -march=native -O3 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=3 -DMI_SECURE=ON -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection -fuse-ld=lld \
	-Wl,-O2 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now \
        -Wl,-z,pack-relative-relocs -flto=thin

LIBS = -pthreads -lsodium -lmimalloc

build: $(FILES)
	$(CC) $(FILES) $(FLAGS) $(LIBS) -o genpasswd

clean:
	rm -vf genpasswd
