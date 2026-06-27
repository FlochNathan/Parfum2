; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [25 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [75 x i64] [
	i64 u0x02abedc11addc1ed, ; 0: lib_Mono.Android.Runtime.dll.so => 23
	i64 u0x0517ef04e06e9f76, ; 1: System.Net.Primitives => 13
	i64 u0x0581db89237110e9, ; 2: lib_System.Collections.dll.so => 4
	i64 u0x07dcdc7460a0c5e4, ; 3: System.Collections.NonGeneric => 3
	i64 u0x092266563089ae3e, ; 4: lib_System.Collections.NonGeneric.dll.so => 3
	i64 u0x09d144a7e214d457, ; 5: System.Security.Cryptography => 19
	i64 u0x0c59ad9fbbd43abe, ; 6: Mono.Android => 24
	i64 u0x10f6cfcbcf801616, ; 7: System.IO.Compression.Brotli => 7
	i64 u0x13f1e5e209e91af4, ; 8: lib_Java.Interop.dll.so => 22
	i64 u0x1a91866a319e9259, ; 9: lib_System.Collections.Concurrent.dll.so => 2
	i64 u0x1c753b5ff15bce1b, ; 10: Mono.Android.Runtime.dll => 23
	i64 u0x209375905fcc1bad, ; 11: lib_System.IO.Compression.Brotli.dll.so => 7
	i64 u0x2174319c0d835bc9, ; 12: System.Runtime => 18
	i64 u0x2407aef2bbe8fadf, ; 13: System.Console => 5
	i64 u0x27b410442fad6cf1, ; 14: Java.Interop.dll => 22
	i64 u0x2801845a2c71fbfb, ; 15: System.Net.Primitives.dll => 13
	i64 u0x2afc1c4f898552ee, ; 16: lib_System.Formats.Asn1.dll.so => 6
	i64 u0x2db915caf23548d2, ; 17: System.Text.Json.dll => 20
	i64 u0x31195fef5d8fb552, ; 18: _Microsoft.Android.Resource.Designer.dll => 0
	i64 u0x3322c48637ddecf9, ; 19: Read_Andro.dll => 1
	i64 u0x3f863f64af227235, ; 20: Read_Andro => 1
	i64 u0x434c4e1d9284cdae, ; 21: Mono.Android.dll => 24
	i64 u0x4b7b6532ded934b7, ; 22: System.Text.Json => 20
	i64 u0x4e32f00cb0937401, ; 23: Mono.Android.Runtime => 23
	i64 u0x511adfca5907b165, ; 24: lib_Read_Andro.dll.so => 1
	i64 u0x526ce79eb8e90527, ; 25: lib_System.Net.Primitives.dll.so => 13
	i64 u0x54795225dd1587af, ; 26: lib_System.Runtime.dll.so => 18
	i64 u0x571c5cfbec5ae8e2, ; 27: System.Private.Uri => 15
	i64 u0x579a06fed6eec900, ; 28: System.Private.CoreLib.dll => 21
	i64 u0x5db0cbbd1028510e, ; 29: lib_System.Runtime.InteropServices.dll.so => 16
	i64 u0x60f62d786afcf130, ; 30: System.Memory => 11
	i64 u0x622eef6f9e59068d, ; 31: System.Private.CoreLib => 21
	i64 u0x65ece51227bfa724, ; 32: lib_System.Runtime.Numerics.dll.so => 17
	i64 u0x6692e924eade1b29, ; 33: lib_System.Console.dll.so => 5
	i64 u0x68fbbbe2eb455198, ; 34: System.Formats.Asn1 => 6
	i64 u0x6a4d7577b2317255, ; 35: System.Runtime.InteropServices.dll => 16
	i64 u0x73e4ce94e2eb6ffc, ; 36: lib_System.Memory.dll.so => 11
	i64 u0x76ca07b878f44da0, ; 37: System.Runtime.Numerics.dll => 17
	i64 u0x7dfc3d6d9d8d7b70, ; 38: System.Collections => 4
	i64 u0x87f6569b25707834, ; 39: System.IO.Compression.Brotli.dll => 7
	i64 u0x8da188285aadfe8e, ; 40: System.Collections.Concurrent => 2
	i64 u0x903101b46fb73a04, ; 41: _Microsoft.Android.Resource.Designer => 0
	i64 u0x90393bd4865292f3, ; 42: lib_System.IO.Compression.dll.so => 8
	i64 u0x9157bd523cd7ed36, ; 43: lib_System.Text.Json.dll.so => 20
	i64 u0x91a74f07b30d37e2, ; 44: System.Linq.dll => 10
	i64 u0x944077d8ca3c6580, ; 45: System.IO.Compression.dll => 8
	i64 u0x97e144c9d3c6976e, ; 46: System.Collections.Concurrent.dll => 2
	i64 u0xa0d8259f4cc284ec, ; 47: lib_System.Security.Cryptography.dll.so => 19
	i64 u0xa2572680829d2c7c, ; 48: System.IO.Pipelines.dll => 9
	i64 u0xa5f1ba49b85dd355, ; 49: System.Security.Cryptography.dll => 19
	i64 u0xaa52de307ef5d1dd, ; 50: System.Net.Http => 12
	i64 u0xac2af3fa195a15ce, ; 51: System.Runtime.Numerics => 17
	i64 u0xae282bcd03739de7, ; 52: Java.Interop => 22
	i64 u0xb4bd7015ecee9d86, ; 53: System.IO.Pipelines => 9
	i64 u0xb81a2c6e0aee50fe, ; 54: lib_System.Private.CoreLib.dll.so => 21
	i64 u0xba48785529705af9, ; 55: System.Collections.dll => 4
	i64 u0xbd0e2c0d55246576, ; 56: System.Net.Http.dll => 12
	i64 u0xc0d928351ab5ca77, ; 57: System.Console.dll => 5
	i64 u0xc12b8b3afa48329c, ; 58: lib_System.Linq.dll.so => 10
	i64 u0xc519125d6bc8fb11, ; 59: lib_System.Net.Requests.dll.so => 14
	i64 u0xc5a0f4b95a699af7, ; 60: lib_System.Private.Uri.dll.so => 15
	i64 u0xcbd4fdd9cef4a294, ; 61: lib__Microsoft.Android.Resource.Designer.dll.so => 0
	i64 u0xcd10a42808629144, ; 62: System.Net.Requests => 14
	i64 u0xd333d0af9e423810, ; 63: System.Runtime.InteropServices => 16
	i64 u0xd3651b6fc3125825, ; 64: System.Private.Uri.dll => 15
	i64 u0xdad05a11827959a3, ; 65: System.Collections.NonGeneric.dll => 3
	i64 u0xdbf9607a441b4505, ; 66: System.Linq => 10
	i64 u0xdd2b722d78ef5f43, ; 67: System.Runtime.dll => 18
	i64 u0xe192a588d4410686, ; 68: lib_System.IO.Pipelines.dll.so => 9
	i64 u0xe2420585aeceb728, ; 69: System.Net.Requests.dll => 14
	i64 u0xe5434e8a119ceb69, ; 70: lib_Mono.Android.dll.so => 24
	i64 u0xedc632067fb20ff3, ; 71: System.Memory.dll => 11
	i64 u0xf1c4b4005493d871, ; 72: System.Formats.Asn1.dll => 6
	i64 u0xf4c1dd70a5496a17, ; 73: System.IO.Compression => 8
	i64 u0xfbf0a31c9fc34bc4 ; 74: lib_System.Net.Http.dll.so => 12
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [75 x i32] [
	i32 23, i32 13, i32 4, i32 3, i32 3, i32 19, i32 24, i32 7,
	i32 22, i32 2, i32 23, i32 7, i32 18, i32 5, i32 22, i32 13,
	i32 6, i32 20, i32 0, i32 1, i32 1, i32 24, i32 20, i32 23,
	i32 1, i32 13, i32 18, i32 15, i32 21, i32 16, i32 11, i32 21,
	i32 17, i32 5, i32 6, i32 16, i32 11, i32 17, i32 4, i32 7,
	i32 2, i32 0, i32 8, i32 20, i32 10, i32 8, i32 2, i32 19,
	i32 9, i32 19, i32 12, i32 17, i32 22, i32 9, i32 21, i32 4,
	i32 12, i32 5, i32 10, i32 14, i32 15, i32 0, i32 14, i32 16,
	i32 15, i32 3, i32 10, i32 18, i32 9, i32 14, i32 24, i32 11,
	i32 6, i32 8, i32 12
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 7, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [7 x %struct.MarshalMethodsManagedClass] [
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000108, ; class name: Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 0
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000124, ; class name: Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 1
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200010e, ; class name: Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 2
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000136, ; class name: Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 3
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000d4, ; class name: Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 4
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000de, ; class name: Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 5
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200014e, ; class name: Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	} ; 6
], align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [7 x ptr] [
	ptr @.mm.0, ; 0 ('Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.1, ; 1 ('Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.2, ; 2 ('Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.3, ; 3 ('Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.4, ; 4 ('Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.5, ; 5 ('Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.6 ; 6 ('Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
], align 8

@mm_method_names = dso_local local_unnamed_addr constant [20 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x00000018060007a4, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 0
	%struct.MarshalMethodName {
		i64 u0x00000018060007a5, ; name: n_Read_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 1
	%struct.MarshalMethodName {
		i64 u0x00000018060007a6, ; name: n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.2_name; char* name
	}, ; 2
	%struct.MarshalMethodName {
		i64 u0x00000018060007a7, ; name: n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.3_name; char* name
	}, ; 3
	%struct.MarshalMethodName {
		i64 u0x0000001806000958, ; name: n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.4_name; char* name
	}, ; 4
	%struct.MarshalMethodName {
		i64 u0x0000001806000959, ; name: n_GetHashCode_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.5_name; char* name
	}, ; 5
	%struct.MarshalMethodName {
		i64 u0x000000180600095a, ; name: n_ToString_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.6_name; char* name
	}, ; 6
	%struct.MarshalMethodName {
		i64 u0x00000018060007d1, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 7
	%struct.MarshalMethodName {
		i64 u0x00000018060007d2, ; name: n_Flush_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.7_name; char* name
	}, ; 8
	%struct.MarshalMethodName {
		i64 u0x00000018060007d3, ; name: n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.8_name; char* name
	}, ; 9
	%struct.MarshalMethodName {
		i64 u0x00000018060007d4, ; name: n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.9_name; char* name
	}, ; 10
	%struct.MarshalMethodName {
		i64 u0x00000018060007d5, ; name: n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.10_name; char* name
	}, ; 11
	%struct.MarshalMethodName {
		i64 u0x00000018060009fe, ; name: n_Run_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.11_name; char* name
	}, ; 12
	%struct.MarshalMethodName {
		i64 u0x00000018060005ed, ; name: n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.12_name; char* name
	}, ; 13
	%struct.MarshalMethodName {
		i64 u0x0000001806000645, ; name: n_OnCreate_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.13_name; char* name
	}, ; 14
	%struct.MarshalMethodName {
		i64 u0x0000001806000646, ; name: n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.14_name; char* name
	}, ; 15
	%struct.MarshalMethodName {
		i64 u0x0000001806000647, ; name: n_OnDestroy_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.15_name; char* name
	}, ; 16
	%struct.MarshalMethodName {
		i64 u0x0000001806000648, ; name: n_OnBind_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.16_name; char* name
	}, ; 17
	%struct.MarshalMethodName {
		i64 u0x0000001806000aab, ; name: n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.17_name; char* name
	}, ; 18
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.18_name; char* name
	} ; 19
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Marshal methods backing fields, pointers to native functions
@native_cb_close_0_0_60007a4 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_60007a5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_60007a6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_0_60007a7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_equals_0_1_6000958 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_hashCode_0_1_6000959 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_toString_0_1_600095a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_2_60007d1 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_flush_0_2_60007d2 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_60007d3 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_60007d4 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_2_60007d5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_run_0_3_60009fe = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_4_60005ed = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_5_6000645 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStartCommand_0_5_6000646 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDestroy_0_5_6000647 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBind_0_5_6000648 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_activate_0_6_6000aab = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.7)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Method: System.Void Java.IO.InputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.InputStream::Close()
; Implemented: System.Void Android.Runtime.InputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_InputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_0_60007a4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 0, i32 noundef 100665252, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_0_60007a4)
	%cb2 = load ptr, ptr @native_cb_close_0_0_60007a4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Java.IO.InputStream::n_Read_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read()
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_60007a5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 0, i32 noundef 100665253, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_60007a5)
	%cb2 = load ptr, ptr @native_cb_read_0_0_60007a5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[])
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_60007a6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 0, i32 noundef 100665254, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_60007a6)
	%cb2 = load ptr, ptr @native_cb_read_0_0_60007a6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_0_60007a7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 0, i32 noundef 100665255, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_0_60007a7)
	%cb2 = load ptr, ptr @native_cb_read_0_0_60007a7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length)
	ret i32 %1
}

