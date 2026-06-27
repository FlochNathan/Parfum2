; ModuleID = 'typemaps.x86_64.ll'
source_filename = "typemaps.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 3, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 135, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [3 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x37, i8 u0xa4, i8 u0xcb, i8 u0x93, i8 u0xd5, i8 u0x4b, i8 u0x9a, i8 u0x4c, i8 u0x85, i8 u0x8f, i8 u0xa5, i8 u0xeb, i8 u0x83, i8 u0x33, i8 u0xe5, i8 u0x9b ], ; module_uuid: 93cba437-4bd5-4c9a-858f-a5eb8333e59b
		i32 2, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: Read_Andro
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x62, i8 u0x0b, i8 u0x49, i8 u0x12, i8 u0x90, i8 u0xe5, i8 u0x81, i8 u0x4b, i8 u0x87, i8 u0x64, i8 u0x3e, i8 u0xcb, i8 u0x84, i8 u0xc1, i8 u0x04, i8 u0x47 ], ; module_uuid: 12490b62-e590-4b81-8764-3ecb84c10447
		i32 121, ; uint32_t entry_count
		i32 47, ; uint32_t duplicate_count
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xcd, i8 u0xd1, i8 u0x7f, i8 u0x78, i8 u0x22, i8 u0x2f, i8 u0x2b, i8 u0x4d, i8 u0x99, i8 u0xd7, i8 u0x68, i8 u0x44, i8 u0xf2, i8 u0x14, i8 u0x21, i8 u0x99 ], ; module_uuid: 787fd1cd-2f22-4d2b-99d7-6844f2142199
		i32 14, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Java.Interop
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	} ; 2
], align 16

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [135 x i64] [
	i64 u0x013d70f30586d278, ; 0 => javax/net/ssl/KeyManagerFactory
	i64 u0x01cd624f1e38cc9f, ; 1 => java/lang/Byte
	i64 u0x03cc98b851d4262c, ; 2 => javax/net/ssl/SSLContext
	i64 u0x06f84afe4273c430, ; 3 => java/net/InetSocketAddress
	i64 u0x083e83bb2321dd50, ; 4 => java/util/Random
	i64 u0x0b1da699fb29019a, ; 5 => android/os/BaseBundle
	i64 u0x0c44130caa233945, ; 6 => mono/android/runtime/JavaObject
	i64 u0x0d9335f0988cd796, ; 7 => java/util/HashMap
	i64 u0x106be7c89662702e, ; 8 => java/net/Proxy$Type
	i64 u0x10cc64dc53558d33, ; 9 => android/content/ComponentName
	i64 u0x10e015905ca8bd0f, ; 10 => java/security/cert/Certificate
	i64 u0x116532ec07ee0771, ; 11 => java/security/spec/KeySpec
	i64 u0x13e5902d3b855db6, ; 12 => javax/net/ssl/TrustManagerFactory
	i64 u0x194b32fbae047fc7, ; 13 => net/dot/jni/internal/JavaProxyObject
	i64 u0x1a21d3a35faba2b2, ; 14 => crc647257767dbea74abd/MainActivity
	i64 u0x1e549855226528a2, ; 15 => java/io/InterruptedIOException
	i64 u0x1e69018626ef9ffb, ; 16 => android/os/Handler
	i64 u0x1eef7492beaf81e2, ; 17 => android/os/IInterface
	i64 u0x21b381333982058e, ; 18 => javax/net/SocketFactory
	i64 u0x225c20a45cb91cd7, ; 19 => java/lang/Error
	i64 u0x2bcca4a8219ac237, ; 20 => javax/security/cert/X509Certificate
	i64 u0x2bead3961bcf92a8, ; 21 => android/os/VibrationEffect
	i64 u0x2ff9fb2c70f4f954, ; 22 => java/lang/SecurityException
	i64 u0x32d6a1d6ee9f6d5a, ; 23 => android/content/Intent
	i64 u0x332031975eda7654, ; 24 => java/lang/Boolean
	i64 u0x3436cf09b45d055e, ; 25 => java/security/Principal
	i64 u0x35e989807a64bcd9, ; 26 => java/lang/IllegalStateException
	i64 u0x3611feb7c92af67a, ; 27 => android/content/SharedPreferences$Editor
	i64 u0x39f1c81500ddb55b, ; 28 => [F
	i64 u0x406e54c64b3bee74, ; 29 => android/runtime/JavaProxyThrowable
	i64 u0x41d091ef7039ab94, ; 30 => java/net/URLConnection
	i64 u0x4209344bc1b095c1, ; 31 => java/net/ProtocolException
	i64 u0x4930daf7c10ff422, ; 32 => android/app/Notification$Builder
	i64 u0x4a39213a97fe1b2f, ; 33 => java/net/ConnectException
	i64 u0x4f858ea9c9162f43, ; 34 => android/os/IBinder
	i64 u0x5181b129b1a25949, ; 35 => java/lang/Class
	i64 u0x5238ad63b58da994, ; 36 => java/lang/ClassCastException
	i64 u0x529da4201fa0d461, ; 37 => net/dot/jni/internal/JavaProxyThrowable
	i64 u0x529e559bd64e4c22, ; 38 => javax/net/ssl/HttpsURLConnection
	i64 u0x53ead18b9df3fcb2, ; 39 => android/os/IBinder$FrozenStateChangeCallback
	i64 u0x543ee7a3edd80785, ; 40 => android/app/Notification
	i64 u0x551ac881eb4466c0, ; 41 => java/lang/Number
	i64 u0x560a92597b121e00, ; 42 => [C
	i64 u0x56365290d5a06704, ; 43 => java/lang/LinkageError
	i64 u0x57e37830b49b24af, ; 44 => android/app/NotificationChannel
	i64 u0x57fe4a40460344db, ; 45 => android/os/Build$VERSION
	i64 u0x5a6af884fe3c181e, ; 46 => android/os/Bundle
	i64 u0x5bfd65ae1a6e6ffc, ; 47 => android/app/Activity
	i64 u0x5f5a9fc3430795a4, ; 48 => android/content/ContextWrapper
	i64 u0x5f7e709faf8646e0, ; 49 => java/lang/Short
	i64 u0x61428f9f249ac534, ; 50 => [Z
	i64 u0x6219335ac57fb821, ; 51 => java/io/Serializable
	i64 u0x65f6b14b7e978927, ; 52 => java/io/IOException
	i64 u0x6aa7d9af28b4551f, ; 53 => java/net/SocketTimeoutException
	i64 u0x6e0fb15bd0f04d15, ; 54 => java/lang/StackTraceElement
	i64 u0x714152b8b4c7f7d6, ; 55 => java/security/KeyFactory
	i64 u0x720cd712e1248c34, ; 56 => java/util/Iterator
	i64 u0x75591c18ddf5e52d, ; 57 => mono/android/TypeManager
	i64 u0x76cbd2104dd555ed, ; 58 => android/content/Context
	i64 u0x7b3aeb75b65cbd49, ; 59 => java/security/spec/PKCS8EncodedKeySpec
	i64 u0x7b90c42bde036cae, ; 60 => [I
	i64 u0x7b925bdca68a0101, ; 61 => java/util/ArrayList
	i64 u0x7c93df30f68cf9a7, ; 62 => javax/security/auth/Subject
	i64 u0x7e201ad40955df46, ; 63 => android/os/Parcel
	i64 u0x7fc6286783d5249d, ; 64 => java/security/Key
	i64 u0x7fd6b531797aa365, ; 65 => java/net/URL
	i64 u0x83314b5931a387fb, ; 66 => android/widget/Toast
	i64 u0x84f94178aab6cc34, ; 67 => java/lang/CharSequence
	i64 u0x888700b03d541d93, ; 68 => java/lang/RuntimeException
	i64 u0x88f7510c649f4a97, ; 69 => java/io/InputStream
	i64 u0x8a1927818aa18084, ; 70 => javax/net/ssl/KeyManager
	i64 u0x8a3ea3c274e8ce68, ; 71 => java/lang/Character
	i64 u0x90b4aeb45636cd6a, ; 72 => mono/android/runtime/OutputStreamAdapter
	i64 u0x92188d393e2af2d2, ; 73 => java/lang/Throwable
	i64 u0x92b59c839bc46278, ; 74 => java/lang/Thread
	i64 u0x965bfaf1ff1da014, ; 75 => java/lang/ReflectiveOperationException
	i64 u0x98ba110c6c57da31, ; 76 => java/lang/Float
	i64 u0x99df91bab800c287, ; 77 => mono/android/runtime/InputStreamAdapter
	i64 u0x9a68fa465ca8abf9, ; 78 => java/io/FileDescriptor
	i64 u0x9e10a0b3efa170dc, ; 79 => android/view/ContextThemeWrapper
	i64 u0x9e6dc3e8eedaf8a8, ; 80 => java/net/SocketException
	i64 u0x9fa1370a1b1093fa, ; 81 => java/lang/NullPointerException
	i64 u0x9fffe5ad5d77dedd, ; 82 => android/os/Vibrator
	i64 u0xa07cbd8408019386, ; 83 => java/net/Proxy
	i64 u0xa40f7c253430103d, ; 84 => crc647257767dbea74abd/MyForegroundService
	i64 u0xa59db4b8b7dbe046, ; 85 => javax/net/ssl/SSLSession
	i64 u0xa865adbdd81d9951, ; 86 => java/io/OutputStream
	i64 u0xa86f66387eaee170, ; 87 => android/content/SharedPreferences
	i64 u0xa95eae500754348a, ; 88 => java/net/SocketAddress
	i64 u0xaa75ead031784774, ; 89 => javax/net/ssl/SSLSocketFactory
	i64 u0xabc3cd0f40f748aa, ; 90 => java/lang/String
	i64 u0xac9902bb0e4c5217, ; 91 => java/lang/IllegalArgumentException
	i64 u0xacaf4fe23af1f72a, ; 92 => [S
	i64 u0xacbf549cdef93bef, ; 93 => java/net/HttpURLConnection
	i64 u0xada6872f699d2ae8, ; 94 => [J
	i64 u0xb02badeb1c97535c, ; 95 => java/lang/Integer
	i64 u0xb18d71343ca8e96f, ; 96 => java/lang/Exception
	i64 u0xb6c4749da9477c3a, ; 97 => [B
	i64 u0xb77aae9e2e13bfcc, ; 98 => android/app/Service
	i64 u0xb9e48b25660487c5, ; 99 => javax/net/ssl/TrustManager
	i64 u0xbb84ccbe48f6c18b, ; 100 => android/os/Looper
	i64 u0xbf6d427143271cb3, ; 101 => java/lang/Object
	i64 u0xc00f4c2f11efdcff, ; 102 => java/lang/ClassNotFoundException
	i64 u0xc2a8e50a5f08afc6, ; 103 => mono/java/lang/RunnableImplementor
	i64 u0xc3eb0cbb47f178b9, ; 104 => java/lang/Enum
	i64 u0xca35caf567cfa745, ; 105 => java/util/Collection
	i64 u0xca754b77efc8606b, ; 106 => android/app/NotificationManager
	i64 u0xcc306823503920e9, ; 107 => android/app/Application
	i64 u0xd1b288a9c7bb8f53, ; 108 => java/lang/Double
	i64 u0xd2fc750314fd2213, ; 109 => [D
	i64 u0xd5a28b8fa6d48e71, ; 110 => android/os/Build
	i64 u0xdd812f1d4afa427b, ; 111 => java/lang/UnsupportedOperationException
	i64 u0xde36efb42da7cc2d, ; 112 => javax/net/ssl/SSLSessionContext
	i64 u0xdfabd9351f4351a6, ; 113 => [Ljava/lang/Object;
	i64 u0xe024b538ad65ea66, ; 114 => java/util/function/Consumer
	i64 u0xe0446bf91fb0c2dd, ; 115 => java/lang/NoClassDefFoundError
	i64 u0xe1b3c5871398eb28, ; 116 => java/nio/channels/FileChannel
	i64 u0xe28cd0a2e6de00c1, ; 117 => java/security/KeyStore
	i64 u0xe38528954b158fff, ; 118 => java/util/concurrent/Executor
	i64 u0xe59c130e7d1e4ac3, ; 119 => java/security/SecureRandom
	i64 u0xe5abbaa9de37d34b, ; 120 => net/dot/jni/ManagedPeer
	i64 u0xeb82145dcac4c559, ; 121 => java/lang/Long
	i64 u0xed3bf28f37177c87, ; 122 => android/content/SharedPreferences$OnSharedPreferenceChangeListener
	i64 u0xed49ed70aa9be1b3, ; 123 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 u0xee58348f4c4ad939, ; 124 => javax/net/ssl/HostnameVerifier
	i64 u0xee6f3d1e7507d907, ; 125 => java/util/Enumeration
	i64 u0xef2f2996a1d369cc, ; 126 => java/io/FileInputStream
	i64 u0xf11f22a6441fcfbc, ; 127 => java/lang/IndexOutOfBoundsException
	i64 u0xf3d4ab08aaf25ccb, ; 128 => java/net/UnknownServiceException
	i64 u0xf85cbededb432844, ; 129 => java/security/spec/EncodedKeySpec
	i64 u0xfb9a51a22eb2843f, ; 130 => javax/security/cert/Certificate
	i64 u0xfbe9bfa5cc50fed6, ; 131 => java/util/HashSet
	i64 u0xfd2b1a3de667eb51, ; 132 => java/lang/Runnable
	i64 u0xfd45cc49d3236300, ; 133 => android/os/IBinder$DeathRecipient
	i64 u0xfebf2b77f1940e7e ; 134 => java/security/PrivateKey
], align 16

@module0_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000002, ; uint32_t type_token_id
		i32 14; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	} ; 1
], align 16

@module1_managed_to_java = internal dso_local constant [121 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000064, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000071, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000074, ; uint32_t type_token_id
		i32 12; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000075, ; uint32_t type_token_id
		i32 66; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000078, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 5; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 110; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000084, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000086, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000087, ; uint32_t type_token_id
		i32 63; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000089, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000b0, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x020000be, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 23; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x020000c8, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x020000ca, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x020000ce, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 47; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020000dc, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020000de, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020000ec, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 65; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020000f2, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000f4, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000f6, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 117; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 119; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020000fd, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020000ff, ; uint32_t type_token_id
		i32 59; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x02000100, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x02000102, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x02000104, ; uint32_t type_token_id
		i32 123; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x02000106, ; uint32_t type_token_id
		i32 78; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x02000107, ; uint32_t type_token_id
		i32 126; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x02000108, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 15; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x02000110, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x02000112, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x02000114, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x02000115, ; uint32_t type_token_id
		i32 114; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x02000117, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x02000119, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 71; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x0200011c, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x0200011d, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x0200011e, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000120, ; uint32_t type_token_id
		i32 76; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x02000121, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x02000122, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000123, ; uint32_t type_token_id
		i32 121; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x02000124, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x02000125, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000126, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x02000127, ; uint32_t type_token_id
		i32 90; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x02000129, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 103; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x0200012b, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x0200012c, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x0200012f, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x02000132, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x02000133, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x02000134, ; uint32_t type_token_id
		i32 127; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x02000135, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x02000137, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x02000138, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x02000139, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 22; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 111; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x0200014e, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	} ; 120
], align 16

@module1_managed_to_java_duplicates = internal dso_local constant [47 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000063, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000065, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000082, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000085, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000a4, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000af, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000c9, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000cd, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000cf, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000df, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000f5, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000f7, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000101, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000103, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000105, ; uint32_t type_token_id
		i32 123; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000109, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000111, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000113, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000116, ; uint32_t type_token_id
		i32 114; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000118, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x0200012e, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000130, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000136, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x0200013b, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	} ; 46
], align 16

@module2_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 28; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 37; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000085, ; uint32_t type_token_id
		i32 120; uint32_t java_map_index
	} ; 13
], align 16

@module2_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	} ; 1
], align 16

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [135 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000070, ; uint32_t type_token_id
		i32 10; uint32_t java_name_index
	}, ; 0
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 88; uint32_t java_name_index
	}, ; 1
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000071, ; uint32_t type_token_id
		i32 11; uint32_t java_name_index
	}, ; 2
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 53; uint32_t java_name_index
	}, ; 3
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000114, ; uint32_t type_token_id
		i32 84; uint32_t java_name_index
	}, ; 4
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 17; uint32_t java_name_index
	}, ; 5
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b0, ; uint32_t type_token_id
		i32 33; uint32_t java_name_index
	}, ; 6
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 31; uint32_t java_name_index
	}, ; 7
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 56; uint32_t java_name_index
	}, ; 8
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c8, ; uint32_t type_token_id
		i32 39; uint32_t java_name_index
	}, ; 9
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000100, ; uint32_t type_token_id
		i32 72; uint32_t java_name_index
	}, ; 10
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 70; uint32_t java_name_index
	}, ; 11
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000074, ; uint32_t type_token_id
		i32 13; uint32_t java_name_index
	}, ; 12
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 132; uint32_t java_name_index
	}, ; 13
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000002, ; uint32_t type_token_id
		i32 121; uint32_t java_name_index
	}, ; 14
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 78; uint32_t java_name_index
	}, ; 15
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000077, ; uint32_t type_token_id
		i32 15; uint32_t java_name_index
	}, ; 16
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 24; uint32_t java_name_index
	}, ; 17
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 3; uint32_t java_name_index
	}, ; 18
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200012f, ; uint32_t type_token_id
		i32 107; uint32_t java_name_index
	}, ; 19
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 1; uint32_t java_name_index
	}, ; 20
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000089, ; uint32_t type_token_id
		i32 27; uint32_t java_name_index
	}, ; 21
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 117; uint32_t java_name_index
	}, ; 22
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 38; uint32_t java_name_index
	}, ; 23
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000119, ; uint32_t type_token_id
		i32 87; uint32_t java_name_index
	}, ; 24
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 64; uint32_t java_name_index
	}, ; 25
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000133, ; uint32_t type_token_id
		i32 109; uint32_t java_name_index
	}, ; 26
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 41; uint32_t java_name_index
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 130; uint32_t java_name_index
	}, ; 28
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 34; uint32_t java_name_index
	}, ; 29
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 62; uint32_t java_name_index
	}, ; 30
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 54; uint32_t java_name_index
	}, ; 31
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 47; uint32_t java_name_index
	}, ; 32
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 51; uint32_t java_name_index
	}, ; 33
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 22; uint32_t java_name_index
	}, ; 34
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011c, ; uint32_t type_token_id
		i32 90; uint32_t java_name_index
	}, ; 35
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200012c, ; uint32_t type_token_id
		i32 105; uint32_t java_name_index
	}, ; 36
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 133; uint32_t java_name_index
	}, ; 37
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000064, ; uint32_t type_token_id
		i32 4; uint32_t java_name_index
	}, ; 38
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 23; uint32_t java_name_index
	}, ; 39
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 46; uint32_t java_name_index
	}, ; 40
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 115; uint32_t java_name_index
	}, ; 41
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 126; uint32_t java_name_index
	}, ; 42
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000137, ; uint32_t type_token_id
		i32 112; uint32_t java_name_index
	}, ; 43
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000dc, ; uint32_t type_token_id
		i32 49; uint32_t java_name_index
	}, ; 44
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 19; uint32_t java_name_index
	}, ; 45
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 20; uint32_t java_name_index
	}, ; 46
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 44; uint32_t java_name_index
	}, ; 47
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ca, ; uint32_t type_token_id
		i32 40; uint32_t java_name_index
	}, ; 48
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000126, ; uint32_t type_token_id
		i32 100; uint32_t java_name_index
	}, ; 49
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000026, ; uint32_t type_token_id
		i32 124; uint32_t java_name_index
	}, ; 50
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 80; uint32_t java_name_index
	}, ; 51
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 79; uint32_t java_name_index
	}, ; 52
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 59; uint32_t java_name_index
	}, ; 53
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 118; uint32_t java_name_index
	}, ; 54
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 66; uint32_t java_name_index
	}, ; 55
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 83; uint32_t java_name_index
	}, ; 56
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200014e, ; uint32_t type_token_id
		i32 120; uint32_t java_name_index
	}, ; 57
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 37; uint32_t java_name_index
	}, ; 58
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ff, ; uint32_t type_token_id
		i32 71; uint32_t java_name_index
	}, ; 59
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000032, ; uint32_t type_token_id
		i32 128; uint32_t java_name_index
	}, ; 60
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 32; uint32_t java_name_index
	}, ; 61
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000061, ; uint32_t type_token_id
		i32 2; uint32_t java_name_index
	}, ; 62
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000087, ; uint32_t type_token_id
		i32 26; uint32_t java_name_index
	}, ; 63
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 63; uint32_t java_name_index
	}, ; 64
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 61; uint32_t java_name_index
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000075, ; uint32_t type_token_id
		i32 14; uint32_t java_name_index
	}, ; 66
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 95; uint32_t java_name_index
	}, ; 67
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000125, ; uint32_t type_token_id
		i32 99; uint32_t java_name_index
	}, ; 68
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000108, ; uint32_t type_token_id
		i32 77; uint32_t java_name_index
	}, ; 69
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 6; uint32_t java_name_index
	}, ; 70
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 89; uint32_t java_name_index
	}, ; 71
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000be, ; uint32_t type_token_id
		i32 36; uint32_t java_name_index
	}, ; 72
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200012b, ; uint32_t type_token_id
		i32 104; uint32_t java_name_index
	}, ; 73
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000129, ; uint32_t type_token_id
		i32 102; uint32_t java_name_index
	}, ; 74
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 116; uint32_t java_name_index
	}, ; 75
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000120, ; uint32_t type_token_id
		i32 94; uint32_t java_name_index
	}, ; 76
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 29; uint32_t java_name_index
	}, ; 77
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000106, ; uint32_t type_token_id
		i32 75; uint32_t java_name_index
	}, ; 78
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 28; uint32_t java_name_index
	}, ; 79
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ec, ; uint32_t type_token_id
		i32 58; uint32_t java_name_index
	}, ; 80
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000139, ; uint32_t type_token_id
		i32 114; uint32_t java_name_index
	}, ; 81
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000078, ; uint32_t type_token_id
		i32 16; uint32_t java_name_index
	}, ; 82
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 55; uint32_t java_name_index
	}, ; 83
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 122; uint32_t java_name_index
	}, ; 84
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 7; uint32_t java_name_index
	}, ; 85
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 81; uint32_t java_name_index
	}, ; 86
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 43; uint32_t java_name_index
	}, ; 87
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 57; uint32_t java_name_index
	}, ; 88
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000072, ; uint32_t type_token_id
		i32 12; uint32_t java_name_index
	}, ; 89
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000127, ; uint32_t type_token_id
		i32 101; uint32_t java_name_index
	}, ; 90
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000132, ; uint32_t type_token_id
		i32 108; uint32_t java_name_index
	}, ; 91
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 127; uint32_t java_name_index
	}, ; 92
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 52; uint32_t java_name_index
	}, ; 93
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000035, ; uint32_t type_token_id
		i32 129; uint32_t java_name_index
	}, ; 94
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000122, ; uint32_t type_token_id
		i32 96; uint32_t java_name_index
	}, ; 95
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 93; uint32_t java_name_index
	}, ; 96
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 125; uint32_t java_name_index
	}, ; 97
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000de, ; uint32_t type_token_id
		i32 50; uint32_t java_name_index
	}, ; 98
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 9; uint32_t java_name_index
	}, ; 99
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000086, ; uint32_t type_token_id
		i32 25; uint32_t java_name_index
	}, ; 100
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000124, ; uint32_t type_token_id
		i32 98; uint32_t java_name_index
	}, ; 101
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011d, ; uint32_t type_token_id
		i32 91; uint32_t java_name_index
	}, ; 102
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 103; uint32_t java_name_index
	}, ; 103
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 106; uint32_t java_name_index
	}, ; 104
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 30; uint32_t java_name_index
	}, ; 105
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 48; uint32_t java_name_index
	}, ; 106
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 45; uint32_t java_name_index
	}, ; 107
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200011e, ; uint32_t type_token_id
		i32 92; uint32_t java_name_index
	}, ; 108
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 131; uint32_t java_name_index
	}, ; 109
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 18; uint32_t java_name_index
	}, ; 110
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 119; uint32_t java_name_index
	}, ; 111
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 8; uint32_t java_name_index
	}, ; 112
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 123; uint32_t java_name_index
	}, ; 113
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 85; uint32_t java_name_index
	}, ; 114
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000138, ; uint32_t type_token_id
		i32 113; uint32_t java_name_index
	}, ; 115
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000102, ; uint32_t type_token_id
		i32 73; uint32_t java_name_index
	}, ; 116
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 67; uint32_t java_name_index
	}, ; 117
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 86; uint32_t java_name_index
	}, ; 118
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 68; uint32_t java_name_index
	}, ; 119
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000085, ; uint32_t type_token_id
		i32 134; uint32_t java_name_index
	}, ; 120
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000123, ; uint32_t type_token_id
		i32 97; uint32_t java_name_index
	}, ; 121
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 42; uint32_t java_name_index
	}, ; 122
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000104, ; uint32_t type_token_id
		i32 74; uint32_t java_name_index
	}, ; 123
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 5; uint32_t java_name_index
	}, ; 124
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 82; uint32_t java_name_index
	}, ; 125
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000107, ; uint32_t type_token_id
		i32 76; uint32_t java_name_index
	}, ; 126
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000134, ; uint32_t type_token_id
		i32 110; uint32_t java_name_index
	}, ; 127
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 60; uint32_t java_name_index
	}, ; 128
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 69; uint32_t java_name_index
	}, ; 129
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 0; uint32_t java_name_index
	}, ; 130
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 35; uint32_t java_name_index
	}, ; 131
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 111; uint32_t java_name_index
	}, ; 132
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 21; uint32_t java_name_index
	}, ; 133
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 65; uint32_t java_name_index
	} ; 134
], align 16

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [135 x ptr] [
	ptr @.tmr.0, ; 0 ('javax/security/cert/Certificate')
	ptr @.tmr.1, ; 1 ('javax/security/cert/X509Certificate')
	ptr @.tmr.2, ; 2 ('javax/security/auth/Subject')
	ptr @.tmr.3, ; 3 ('javax/net/SocketFactory')
	ptr @.tmr.4, ; 4 ('javax/net/ssl/HttpsURLConnection')
	ptr @.tmr.5, ; 5 ('javax/net/ssl/HostnameVerifier')
	ptr @.tmr.6, ; 6 ('javax/net/ssl/KeyManager')
	ptr @.tmr.7, ; 7 ('javax/net/ssl/SSLSession')
	ptr @.tmr.8, ; 8 ('javax/net/ssl/SSLSessionContext')
	ptr @.tmr.9, ; 9 ('javax/net/ssl/TrustManager')
	ptr @.tmr.10, ; 10 ('javax/net/ssl/KeyManagerFactory')
	ptr @.tmr.11, ; 11 ('javax/net/ssl/SSLContext')
	ptr @.tmr.12, ; 12 ('javax/net/ssl/SSLSocketFactory')
	ptr @.tmr.13, ; 13 ('javax/net/ssl/TrustManagerFactory')
	ptr @.tmr.14, ; 14 ('android/widget/Toast')
	ptr @.tmr.15, ; 15 ('android/os/Handler')
	ptr @.tmr.16, ; 16 ('android/os/Vibrator')
	ptr @.tmr.17, ; 17 ('android/os/BaseBundle')
	ptr @.tmr.18, ; 18 ('android/os/Build')
	ptr @.tmr.19, ; 19 ('android/os/Build$VERSION')
	ptr @.tmr.20, ; 20 ('android/os/Bundle')
	ptr @.tmr.21, ; 21 ('android/os/IBinder$DeathRecipient')
	ptr @.tmr.22, ; 22 ('android/os/IBinder')
	ptr @.tmr.23, ; 23 ('android/os/IBinder$FrozenStateChangeCallback')
	ptr @.tmr.24, ; 24 ('android/os/IInterface')
	ptr @.tmr.25, ; 25 ('android/os/Looper')
	ptr @.tmr.26, ; 26 ('android/os/Parcel')
	ptr @.tmr.27, ; 27 ('android/os/VibrationEffect')
	ptr @.tmr.28, ; 28 ('android/view/ContextThemeWrapper')
	ptr @.tmr.29, ; 29 ('mono/android/runtime/InputStreamAdapter')
	ptr @.tmr.30, ; 30 ('java/util/Collection')
	ptr @.tmr.31, ; 31 ('java/util/HashMap')
	ptr @.tmr.32, ; 32 ('java/util/ArrayList')
	ptr @.tmr.33, ; 33 ('mono/android/runtime/JavaObject')
	ptr @.tmr.34, ; 34 ('android/runtime/JavaProxyThrowable')
	ptr @.tmr.35, ; 35 ('java/util/HashSet')
	ptr @.tmr.36, ; 36 ('mono/android/runtime/OutputStreamAdapter')
	ptr @.tmr.37, ; 37 ('android/content/Context')
	ptr @.tmr.38, ; 38 ('android/content/Intent')
	ptr @.tmr.39, ; 39 ('android/content/ComponentName')
	ptr @.tmr.40, ; 40 ('android/content/ContextWrapper')
	ptr @.tmr.41, ; 41 ('android/content/SharedPreferences$Editor')
	ptr @.tmr.42, ; 42 ('android/content/SharedPreferences$OnSharedPreferenceChangeListener')
	ptr @.tmr.43, ; 43 ('android/content/SharedPreferences')
	ptr @.tmr.44, ; 44 ('android/app/Activity')
	ptr @.tmr.45, ; 45 ('android/app/Application')
	ptr @.tmr.46, ; 46 ('android/app/Notification')
	ptr @.tmr.47, ; 47 ('android/app/Notification$Builder')
	ptr @.tmr.48, ; 48 ('android/app/NotificationManager')
	ptr @.tmr.49, ; 49 ('android/app/NotificationChannel')
	ptr @.tmr.50, ; 50 ('android/app/Service')
	ptr @.tmr.51, ; 51 ('java/net/ConnectException')
	ptr @.tmr.52, ; 52 ('java/net/HttpURLConnection')
	ptr @.tmr.53, ; 53 ('java/net/InetSocketAddress')
	ptr @.tmr.54, ; 54 ('java/net/ProtocolException')
	ptr @.tmr.55, ; 55 ('java/net/Proxy')
	ptr @.tmr.56, ; 56 ('java/net/Proxy$Type')
	ptr @.tmr.57, ; 57 ('java/net/SocketAddress')
	ptr @.tmr.58, ; 58 ('java/net/SocketException')
	ptr @.tmr.59, ; 59 ('java/net/SocketTimeoutException')
	ptr @.tmr.60, ; 60 ('java/net/UnknownServiceException')
	ptr @.tmr.61, ; 61 ('java/net/URL')
	ptr @.tmr.62, ; 62 ('java/net/URLConnection')
	ptr @.tmr.63, ; 63 ('java/security/Key')
	ptr @.tmr.64, ; 64 ('java/security/Principal')
	ptr @.tmr.65, ; 65 ('java/security/PrivateKey')
	ptr @.tmr.66, ; 66 ('java/security/KeyFactory')
	ptr @.tmr.67, ; 67 ('java/security/KeyStore')
	ptr @.tmr.68, ; 68 ('java/security/SecureRandom')
	ptr @.tmr.69, ; 69 ('java/security/spec/EncodedKeySpec')
	ptr @.tmr.70, ; 70 ('java/security/spec/KeySpec')
	ptr @.tmr.71, ; 71 ('java/security/spec/PKCS8EncodedKeySpec')
	ptr @.tmr.72, ; 72 ('java/security/cert/Certificate')
	ptr @.tmr.73, ; 73 ('java/nio/channels/FileChannel')
	ptr @.tmr.74, ; 74 ('java/nio/channels/spi/AbstractInterruptibleChannel')
	ptr @.tmr.75, ; 75 ('java/io/FileDescriptor')
	ptr @.tmr.76, ; 76 ('java/io/FileInputStream')
	ptr @.tmr.77, ; 77 ('java/io/InputStream')
	ptr @.tmr.78, ; 78 ('java/io/InterruptedIOException')
	ptr @.tmr.79, ; 79 ('java/io/IOException')
	ptr @.tmr.80, ; 80 ('java/io/Serializable')
	ptr @.tmr.81, ; 81 ('java/io/OutputStream')
	ptr @.tmr.82, ; 82 ('java/util/Enumeration')
	ptr @.tmr.83, ; 83 ('java/util/Iterator')
	ptr @.tmr.84, ; 84 ('java/util/Random')
	ptr @.tmr.85, ; 85 ('java/util/function/Consumer')
	ptr @.tmr.86, ; 86 ('java/util/concurrent/Executor')
	ptr @.tmr.87, ; 87 ('java/lang/Boolean')
	ptr @.tmr.88, ; 88 ('java/lang/Byte')
	ptr @.tmr.89, ; 89 ('java/lang/Character')
	ptr @.tmr.90, ; 90 ('java/lang/Class')
	ptr @.tmr.91, ; 91 ('java/lang/ClassNotFoundException')
	ptr @.tmr.92, ; 92 ('java/lang/Double')
	ptr @.tmr.93, ; 93 ('java/lang/Exception')
	ptr @.tmr.94, ; 94 ('java/lang/Float')
	ptr @.tmr.95, ; 95 ('java/lang/CharSequence')
	ptr @.tmr.96, ; 96 ('java/lang/Integer')
	ptr @.tmr.97, ; 97 ('java/lang/Long')
	ptr @.tmr.98, ; 98 ('java/lang/Object')
	ptr @.tmr.99, ; 99 ('java/lang/RuntimeException')
	ptr @.tmr.100, ; 100 ('java/lang/Short')
	ptr @.tmr.101, ; 101 ('java/lang/String')
	ptr @.tmr.102, ; 102 ('java/lang/Thread')
	ptr @.tmr.103, ; 103 ('mono/java/lang/RunnableImplementor')
	ptr @.tmr.104, ; 104 ('java/lang/Throwable')
	ptr @.tmr.105, ; 105 ('java/lang/ClassCastException')
	ptr @.tmr.106, ; 106 ('java/lang/Enum')
	ptr @.tmr.107, ; 107 ('java/lang/Error')
	ptr @.tmr.108, ; 108 ('java/lang/IllegalArgumentException')
	ptr @.tmr.109, ; 109 ('java/lang/IllegalStateException')
	ptr @.tmr.110, ; 110 ('java/lang/IndexOutOfBoundsException')
	ptr @.tmr.111, ; 111 ('java/lang/Runnable')
	ptr @.tmr.112, ; 112 ('java/lang/LinkageError')
	ptr @.tmr.113, ; 113 ('java/lang/NoClassDefFoundError')
	ptr @.tmr.114, ; 114 ('java/lang/NullPointerException')
	ptr @.tmr.115, ; 115 ('java/lang/Number')
	ptr @.tmr.116, ; 116 ('java/lang/ReflectiveOperationException')
	ptr @.tmr.117, ; 117 ('java/lang/SecurityException')
	ptr @.tmr.118, ; 118 ('java/lang/StackTraceElement')
	ptr @.tmr.119, ; 119 ('java/lang/UnsupportedOperationException')
	ptr @.tmr.120, ; 120 ('mono/android/TypeManager')
	ptr @.tmr.121, ; 121 ('crc647257767dbea74abd/MainActivity')
	ptr @.tmr.122, ; 122 ('crc647257767dbea74abd/MyForegroundService')
	ptr @.tmr.123, ; 123 ('[Ljava/lang/Object;')
	ptr @.tmr.124, ; 124 ('[Z')
	ptr @.tmr.125, ; 125 ('[B')
	ptr @.tmr.126, ; 126 ('[C')
	ptr @.tmr.127, ; 127 ('[S')
	ptr @.tmr.128, ; 128 ('[I')
	ptr @.tmr.129, ; 129 ('[J')
	ptr @.tmr.130, ; 130 ('[F')
	ptr @.tmr.131, ; 131 ('[D')
	ptr @.tmr.132, ; 132 ('net/dot/jni/internal/JavaProxyObject')
	ptr @.tmr.133, ; 133 ('net/dot/jni/internal/JavaProxyThrowable')
	ptr @.tmr.134 ; 134 ('net/dot/jni/ManagedPeer')
], align 16

