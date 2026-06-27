; ModuleID = 'compressed_assemblies.x86_64.ll'
source_filename = "compressed_assemblies.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 27, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [27 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 25088, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: Read_Andro
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27648; uint32_t buffer_offset
	}, ; 2: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 45056; uint32_t buffer_offset
	}, ; 3: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 55808; uint32_t buffer_offset
	}, ; 4: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 64000; uint32_t buffer_offset
	}, ; 5: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 60416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 76288; uint32_t buffer_offset
	}, ; 6: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 21504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 136704; uint32_t buffer_offset
	}, ; 7: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 89600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 158208; uint32_t buffer_offset
	}, ; 8: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 247808; uint32_t buffer_offset
	}, ; 9: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 253952; uint32_t buffer_offset
	}, ; 10: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 267776; uint32_t buffer_offset
	}, ; 11: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 137728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 281600; uint32_t buffer_offset
	}, ; 12: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 419328; uint32_t buffer_offset
	}, ; 13: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 56832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 439296; uint32_t buffer_offset
	}, ; 14: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 496128; uint32_t buffer_offset
	}, ; 15: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 69632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 503296; uint32_t buffer_offset
	}, ; 16: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 572928; uint32_t buffer_offset
	}, ; 17: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 66560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 582144; uint32_t buffer_offset
	}, ; 18: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 648704; uint32_t buffer_offset
	}, ; 19: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 122880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 655872; uint32_t buffer_offset
	}, ; 20: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 29696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 778752; uint32_t buffer_offset
	}, ; 21: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 143872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 808448; uint32_t buffer_offset
	}, ; 22: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 1649152, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 952320; uint32_t buffer_offset
	}, ; 23: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 152576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2601472; uint32_t buffer_offset
	}, ; 24: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2754048; uint32_t buffer_offset
	}, ; 25: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 477696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2765824; uint32_t buffer_offset
	} ; 26: Mono.Android
], align 16

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 3243520, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [3243520 x i8] zeroinitializer, align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 9a2d211ba972d3a0c4c108e043def432f3ec2620"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
