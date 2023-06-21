--- a/src/CMakeLists.txt	2023-06-21 14:42:00.532715947 +0200
+++ b/src/CMakeLists.txt	2023-06-21 14:42:44.851315117 +0200
@@ -16,3 +16,7 @@
     polylog_cpp
     polylog_fortran
 )
+install(TARGETS polylog
+	LIBRARY DESTINATION lib
+	INCLUDES DESTINATION include
+)
