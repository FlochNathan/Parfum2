; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 25, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [25 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: Read_Andro
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 16384; uint32_t buffer_offset
	}, ; 2: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 33280; uint32_t buffer_offset
	}, ; 3: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 44032; uint32_t buffer_offset
	}, ; 4: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 52224; uint32_t buffer_offset
	}, ; 5: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 60416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 64000; uint32_t buffer_offset
	}, ; 6: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 21504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 124416; uint32_t buffer_offset
	}, ; 7: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 29184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 145920; uint32_t buffer_offset
	}, ; 8: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 8704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 175104; uint32_t buffer_offset
	}, ; 9: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 183808; uint32_t buffer_offset
	}, ; 10: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 197632; uint32_t buffer_offset
	}, ; 11: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 120832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 210944; uint32_t buffer_offset
	}, ; 12: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 37376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 331776; uint32_t buffer_offset
	}, ; 13: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 369152; uint32_t buffer_offset
	}, ; 14: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 69632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 376320; uint32_t buffer_offset
	}, ; 15: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 445952; uint32_t buffer_offset
	}, ; 16: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 66560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 455168; uint32_t buffer_offset
	}, ; 17: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 521728; uint32_t buffer_offset
	}, ; 18: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 122880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 527872; uint32_t buffer_offset
	}, ; 19: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 64512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 650752; uint32_t buffer_offset
	}, ; 20: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 1595392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 715264; uint32_t buffer_offset
	}, ; 21: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 152576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2310656; uint32_t buffer_offset
	}, ; 22: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2463232; uint32_t buffer_offset
	}, ; 23: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 461824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2475008; uint32_t buffer_offset
	} ; 24: Mono.Android
], align 4

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 2936832, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [2936832 x i8] zeroinitializer, align 1

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