; Method: System.SByte Java.Lang.Object::n_Equals_Ljava_lang_Object__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Java.Lang.Object::Equals(Java.Lang.Object)
; Implemented: System.Boolean Android.Runtime.JavaObject::Equals(Java.Lang.Object)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_android_runtime_JavaObject_n_1equals(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_equals_0_1_6000958, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 1, i32 noundef 100665688, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_equals_0_1_6000958)
	%cb2 = load ptr, ptr @native_cb_equals_0_1_6000958, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Int32 Java.Lang.Object::n_GetHashCode_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.Lang.Object::GetHashCode()
; Implemented: System.Int32 Android.Runtime.JavaObject::GetHashCode()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_JavaObject_n_1hashCode(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_hashCode_0_1_6000959, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 1, i32 noundef 100665689, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_hashCode_0_1_6000959)
	%cb2 = load ptr, ptr @native_cb_hashCode_0_1_6000959, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.IntPtr Java.Lang.Object::n_ToString_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.String Java.Lang.Object::ToString()
; Implemented: System.String Android.Runtime.JavaObject::ToString()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_mono_android_runtime_JavaObject_n_1toString(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_toString_0_1_600095a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 1, i32 noundef 100665690, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_toString_0_1_600095a)
	%cb2 = load ptr, ptr @native_cb_toString_0_1_600095a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Java.IO.OutputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Close()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_2_60007d1, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 2, i32 noundef 100665297, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_2_60007d1)
	%cb2 = load ptr, ptr @native_cb_close_0_2_60007d1, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Flush_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Flush()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Flush()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1flush(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_flush_0_2_60007d2, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 2, i32 noundef 100665298, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_flush_0_2_60007d2)
	%cb2 = load ptr, ptr @native_cb_flush_0_2_60007d2, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[])
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_60007d3, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 2, i32 noundef 100665299, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_60007d3)
	%cb2 = load ptr, ptr @native_cb_write_0_2_60007d3, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_60007d4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 2, i32 noundef 100665300, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_60007d4)
	%cb2 = load ptr, ptr @native_cb_write_0_2_60007d4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write__I(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_2_60007d5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 2, i32 noundef 100665301, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_2_60007d5)
	%cb2 = load ptr, ptr @native_cb_write_0_2_60007d5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_RunnableImplementor_n_1run(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_3_60009fe, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 3, i32 noundef 100665854, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_3_60009fe)
	%cb2 = load ptr, ptr @native_cb_run_0_3_60009fe, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void Read_Andro.MainActivity::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc647257767dbea74abd_MainActivity_n_1onCreate(ptr noundef %env, ptr noundef %klass, ptr noundef %savedInstanceState) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_4_60005ed, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 4, i32 noundef 100664813, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_4_60005ed)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_4_60005ed, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %savedInstanceState)
	ret void
}