; Strings
@.tmr.0 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 16
@.tmr.1 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 16
@.tmr.2 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 16
@.tmr.3 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 16
@.tmr.4 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 16
@.tmr.5 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 16
@.tmr.6 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 16
@.tmr.7 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 16
@.tmr.8 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 16
@.tmr.9 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 16
@.tmr.10 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 16
@.tmr.11 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 16
@.tmr.12 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 16
@.tmr.13 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 16
@.tmr.14 = private unnamed_addr constant [21 x i8] c"android/widget/Toast\00", align 16
@.tmr.15 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 16
@.tmr.16 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 16
@.tmr.17 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 16
@.tmr.18 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 16
@.tmr.19 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 16
@.tmr.20 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 16
@.tmr.21 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 16
@.tmr.22 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 16
@.tmr.23 = private unnamed_addr constant [45 x i8] c"android/os/IBinder$FrozenStateChangeCallback\00", align 16
@.tmr.24 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 16
@.tmr.25 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 16
@.tmr.26 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 16
@.tmr.27 = private unnamed_addr constant [27 x i8] c"android/os/VibrationEffect\00", align 16
@.tmr.28 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 16
@.tmr.29 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 16
@.tmr.30 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 16
@.tmr.31 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 16
@.tmr.32 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 16
@.tmr.33 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 16
@.tmr.34 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 16
@.tmr.35 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 16
@.tmr.36 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 16
@.tmr.37 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 16
@.tmr.38 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 16
@.tmr.39 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 16
@.tmr.40 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 16
@.tmr.41 = private unnamed_addr constant [41 x i8] c"android/content/SharedPreferences$Editor\00", align 16
@.tmr.42 = private unnamed_addr constant [67 x i8] c"android/content/SharedPreferences$OnSharedPreferenceChangeListener\00", align 16
@.tmr.43 = private unnamed_addr constant [34 x i8] c"android/content/SharedPreferences\00", align 16
@.tmr.44 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 16
@.tmr.45 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 16
@.tmr.46 = private unnamed_addr constant [25 x i8] c"android/app/Notification\00", align 16
@.tmr.47 = private unnamed_addr constant [33 x i8] c"android/app/Notification$Builder\00", align 16
@.tmr.48 = private unnamed_addr constant [32 x i8] c"android/app/NotificationManager\00", align 16
@.tmr.49 = private unnamed_addr constant [32 x i8] c"android/app/NotificationChannel\00", align 16
@.tmr.50 = private unnamed_addr constant [20 x i8] c"android/app/Service\00", align 16
@.tmr.51 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 16
@.tmr.52 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 16
@.tmr.53 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 16
@.tmr.54 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 16
@.tmr.55 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.tmr.56 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 16
@.tmr.57 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 16
@.tmr.58 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 16
@.tmr.59 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 16
@.tmr.60 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 16
@.tmr.61 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.tmr.62 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 16
@.tmr.63 = private unnamed_addr constant [18 x i8] c"java/security/Key\00", align 16
@.tmr.64 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 16
@.tmr.65 = private unnamed_addr constant [25 x i8] c"java/security/PrivateKey\00", align 16
@.tmr.66 = private unnamed_addr constant [25 x i8] c"java/security/KeyFactory\00", align 16
@.tmr.67 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 16
@.tmr.68 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 16
@.tmr.69 = private unnamed_addr constant [34 x i8] c"java/security/spec/EncodedKeySpec\00", align 16
@.tmr.70 = private unnamed_addr constant [27 x i8] c"java/security/spec/KeySpec\00", align 16
@.tmr.71 = private unnamed_addr constant [39 x i8] c"java/security/spec/PKCS8EncodedKeySpec\00", align 16
@.tmr.72 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 16
@.tmr.73 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 16
@.tmr.74 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 16
@.tmr.75 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 16
@.tmr.76 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 16
@.tmr.77 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 16
@.tmr.78 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 16
@.tmr.79 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 16
@.tmr.80 = private unnamed_addr constant [21 x i8] c"java/io/Serializable\00", align 16
@.tmr.81 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 16
@.tmr.82 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 16
@.tmr.83 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 16
@.tmr.84 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 16
@.tmr.85 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 16
@.tmr.86 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 16
@.tmr.87 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 16
@.tmr.88 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.tmr.89 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 16
@.tmr.90 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 16
@.tmr.91 = private unnamed_addr constant [33 x i8] c"java/lang/ClassNotFoundException\00", align 16
@.tmr.92 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 16
@.tmr.93 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 16
@.tmr.94 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 16
@.tmr.95 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 16
@.tmr.96 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 16
@.tmr.97 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.tmr.98 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 16
@.tmr.99 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 16
@.tmr.100 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 16
@.tmr.101 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 16
@.tmr.102 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 16
@.tmr.103 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 16
@.tmr.104 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 16
@.tmr.105 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 16
@.tmr.106 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.tmr.107 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 16
@.tmr.108 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 16
@.tmr.109 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 16
@.tmr.110 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 16
@.tmr.111 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 16
@.tmr.112 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 16
@.tmr.113 = private unnamed_addr constant [31 x i8] c"java/lang/NoClassDefFoundError\00", align 16
@.tmr.114 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 16
@.tmr.115 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 16
@.tmr.116 = private unnamed_addr constant [39 x i8] c"java/lang/ReflectiveOperationException\00", align 16
@.tmr.117 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 16
@.tmr.118 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 16
@.tmr.119 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 16
@.tmr.120 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 16
@.tmr.121 = private unnamed_addr constant [35 x i8] c"crc647257767dbea74abd/MainActivity\00", align 16
@.tmr.122 = private unnamed_addr constant [42 x i8] c"crc647257767dbea74abd/MyForegroundService\00", align 16
@.tmr.123 = private unnamed_addr constant [20 x i8] c"[Ljava/lang/Object;\00", align 16
@.tmr.124 = private unnamed_addr constant [3 x i8] c"[Z\00", align 1
@.tmr.125 = private unnamed_addr constant [3 x i8] c"[B\00", align 1
@.tmr.126 = private unnamed_addr constant [3 x i8] c"[C\00", align 1
@.tmr.127 = private unnamed_addr constant [3 x i8] c"[S\00", align 1
@.tmr.128 = private unnamed_addr constant [3 x i8] c"[I\00", align 1
@.tmr.129 = private unnamed_addr constant [3 x i8] c"[J\00", align 1
@.tmr.130 = private unnamed_addr constant [3 x i8] c"[F\00", align 1
@.tmr.131 = private unnamed_addr constant [3 x i8] c"[D\00", align 1
@.tmr.132 = private unnamed_addr constant [37 x i8] c"net/dot/jni/internal/JavaProxyObject\00", align 16
@.tmr.133 = private unnamed_addr constant [40 x i8] c"net/dot/jni/internal/JavaProxyThrowable\00", align 16
@.tmr.134 = private unnamed_addr constant [24 x i8] c"net/dot/jni/ManagedPeer\00", align 16

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [11 x i8] c"Read_Andro\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [13 x i8] c"Java.Interop\00", align 1

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
