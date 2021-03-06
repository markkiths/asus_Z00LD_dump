#ifdef WIN32

#  ifndef xditk_AT_EXPORT_H
#  define xditk_AT_EXPORT_H

#  if defined(xditk_AT_BUILT_AS_STATIC) || defined(_STATIC_CPPLIB)
#    define xditk_AT_EXPORT
#    define XDITK_AT_NO_EXPORT
#  else
#    ifndef xditk_AT_EXPORT
#      ifdef xditk_AT_EXPORTS
        /* We are building this library */
#        define xditk_AT_EXPORT __declspec(dllexport)
#      else
        /* We are using this library */
#        define xditk_AT_EXPORT __declspec(dllimport)
#      endif
#    endif

#    ifndef XDITK_AT_NO_EXPORT
#      define XDITK_AT_NO_EXPORT 
#    endif
#  endif

#  ifndef XDITK_AT_DEPRECATED
#    define XDITK_AT_DEPRECATED __declspec(deprecated)
#    define XDITK_AT_DEPRECATED_EXPORT xditk_AT_EXPORT __declspec(deprecated)
#    define XDITK_AT_DEPRECATED_NO_EXPORT XDITK_AT_NO_EXPORT __declspec(deprecated)
#  endif

#  define DEFINE_NO_DEPRECATED 0
#  if DEFINE_NO_DEPRECATED
#   define XDITK_AT_NO_DEPRECATED
#  endif

#  endif

#else

#  ifndef xditk_AT_EXPORT_H
#  define xditk_AT_EXPORT_H

#  if defined(xditk_AT_BUILT_AS_STATIC) || defined(_STATIC_CPPLIB)
#    define xditk_AT_EXPORT
#    define XDITK_AT_NO_EXPORT
#  else
#    ifndef xditk_AT_EXPORT
#      ifdef xditk_AT_EXPORTS
        /* We are building this library */
#        define xditk_AT_EXPORT __attribute__((visibility("default")))
#      else
        /* We are using this library */
#        define xditk_AT_EXPORT __attribute__((visibility("default")))
#      endif
#    endif

#    ifndef XDITK_AT_NO_EXPORT
#      define XDITK_AT_NO_EXPORT __attribute__((visibility("hidden")))
#    endif
#endif

#ifndef XDITK_AT_DEPRECATED
#  define XDITK_AT_DEPRECATED __attribute__ ((__deprecated__))
#  define XDITK_AT_DEPRECATED_EXPORT xditk_AT_EXPORT __attribute__ ((__deprecated__))
#  define XDITK_AT_DEPRECATED_NO_EXPORT XDITK_AT_NO_EXPORT __attribute__ ((__deprecated__))
#endif

#define DEFINE_NO_DEPRECATED 0
#if DEFINE_NO_DEPRECATED
# define XDITK_AT_NO_DEPRECATED
#endif

#endif

#endif
