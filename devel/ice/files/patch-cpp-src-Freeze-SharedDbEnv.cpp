--- cpp.orig/src/Freeze/SharedDbEnv.cpp	2011-06-15 21:43:58.000000000 +0200
+++ cpp/src/Freeze/SharedDbEnv.cpp	2012-03-04 20:14:52.000000000 +0100
@@ -336,8 +336,11 @@
         // Remove from map
         //
      
+#ifndef NDEBUG
         size_t one;
-        one = sharedDbEnvMap->erase(key);
+        one = 
+#endif
+        sharedDbEnvMap->erase(key);
         assert(one == 1);
 
         if(sharedDbEnvMap->size() == 0)