; Method: System.Void Android.App.Service::n_OnCreate_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Service::OnCreate()
; Implemented: System.Void Read_Andro.MyForegroundService::OnCreate()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc647257767dbea74abd_MyForegroundService_n_1onCreate(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_5_6000645, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 5, i32 noundef 100664901, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_5_6000645)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_5_6000645, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Android.App.Service::n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.App.StartCommandResult Android.App.Service::OnStartCommand(Android.Content.Intent,Android.App.StartCommandFlags,System.Int32)
; Implemented: Android.App.StartCommandResult Read_Andro.MyForegroundService::OnStartCommand(Android.Content.Intent,Android.App.StartCommandFlags,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_crc647257767dbea74abd_MyForegroundService_n_1onStartCommand(ptr noundef %env, ptr noundef %klass, ptr noundef %intent, i32 noundef %flags, i32 noundef %startId) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStartCommand_0_5_6000646, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 5, i32 noundef 100664902, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStartCommand_0_5_6000646)
	%cb2 = load ptr, ptr @native_cb_onStartCommand_0_5_6000646, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %intent, i32 noundef %flags, i32 noundef %startId)
	ret i32 %1
}

; Method: System.Void Android.App.Service::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Service::OnDestroy()
; Implemented: System.Void Read_Andro.MyForegroundService::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc647257767dbea74abd_MyForegroundService_n_1onDestroy(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_5_6000647, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 5, i32 noundef 100664903, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_5_6000647)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_5_6000647, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.IntPtr Android.App.Service::n_OnBind_Landroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.OS.IBinder Android.App.Service::OnBind(Android.Content.Intent)
; Implemented: Android.OS.IBinder Read_Andro.MyForegroundService::OnBind(Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc647257767dbea74abd_MyForegroundService_n_1onBind(ptr noundef %env, ptr noundef %klass, ptr noundef %intent) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBind_0_5_6000648, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 5, i32 noundef 100664904, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBind_0_5_6000648)
	%cb2 = load ptr, ptr @native_cb_onBind_0_5_6000648, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %intent)
	ret ptr %1
}

