# Copyright (C) 2001-2016 Quantum ESPRESSO Foundation

AC_DEFUN([X_AC_QE_HDF5], [

  AC_MSG_CHECKING([HDF5])
 
AC_ARG_WITH(hdf5,
   [AS_HELP_STRING([--with-hdf5],
       [use hdf5 if available (default: yes)])],
   [if  test "$withval" = "yes" ; then
      with_hdf5=1
   else
      with_hdf5=0
   fi],
   [with_hdf5=0])

hdf5_libs=""

cflags_c99=""

if test "$with_hdf5" -eq 1; then
   CPPFLAGS="-I${hdf5_dir}/include"
#   LIBS="-L${hdf5_dir}/lib -lhdf5_fortran -lhdf5_hl -lhdf5"
   LIBS="-L${hdf5_dir}/lib -lhdf5_hl -lhdf5"
   echo $CPPFLAGS
   echo $LIBS
   AC_LANG_PUSH(C)
   AC_CHECK_HEADER(hdf5.h, have_hdf5=1, AC_MSG_ERROR(Cannot find HDF5 header file.),)
   if test "$have_hdf5" -eq 1 ; then
   try_iflags="$try_iflags -I${hdf5_dir}/include" ; fi
   AC_LANG_POP(C)
#   unset ac_cv_search_h5pset_fapl_mpio_c # clear cached value
#   AC_SEARCH_LIBS(h5pset_fapl_mpio_c, "", have_hdf5=1, AC_MSG_ERROR(Cannot find parallel HDF5 Fortran library.))
   if test "$have_hdf5" -eq 1 ; then
      try_dflags="$try_dflags -D__HDF5 -DH5_USE_16_API"
      hdf5_libs="$LIBS"
   else
      hdf5_libs=""
   fi
   cflags_c99="-std=c99"	
fi   

  AC_MSG_RESULT(${hdf5_libs})
  AC_SUBST(hdf5_libs)
  AC_SUBST(cflags_c99)  
  ]
)
