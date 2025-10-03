add_library(wil INTERFACE)
target_include_directories(wil INTERFACE include)

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  target_compile_definitions(wil INTERFACE
    __forceinline=inline
    _Frees_ptr_= _Frees_ptr_opt_= _Post_z_= _Pre_maybenull_=
    _Pre_opt_valid_= _Pre_valid_= _Translates_last_error_to_HRESULT_=
    InterlockedDecrementNoFence=InterlockedDecrement
    InterlockedIncrementNoFence=InterlockedIncrement
    __WI_LIBCPP_COMPILER_CLANG WIL_NO_SLIM_EVENT=
    __WI_LIBCPP_HAS_NO_UNICODE_CHARS
  )

  target_compile_options(wil INTERFACE
    -fms-extensions -fms-compatibility
    "-D_Ret_opt_bytecap_(size)=" "-D_Translates_NTSTATUS_to_HRESULT_(status)="
    "-D_Translates_Win32_to_HRESULT_(err)="
  )
endif()