; Method: System.Void Java.Interop.TypeManager/JavaTypeManager::n_Activate_mm(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: none
; Implemented: none
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_TypeManager_n_1activate(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_activate_0_6_6000aab, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 24, i32 noundef 6, i32 noundef 100666027, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_activate_0_6_6000aab)
	%cb2 = load ptr, ptr @native_cb_activate_0_6_6000aab, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr)
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [101 x i8] c"Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.1 = private unnamed_addr constant [98 x i8] c"Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.2 = private unnamed_addr constant [102 x i8] c"Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.3 = private unnamed_addr constant [108 x i8] c"Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.4 = private unnamed_addr constant [102 x i8] c"Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.5 = private unnamed_addr constant [101 x i8] c"Android.App.Service, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.6 = private unnamed_addr constant [122 x i8] c"Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.7 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [34 x i8] c"n_Close_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.1_name = private unnamed_addr constant [33 x i8] c"n_Read_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.2_name = private unnamed_addr constant [47 x i8] c"n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.3_name = private unnamed_addr constant [61 x i8] c"n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.4_name = private unnamed_addr constant [61 x i8] c"n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.5_name = private unnamed_addr constant [40 x i8] c"n_GetHashCode_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.6_name = private unnamed_addr constant [37 x i8] c"n_ToString_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.7_name = private unnamed_addr constant [34 x i8] c"n_Flush_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.8_name = private unnamed_addr constant [48 x i8] c"n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.9_name = private unnamed_addr constant [62 x i8] c"n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.10_name = private unnamed_addr constant [42 x i8] c"n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.11_name = private unnamed_addr constant [32 x i8] c"n_Run_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.12_name = private unnamed_addr constant [64 x i8] c"n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.13_name = private unnamed_addr constant [37 x i8] c"n_OnCreate_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.14_name = private unnamed_addr constant [89 x i8] c"n_OnStartCommand_Landroid_content_Intent_II_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.15_name = private unnamed_addr constant [38 x i8] c"n_OnDestroy_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.16_name = private unnamed_addr constant [67 x i8] c"n_OnBind_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.17_name = private unnamed_addr constant [57 x i8] c"n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.18_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }
attributes #3 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 9a2d211ba972d3a0c4c108e043def432f3ec2620"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
