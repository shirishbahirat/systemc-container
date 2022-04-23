# systemc_container
docker container for systemc for Mac M1

Systemc docker container


g++ -I. -I$SYSTEMC_HOME/include -L. -L$SYSTEMC_HOME/lib-linuxaarch64 -Wl,-rpath=$SYSTEMC_HOME/lib-linuxaarch64 -o test test.cpp -lsystemc -lm -std=g++11



Add following in endian.hpp

   || defined(_M_X64) || defined(__bfin__) || defined(__aarch64__) 

Add following in configure file

  powerpc) :
             TARGET_ARCH="${TARGET_ARCH}ppc"
          CPU_ARCH="ppc"
          QT_ARCH="powerpc-apple-macosx" ;; #(
  arm) :
            TARGET_ARCH="${TARGET_ARCH}arm"
            CPU_ARCH="arm64"
            QT_ARCH="pthreads" ;;
          #(
  *) :
    as_fn_error $? "\"sorry...architecture not supported\"" "$LINENO" 5 ;;
esac









docker build . -t systemc




 docker run \           
  -ti \
  --rm \
  -v "$(pwd)"/srcfiles/:/usr/srcfile/ \
  systemc




